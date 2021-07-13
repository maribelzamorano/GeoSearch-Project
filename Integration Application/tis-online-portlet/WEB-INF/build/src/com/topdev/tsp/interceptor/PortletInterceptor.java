package com.topdev.tsp.interceptor;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.portlet.context.PortletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.object.TopdevPrincipal;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class PortletInterceptor implements Interceptor
{
	private static final long	serialVersionUID	= 1L;
	private	Log log = LogFactory.getLog(this.getClass());

	public void destroy()	{	}

	public void init()		{	}

	private TopdevPrincipal createPrincipal(String loginId, String sessionId)
	{
		
		log.info("Erstelle principal anhand von:"+loginId+" -> "+sessionId);
		//log.info("Erstelle principal anhand von:"+principal.+" -> "+sessionId);
		TopdevPrincipal	tp			= new TopdevPrincipal(loginId);
		Connection		connection	= null;
		SqlProcedure	p			= null;
		try
		{
			connection 		= SqlProcedure.getDataSource().getConnection();
			
			p = new SqlProcedure("psp_CheckAuthorisation");
			p.setString(	"@SESSION_ID", 		sessionId);
			p.setOut(		"@RC",				Types.INTEGER);
			p.setOut(		"@SQL_ERROR",		Types.INTEGER);
			p.setOut(		"@RC_TEXT",			Types.VARCHAR);
			p.setString(	"@login_name",		loginId);

			p.setOut(		"@GEPA_ID",			Types.INTEGER);
			p.setOut(		"@GPAR_CODE",		Types.INTEGER);
			p.setOut(		"@GEPA_XNAME_12",	Types.VARCHAR);
			p.setOut(		"@GEPA_ID_SERVICE",	Types.INTEGER);
			
			p.execute(connection);
			String error = p.getErrorString();
			if(error==null) 
			{
				tp.setLoginId(	loginId);
				tp.setId(		p.getStringParameter("@GEPA_ID"));
				tp.setName12(	p.getStringParameter("@GEPA_XNAME_12"));
				tp.setGparCode(	p.getStringParameter("@GPAR_CODE"));
				tp.setDienId(	p.getStringParameter("@GEPA_ID_SERVICE"));
			}
			else tp = null;
			p.close();
		}
		catch(SQLException sqlEx)	{ tp = null; log.error("Datenbankfehler: "+sqlEx.getLocalizedMessage()); }
		finally						{ SqlProcedure.closeConnection(connection); }

		return tp;
	}
	
	public String intercept(ActionInvocation invocation) throws Exception
	{
		try
		{
			BasicActionSupport	action	= (BasicActionSupport)invocation.getAction();
			RenderRequest		request	= PortletActionContext.getRenderRequest();
			PortletSession		session	= request.getPortletSession(true);
			action.setPortletSession(session);
			action.setSessionId(session.getId());
			
			if(action.getSessionObject("userPrincipal")==null && request.getUserPrincipal()!=null)
			{
				String loginId = (String) request.getAttribute(BasicActionSupport.portalParameterPrefix+"login_name");
//				System.out.println("loginId:"+	loginId);
				TopdevPrincipal tp = createPrincipal(loginId, session.getId());
				//if(tp==null) throw new Exception("Principal konnte nicht erzeugt werden. ("+request.getUserPrincipal()+")");
				action.setSessionObject("userPrincipal",tp);
				action.setPrincipal(tp);
				log.info("Principal erfolgreich erzeugt User:"+action.getPrincipal().getName());
				action.getSessionBean().removeViewAttributes(session.getId());
			}
			else if(request.getUserPrincipal()!=null)
			{
				action.setPrincipal((TopdevPrincipal) action.getSessionObject("userPrincipal"));
			}
			if(action.getParm("tspi",false)!=null)
			{
				action.setTspi(action.getParm("tspi"));
				action.setTspm(action.getParm("tspm", false));
			}
			
			if(action.getTspi()!=null && action.getTspi().length()>0)
			{
				action.getSessionBean().setAttribute(action.getSessionId(), BasicActionSupport.portalParameterPrefix+"tspi", action.getTspi());
			}
		}
		catch(Exception ex)
		{
			log.error("Action "+invocation.getAction()+" konnte vom PortletInterceptor nicht aufbereitet werden:\n"+ex.getLocalizedMessage());
			throw ex;
		}
		return invocation.invoke();
	}
}