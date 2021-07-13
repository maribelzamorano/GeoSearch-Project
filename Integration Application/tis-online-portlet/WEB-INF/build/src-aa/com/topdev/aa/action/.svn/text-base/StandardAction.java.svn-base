package com.topdev.aa.action;

import java.io.IOException;
import java.util.Locale;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.util.MessageResources;

import com.topdev.aa.exception.SessionEndException;
import com.topdev.aa.object.GlobalContainer;


/**
 * @author hannesweichel
 * Fuer die Klasse StandardAction ist derzeit noch keine Dokumentation vorhanden.<br>
 * 
 */
public class StandardAction extends Action 
{
//	public HttpSession session;
	public Locale locale;

	/**
	 * Attribute zum Zugriff auf die application.properties bzw. den fuer die Anwendung zur verfuegung stehenden Texten.
	 */
	public MessageResources messages;
	
	/**
	 * Globaler @see GlobalContainer der Alle relevanten Anwendungsobject
	 */
	public GlobalContainer gc;
	
	private Log log = LogFactory.getLog(this.getClass());
	private HttpServletResponse response=null;

	public static String getSessionId(HttpSession session)
	{
		if(session==null) return "";
		if(session.getAttribute(CasLoginAction.casTicketName) == null)
			return "";
		else
			return (String) session.getAttribute(CasLoginAction.casTicketName);
	}

	public DataSource getDataSource(HttpServletRequest request, String key)
	{
		DataSource ds = null;
		try
		{
			Context initCtx	= new InitialContext();
			Context envCtx	= (Context)		initCtx.lookup("java:comp/env");
			ds 				= (DataSource)	envCtx.lookup("jdbc/TDS");
			if(ds==null) throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		} catch (Exception ex)
		{ log.error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); }
		return ds;
	}

	public DataSource getDataSource()
	{
		DataSource ds = null;
		try
		{
			Context initCtx	= new InitialContext();
			Context envCtx	= (Context)		initCtx.lookup("java:comp/env");
			ds 				= (DataSource)	envCtx.lookup("jdbc/TDS");
			if(ds==null) throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		} catch (Exception ex)
		{ log.error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); }
		return ds;
	}

	
    public String toOsPath(String pPath)
    {
		if(System.getProperty("file.separator").equals("\\")) pPath.replaceAll("/","\\\\");
		else pPath.replaceAll("\\\\","/");

		return pPath;
    }

	public boolean empty(Object o)
	{
		if(o!=null) 
			if(!String.valueOf(o).equals("")) 
				if(!String.valueOf(o).equals("0"))
					return false;
		return true;
	}

	public String getDerivat()
	{
		String derivat = String.valueOf(getServlet().getServletContext().getAttribute("derivat"));
		if(derivat==null) derivat = "thillm";
		return derivat;
	}

	public static void setCaching(ServletContext sc, ActionMapping mapping, HttpServletResponse response)
	{
		try
    	{
    		Properties p = (Properties) sc.getAttribute("cachings");
    		if(p.getProperty(mapping.getPath())!=null)
    		{
    	    	response.setHeader("Cache-Control", "public");
    	    	response.setHeader("Last-Modified", p.getProperty("buildDate"));
    		}
    		else response.setHeader("Cache-Control", "max-age=0, must-revalidate, no-cache");
    	}
    	catch(Exception ex) { System.out.println("Fehler (cache-setting) bei request-mapping:\n"+ex.toString()); }
	}
	public static boolean checkSecurity(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		HttpSession session = request.getSession();
		if(session==null) return true;
		String user = (String)session.getAttribute(edu.yale.its.tp.cas.client.filter.CASFilter.CAS_FILTER_USER);
		if(user==null || user.length()<1) return true;
		//System.out.println("+-+ USER:"+user);
		if(session.getAttribute(CasLoginAction.casTicketName)==null)
		{
			response.sendRedirect("/cas/login?service=http://localhost/tis-online-mbjs/cas-login.do");
			return false;
		}
		else return true;
	}
    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
    	if(!checkSecurity(request, response)) return null;
    	setCaching(getServlet().getServletContext(), mapping, response);
		request.setAttribute("mappingParameter",	mapping.getParameter());
		HttpSession session = request.getSession(true);
		
		request.setAttribute("derivat", getDerivat());

		if(session.getAttribute("container")!=null)
		{
			this.locale 	= getLocale(request);
			this.messages 	= getResources(request);
			this.gc=new GlobalContainer(this.servlet.getServletContext(),locale);
			if(session.getAttribute("container")!=null)
				this.gc = (GlobalContainer) session.getAttribute("container");
			log.debug("["+getSessionId(session)+"]@"+mapping.getPath());
		}
		else
		{
			boolean throwException = true;
			if(mapping.getPath()!=null)
			{
				if(	mapping.getPath().equals("/ram") ||
					mapping.getPath().equals("/init"))
					throwException = false;
			}
			
			if(throwException)
			{
				//session.invalidate();
				throw new SessionEndException("Eine Session ist beim mapping-aufruf("+mapping.getPath()+") abgelaufen.");
			}
		}
		return run(mapping, form, request, response, session);
    }
    
    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return null
     * @throws Exception
     * Diese Methode ist von den abgeleiteten Action-Klassen zu ueberschreiben! 
     * Die {@link #execute}-Methode zu ueberschreiben, ist zwar auch moeglich, dies sollte aber dringend vermieden werden.
     */
    public ActionForward run(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		return run(mapping, form, request, response);
	}
	
    /**
     * @param mapping
     * @param form
     * @param request
     * @param response
     * @return null
     * @throws Exception
	 * @deprecated Bitte die Methode mit dem zusaetzlichen Parameter session ueberschreiben (Thread savety)
     */
	public ActionForward run(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		return null;
	}
	
	
	
}