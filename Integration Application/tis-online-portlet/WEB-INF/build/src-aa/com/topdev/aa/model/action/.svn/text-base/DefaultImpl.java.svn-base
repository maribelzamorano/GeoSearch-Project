package com.topdev.aa.model.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletSession;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.client.AnlaProxy;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.object.TopdevPrincipal;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DefaultImpl implements Default
{
	private static final long	serialVersionUID	= 1L;
	private Log log	= LogFactory.getLog(this.getClass());
	Map<String, Object>	session;
	PortletSession		portletSession;
	HttpSession			httpSession;
	private String		mode;
	private String		tspi;
	private String		tspm;
	private String		vsid		= "none";
	private String		sessionId	= "none";
	private List<String> errors	= new ArrayList<String>(2);
	private String		userName = null;
	ActionContext		context;
	
	public Object getSessionAttribute(String key)
	{
		throw new UnsupportedOperationException("Die Methode getSessionAttribute ist von abgeleiteter Klasse zu implementieren");
	}
	
	public String getUserName()
	{
		if(userName!=null) return userName;
		TopdevPrincipal tp = ((TopdevPrincipal) getSessionAttribute("userPrincipal"));
		if(tp!=null) userName = tp.getName();
		if(Validator.empty(userName)) userName= (String)getSessionAttribute("userName");
		if(Validator.empty(userName)) userName = "";
		return userName;
	}

	public void setSessionAttribute(String key, Object value)
	{
		throw new UnsupportedOperationException("Die Methode setSessionAttribute ist von abgeleiteter Klasse zu implementieren");
	}

	public void storeSessionObject(Object obj)
	{
		if(obj==null) throw new NullPointerException("Das zu speichernde Sitzungsobjekt darf nicht [null] sein.");
		setSessionAttribute(obj.getClass().getName(), obj);
	}

	@SuppressWarnings("unchecked")
	public Object getSessionObject(Class c)
	{
		if(c==null) throw new NullPointerException("Das zu ladende Sitzungsobjekt darf nicht [null] sein.");
		return getSessionAttribute(c.getName());
	}
	public static String initDownload(String TBSH_ID, String TBSH_SHORTNAME, String sessionId, String userName) throws Exception
	{
		String			ANLA_ID		= null;
		String			ANLA_NAME	= null;
		String			error		= null;
		Connection		connection	= null;
		try
		{
			connection = BasicActionSupport.getConnection();
			SqlProcedure p = new SqlProcedure("psp_ANLA_Download", sessionId);
			p.setInt(	"@TBSH_ID",			TBSH_ID);
			p.setString("@TBSH_SHORTNAME",	TBSH_SHORTNAME);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null && rs.next())
			{
				ANLA_ID = rs.getString("ANLA_ID");
				ANLA_NAME = rs.getString("ANLA_NAME");
				rs.close();
			}
			p.finalizeResults();
			error = p.getErrorString();
			p.close();
		}
		catch(SQLException e)
		{
			error = e.getLocalizedMessage();
			while((e = e.getNextException())!=null) error+=e.getLocalizedMessage();
		}
		finally { SqlProcedure.closeConnection(connection); }
		if(error!=null)
		{
			throw new Exception(error);
		}
		System.out.println("initDownload ANLA_ID:"+ANLA_ID);
		try
		{
			if(ANLA_ID!=null) return AnlaProxy.getDownloadUrlById(userName, sessionId, ANLA_ID);
		}
		catch(Exception ex) { }
		
		return "/services/download/virtual/ANLA_"+ANLA_ID+"_ANLA/"+ANLA_NAME+"?ANLA_ID="+ANLA_ID;
	}

	public String initDownload(String TBSH_ID, String TBSH_SHORTNAME) throws Exception
	{
		return initDownload(TBSH_ID, TBSH_SHORTNAME, getSessionId(), getUserName());
	}
	
	public Log getLog()
	{
		return log;
	}
	public void setLog(Log log)
	{
		this.log = log;
	}
	public String getMode()
	{
		return mode;
	}
	public void setMode(String mode)
	{
		this.mode = mode;
	}
	public String getSessionId()
	{
		return sessionId;
	}
	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}
	public String getVsid()
	{
		return vsid;
	}
	public void setVsid(String vsid)
	{
		this.vsid = vsid;
	}
	public Map<String, Object> getSession()
	{
		return session;
	}
	public void setSession(Map<String, Object> session)
	{
		this.session = session;
	}
	public List<String> getErrors()
	{
		return errors;
	}
	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}
	public String getTspi()
	{
		return tspi;
	}
	public void setTspi(String tspi)
	{
		this.tspi = tspi;
	}

	public PortletSession getPortletSession()
	{
		return portletSession;
	}

	public void setPortletSession(PortletSession portletSession)
	{
		this.portletSession = portletSession;
	}

	public HttpSession getHttpSession()
	{
		return httpSession;
	}

	public void setHttpSession(HttpSession httpSession)
	{
		this.httpSession = httpSession;
	}

	public String getTspm()
	{
		return tspm;
	}

	public void setTspm(String tspm)
	{
		this.tspm = tspm;
	}

	public ActionContext getContext()
	{
		return context;
	}

	public void setContext(ActionContext context)
	{
		this.context = context;
	}
	
}