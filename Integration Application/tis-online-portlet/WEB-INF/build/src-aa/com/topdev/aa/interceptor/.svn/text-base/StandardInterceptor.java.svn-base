package com.topdev.aa.interceptor;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Date;
import java.util.Iterator;
import java.util.Map;

import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.client.BerechtigungProxy;
import com.topdev.aa.data.BobjPrincipal;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Default;
import com.topdev.aa.object.TopdevPrincipal;

public class StandardInterceptor implements Interceptor
{
	public	static final String portalParameterPrefix	= "LIFERAY_SHARED_";
	public	static final String guestLoginId			= "10110";
	private static final long	serialVersionUID		= 1L;
	private	Log log = LogFactory.getLog(this.getClass());
	private boolean debug = true;
	public void destroy()	{	}
	public void init()		{	}

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception
	{
		log.debug("intercept "+this.getClass().getSimpleName());
		final ActionContext	context		= invocation.getInvocationContext ();

		Map<String, Object>	sessionMap	= context.getSession();
		Map<String, Object>	requestMap	= (Map<String, Object>) context.get("request");
		RenderRequest	renderRequest	= (RenderRequest)	context.get("struts.portlet.request");
		RenderResponse	renderResponse	= (RenderResponse)	context.get("struts.portlet.response");
		HttpServletRequest	request		= (HttpServletRequest)	context.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse	response	= (HttpServletResponse)	context.get(StrutsStatics.HTTP_RESPONSE);

		Default defaultAction = (Default)invocation.getAction();
		defaultAction.setSession(sessionMap);
		defaultAction.setContext(context);
		if(requestMap!=null)
		{
			String tspi = (String) requestMap.get(portalParameterPrefix+"tspi");
			if(tspi!=null && tspi.length()>0) defaultAction.setTspi(tspi);
			String tspm = (String) requestMap.get(portalParameterPrefix+"tspm");
			if(tspm!=null && tspm.length()>0) defaultAction.setTspm(tspm);
		}

		if(response!=null) response.setContentType("text/html; charset=UTF-8");
		if(request!=null)
		{
			HttpSession session = request.getSession(true);
			if(session!=null)
			{
				if(session.isNew()) session.setAttribute("sessionReinitTime", (new Date()).getTime());
//				if(request.getSession(true).isNew()) return "SessionEndException";
				defaultAction.setSessionId(session.getId());
				defaultAction.setHttpSession(session);
				defaultAction.setSession(context.getSession());
			}

		}
		if(renderRequest!=null) defaultAction.setPortletSession(renderRequest.getPortletSession());
		
		return invocation.invoke();
	}
	
	public static void checkAuthorisation(String loginId, Default action) throws Exception
	{
		Log log = LogFactory.getLog("checkAuthorisation");
		try
		{

			if(!Validator.empty(loginId) && !Validator.equals(loginId, guestLoginId))
			{
				if(action.getSessionAttribute("userPrincipal")==null)
				{
					action.setSessionAttribute("userPrincipal", createPrincipal(loginId));
//					System.out.println("creating principal2 for s:"+action.getSessionId());
//					BerechtigungProxy.getPrincipal(loginId, action.getSessionId());
				}
			}
			else action.setSessionAttribute("userPrincipal", null);
			
			action.setSessionAttribute("loginId", loginId);
			log.info("iiiiiiiiiiiiiii: loginId:"+action.getSessionAttribute("loginId")+" userPrincipal:"+action.getSessionAttribute("userPrincipal"));
		}
		catch(Exception ex)
		{
			log.error("Action "+action.getClass().getName()+" konnte vom PortletInterceptor nicht aufbereitet/autorisiert werden:\n"+ex.getLocalizedMessage());
			throw ex;
		}
	}
	
	@SuppressWarnings("unchecked")
	protected String handleError(Map request, String s)
	{
		Log log = LogFactory.getLog(this.getClass());
		request.put("error", s);
		log.error(s);
		return "error-div";
	}

	@SuppressWarnings("unchecked")
	protected Object getSessionAttribute(ActionContext context, String name)
	{
		Map<String, Object>	sessionMap	= context.getSession();
		Iterator<String> it = sessionMap.keySet().iterator();
		while(it.hasNext())
		{
			String t1 = it.next();
			String t2 = t1;
			int index = t2.indexOf("?");
			if(index>0) t2 = t2.substring(index+1, t2.length());
//			System.out.println("getSessionAttribute::"+t2+"="+sessionMap.get(t1));
			if(t2.equals(name)) return sessionMap.get(t1);
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	protected void setSessionAttribute(ActionContext context, String name, Object value)
	{
		context.getSession().put(name, value);
	}
	
	protected static TopdevPrincipal createPrincipal(String loginId)
	{
		Log log = LogFactory.getLog("StandardInterceptor.createPrincipal()");
		log.info("Erstelle principal anhand von:"+loginId);
		TopdevPrincipal	tp			= new TopdevPrincipal(loginId);
		Connection		connection	= null;
		SqlProcedure	p			= null;
		try
		{
			connection 		= SqlProcedure.getDataSource().getConnection();
			
			p = new SqlProcedure("psp_CheckAuthorisation");
			p.setString(	"@SESSION_ID", 		"none");
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
}