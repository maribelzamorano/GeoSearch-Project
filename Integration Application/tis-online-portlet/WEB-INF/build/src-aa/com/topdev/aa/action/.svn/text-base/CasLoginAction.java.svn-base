package com.topdev.aa.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
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
import org.jdom.JDOMException;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.object.User;

public	final	class	CasLoginAction extends Action 
{
	public static final String casTicketName = "casTicket";
    private Log log = LogFactory.getLog(this.getClass());
	private HttpServletResponse response=null;

	public DataSource getDataSource(HttpServletRequest request, String key)
	{
		return getDataSource();
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

    public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		HttpSession session = request.getSession(true);
		if(StandardAction.getSessionId(session).length()>0) registerUser(session, request.getParameter("ticket"));
		response.sendRedirect(request.getRequestURI());
		return null;
    }
    
    private void registerUser(HttpSession session, String ticket) throws SQLException, JDOMException, IOException
    {
    	session.setAttribute(casTicketName, ticket);
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
		finally { if(connection!=null) connection.close(); }
    }
}