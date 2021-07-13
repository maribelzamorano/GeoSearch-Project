package com.topdev.tsp.action.basic;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.MissingResourceException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.portlet.PortletSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.apache.struts2.portlet.context.PortletActionContext;
import org.jdom.JDOMException;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.topdev.aa.action.CasLoginAction;
import com.topdev.aa.action.StandardAction;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.filter.RedirectFilter;
import com.topdev.aa.object.TopdevPrincipal;
import com.topdev.aa.object.User;
import com.topdev.tsp.action.lib.Converter;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.aop.ConfigurationBean;
import com.topdev.tsp.model.aop.SessionBean;
import com.topdev.tsp.model.aop.TextBean;

import edu.yale.its.tp.cas.client.filter.CASFilter;


public class BasicActionSupport extends ActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public	static final String portalParameterPrefix = "LIFERAY_SHARED_";
	public Log					log = LogFactory.getLog(this.getClass());
	private TopdevPrincipal		principal;
	private String				sessionId;
	private int					mode = 2;	//2=view 1=edit
	private int					style;
	private String				ajaxId;
	private SessionBean			sessionBean	= null;
	private ConfigurationBean	configurationBean	= null;
	private TextBean			textBean	= null;
	private List<String>		rtErrors	= new ArrayList<String>(2);
	private String				aktion;
	public	PortletSession		portletSession;
	private String				tspi;
	private String				tspm;
	private String				vsid;
	private String				friendlyUrlPrefix = "/web/guest";

	public String doImplicitRefresh() throws Exception
	{
		System.out.println("default doImplicitRefresh()");
		return null;
	}
	public String getSessionSize()
	{
		return Converter.formatFileSize(getSessionBean().getSessionSize(getSessionId()));
	}

	public String getSessionBeanSize()
	{
		return Converter.formatFileSize(getSessionBean().getSize());
	}
	public String getRealPath(String path)
	{
		return ServletActionContext.getServletContext().getRealPath(path);
	}
	public String getConfig(String configParameter)
	{
		if(ServletActionContext.getServletContext()!=null && ServletActionContext.getServletContext().getInitParameter(configParameter)!=null)
			return ServletActionContext.getServletContext().getInitParameter(configParameter);
		else
		{
			log.error("Konfigurationselement nicht gefunden: "+configParameter);
			return null;
		}
	}
	public boolean empty(String s)
	{
		if(s!=null && s.length()>0) return false;
		return true;
	}
	@Override
	public String execute() throws Exception
	{
		return SUCCESS;
	}

	public void addError(String msg)
	{
		if(getRtErrors()!=null) getRtErrors().add(msg);
	}

    public String getParm(String name) throws PermissionException
    {
    	return getParm(name, true);
    }

    public String getParm(String name, boolean buffering) throws PermissionException
    {
    	String result = (String)getAttribute(portalParameterPrefix+name);
    	if(!buffering) return result;

    	if(empty(result))
    	{
    		result = (String) getSessionBean().getAttribute(sessionId, portalParameterPrefix+name);
    		setAttribute(portalParameterPrefix+name, result);
    	}
    	else getSessionBean().setAttribute(sessionId, portalParameterPrefix+name, result);
    	return result;
    }
    public String getText(String key)
    {
    	String result = "";
    	try
    	{
    		result = getTextBean().getText(key);
    	}
    	catch(Exception e)
    	{
    		System.out.println(e.getLocalizedMessage());
    	}
    	if(result==null || result.length()<1) result = "???"+key+"???";
    	return result;
    }
    public String getText(String ns, String key)
    {
    	String result = "";
    	try
    	{
    		try
    		{
    			result = getTextBean().getText(ns+"."+key);
    		}
    		catch(MissingResourceException mre)
    		{
    			result = getTextBean().getText("global."+key);
    		}
    	}
    	catch(Exception e)
    	{
    		log.error("Text ["+ns+"."+key+"] konnte nicht geladen werden: " +e.getLocalizedMessage());
    	}
    	if(result==null || result.length()<1) result = "???"+ns+"."+key+"???";
    	
    	return result;
    }
    public String getSessionAttribute(String name)
    {
    	Object o = getSessionBean().getAttribute(sessionId, name);
    	if(o!=null) return (String) o;
    	else return null;
    }
    public Object getSessionObject(String name)
    {
    	Object o = getSessionBean().getAttribute(sessionId, name);
    	if(o!=null) return o;
    	else return null;
    }
    public void setSessionAttribute(String name, String value) throws PermissionException
    {
    	getSessionBean().setAttribute(sessionId, name, value);
    }
    public void setSessionObject(String name, Object value) throws PermissionException
    {
    	getSessionBean().setAttribute(sessionId, name, value);
    }
	
	public static DataSource getDataSource()
	{
		DataSource ds = null;
		try
		{
			Context initCtx	= new InitialContext();
			Context envCtx	= (Context)		initCtx.lookup("java:comp/env");
			ds 				= (DataSource)	envCtx.lookup("jdbc/TDS");
			if(ds==null) throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		} catch (Exception ex)
		{ LogFactory.getLog("getDataSource()").error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); }
		return ds;
	}
	
	public static Connection getConnection() throws SQLException
	{
		return getDataSource().getConnection();
	}
	
	public String getParameter(String name)
	{
		String result = null;
		Object o;
		if(PortletActionContext.getRequest()!=null && PortletActionContext.getRequest().getParameter(name)!=null)
			result = PortletActionContext.getRequest().getParameter(name);

		if( 		result==null
				&& ActionContext.getContext()!=null
				&& ActionContext.getContext().getParameters()!=null
				&& ActionContext.getContext().getParameters().get(name)!=null)
		{
			o = ActionContext.getContext().getParameters().get(name);
			if(o.getClass().isInstance(new String[0]))
			{
				if(((String[])o).length > 0)
					result = ((String[])o)[0];
			}
			else if(o.getClass().isInstance(new String()))
			{
				result = (String)o;
			}
		}
		if(result == null) result="";
		return result;
	}
	
	public Object getAttribute(String name)
	{
		Object result = null;
		if(PortletActionContext.getRequest()!=null && PortletActionContext.getRequest().getAttribute(name)!=null)
			result = PortletActionContext.getRequest().getAttribute(name);
		return result;
	}
	
	public void setAttribute(String name, Object o)
	{
		if(PortletActionContext.getRequest()!=null )
			 PortletActionContext.getRequest().setAttribute(name, o);
	}
	public void setPortalAttribute(String name, Object o)
	{
		if(PortletActionContext.getRequest()!=null )
			 PortletActionContext.getRequest().setAttribute(portalParameterPrefix+name, o);
	}
	
	@SuppressWarnings("unchecked")
	public String[] getSpecificParameterNames(String prefix)
	{
		List<String>		names	= new ArrayList<String>();
		Iterator<String>	keys	= ActionContext.getContext().getParameters().keySet().iterator();
		while(keys.hasNext())
		{
			String key = keys.next();
			if(key!=null && key.startsWith(prefix))
				names.add(key.substring(prefix.length()));
		}
		return names.toArray(new String[0]);
	}
	
	public String[] getParameters(String name)
	{
		String[] result = null;

		if( 		result==null
				&& ActionContext.getContext()!=null
				&& ActionContext.getContext().getParameters()!=null
				&& ActionContext.getContext().getParameters().get(name)!=null
				&& ((String[])ActionContext.getContext().getParameters().get(name)).length > 0)
			result = ((String[])ActionContext.getContext().getParameters().get(name));
		if(result == null) result = new String[0];
		return result;
	}
	public String getActionParameter(String name)
	{
		try
		{
			return (String) ActionContext.getContext().getParameters().get(name);
		}
		catch(Exception e) 
		{
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public HashMap<String, String> getActionParameters()
	{
		HashMap<String,String> map = new HashMap<String, String>(10);
		Map<String, String[]> t_map = ActionContext.getContext().getParameters();
		String key = null;
		String[] s = null;
		try
		{
			Iterator<String> it = t_map.keySet().iterator();
			while(it.hasNext())
			{
				try
				{
					key = (String) it.next();
					s = t_map.get(key);
					if(s!=null && s.length>0)
						map.put(key, s[0]);
				} catch (Exception e1)
				{
					log.debug("Fehler bei Parameterauswertung (01): "+e1.getLocalizedMessage());
				}
			}
		} catch(Exception e2)
		{
			log.debug("Fehler bei Parameterauswertung (02): "+e2.getLocalizedMessage());
		}
		return map;
	}
	
	public static boolean checkSecurity(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		if(session==null) return true;
		String user = (String)session.getAttribute(CASFilter.CAS_FILTER_USER);
		if(user==null || user.length()<1) return true;
		if(session.getAttribute(CasLoginAction.casTicketName)==null)
		{
			response.sendRedirect("/cas/login?service=http://localhost/tis-online-mbjs/cas-login.do");
			return false;
		}
		else return true;
	}


	public void registerUser(HttpSession session) throws SQLException, JDOMException, IOException
	{
		User 		user		= new User();
    	Connection	connection	= null;
		try
		{
			connection 		= getDataSource().getConnection();
			SqlProcedure p 	= new SqlProcedure("psp_GetPermissions");
			p.setOut(		"@RC",				Types.INTEGER);
			p.setOut(		"@SQL_ERROR",		Types.INTEGER);
			p.setOut(		"@RC_TEXT",			Types.INTEGER);
			p.setOut(		"@GEPA_ID",			Types.INTEGER);
			
			p.setString(	"@SESSION_ID", 		StandardAction.getSessionId(session));
			p.setInt(		"@KZ_GEPA",			1);
			p.setInt(		"@RAISERROR_GEPA",	1);
			
			p.execute(connection);
			p.finalizeResults();
			if(p.getStringParameter("@RC").equals("0"))
			{
		    	user.gepa_id		= p.getStringParameter("@GEPA_ID");
			}
			else
			{
				session.setAttribute("user", null);
			}
			p.close();
			p 	= new SqlProcedure("psp_GEPA_ALLGEMEIN");
			p.setOut(		"@RC",				Types.INTEGER);
			p.setOut(		"@SQL_ERROR",		Types.INTEGER);
			p.setOut(		"@RC_TEXT",			Types.INTEGER);

	    	p.setString(	"@SESSION_ID", 		StandardAction.getSessionId(session));
			p.setInt(		"@GEPA_ID",			user.gepa_id);
			
			p.execute(connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null && rs.next())
			{
		    	user.gepa_name_12	= rs.getString("GEPA_NAME_1")+", "+rs.getString("GEPA_NAME_2");
		    	user.gpar_code		= rs.getString("GPAR_CODE");
		    	user.gpar_decode	= rs.getString("GPAR_DECODE");
				session.setAttribute("user", user);
			}
			p.finalizeResults();
			
		}
		finally { if(connection!=null) SqlProcedure.closeConnection(connection); }
		
		RedirectFilter.showAttributes(session);
    }

	public TopdevPrincipal getPrincipal()
	{
		return principal;
	}
	public String getUserName()
	{
		if(getPrincipal()!=null)
			return getPrincipal().getName();
		else return "";
	}
	
	public void setPrincipal(TopdevPrincipal principal)
	{
		this.principal = principal;
	}

	public String getSessionId()
	{
		return sessionId;
	}

	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}

	public int getMode() throws PermissionException
	{
		String modeName = "model."+getParm("anwf")+"."+getParm("option")+"#mode";
		if(getSessionAttribute(modeName)!=null && getSessionAttribute(modeName).equals("1"))
			mode = 1;
		else mode = 2;
		return mode;
	}

	public void setMode(int mode) throws PermissionException
	{
		String modeName = "model."+getParm("anwf")+"."+getParm("option")+"#mode";
		setSessionAttribute( modeName, String.valueOf(mode) );
	}

	public int getStyle()
	{
		return style;
	}

	public void setStyle(int style)
	{
		this.style = style;
	}

	public SessionBean getSessionBean()
	{
		return sessionBean;
	}

	public void setSessionBean(SessionBean sessionBean)
	{
		this.sessionBean = sessionBean;
	}
	public TextBean getTextBean()
	{
		return textBean;
	}
	public void setTextBean(TextBean textBean)
	{
		this.textBean = textBean;
	}

	public String getAjaxId()
	{
		if(ajaxId!=null) return ajaxId;
		if(getParameter("ajaxId")!=null) return getParameter("ajaxId");
		return (String) ActionContext.getContext().get("ajaxId");
	}

	public void setAjaxId(String ajaxId)
	{
		this.ajaxId = ajaxId;
	}

	public List<String> getRtErrors()
	{
		return rtErrors;
	}

	public void setRtErrors(List<String> rtErrors)
	{
		this.rtErrors = rtErrors;
	}

	public String getAktion()
	{
		return aktion;
	}

	public void setAktion(String aktion)
	{
		this.aktion = aktion;
	}
	public PortletSession getPortletSession()
	{
		return portletSession;
	}
	public void setPortletSession(PortletSession portletSession)
	{
		this.portletSession = portletSession;
	}
	public ConfigurationBean getConfigurationBean()
	{
		return configurationBean;
	}
	public void setConfigurationBean(ConfigurationBean configurationBean)
	{
		this.configurationBean = configurationBean;
	}
	public String getTspi()
	{
		return tspi;
	}
	public void setTspi(String tspi)
	{
		this.tspi = tspi;
	}
	public String getTspm()
	{
		return tspm;
	}
	public void setTspm(String tspm)
	{
		this.tspm = tspm;
	}
	public String getVsid()
	{
		return vsid;
	}
	public void setVsid(String vsid)
	{
		this.vsid = vsid;
	}
	public String getFriendlyUrlPrefix()
	{
		return friendlyUrlPrefix;
	}
	public void setFriendlyUrlPrefix(String friendlyUrlPrefix)
	{
		this.friendlyUrlPrefix = friendlyUrlPrefix;
	}
}