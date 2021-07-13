package com.topdev.aa.action;

import java.net.SocketException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.topdev.aa.lib.SqlWorker;

public final class DownloadAnlaAction extends com.topdev.aa.action.DownloadAction
{
	private Log log = LogFactory.getLog(this.getClass());

	public ActionForward run(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		//standard variablen

		if(request.getParameter("ANLA_ID")==null)
			return (mapping.findForward("success"));

//		Abfrage(n)
		DataSource dataSource 		= getDataSource();
		Connection connection 		= dataSource.getConnection();
		try
		{
			CallableStatement cs;
			ResultSet rs;
//			________________________________________________________________________________________________________________
//			Holen der Daten...
			cs = SqlWorker.prepareCs(connection, "psp_ANLA",5);
			SqlWorker.setCsString(		cs,	"@SESSION_ID",			getSessionId(session));
			cs.registerOutParameter( 		"@RC", 					Types.INTEGER);
			cs.registerOutParameter( 		"@SQL_ERROR",			Types.INTEGER);
			cs.registerOutParameter( 		"@RC_TEXT",				Types.VARCHAR);
			SqlWorker.setCsLong(		cs,	"@ANLA_ID",				request.getParameter("ANLA_ID"));

			cs.execute();
			rs = cs.getResultSet();
			if(rs.next())
			{
				String filename=rs.getString("ANLA_NAME");
				request.setAttribute("file",writeFile(getSessionId(session), rs.getBinaryStream("ANLA_DATEI") ,filename));
				request.setAttribute("filename",filename);
			}
			rs.close();
			SqlWorker.finalizeResults(cs);
			request.setAttribute("error",SqlWorker.getErrorString(cs,1));
			cs.close();
//			____________________________________________________________________________________________________________
		}
		catch (SocketException se) { log.warn("Datenstrohm wurde unterbrochen: ("+se.toString()+")"); }
		catch (Exception ex) { log.error("Fehler bei der Datenbankabfrage fuer den Download einer Datei: ("+ex.toString()+")"); }
		finally { if(!connection.isClosed()) connection.close(); }
		return mapping.findForward("download-mask");
		*/
	}
}