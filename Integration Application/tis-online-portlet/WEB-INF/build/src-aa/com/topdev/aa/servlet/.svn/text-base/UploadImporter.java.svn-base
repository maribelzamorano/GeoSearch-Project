package com.topdev.aa.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Types;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.aa.lib.SqlWorker;

public class UploadImporter extends HttpServlet
{
	private static final long	serialVersionUID	= 1L;
    private Log log = LogFactory.getLog(this.getClass().getName());

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
		if(ds==null) log.error("Fehler bei Anfrage einer Datenbankverbindung (DataSource == null).");
		return ds;
	}

	@Override
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		String uncheckedDir	= getServletContext().getInitParameter(	"uploadDir_unchecked");
		String infectedDir	= getServletContext().getInitParameter(	"uploadDir_infected");
		String checkedDir	= getServletContext().getInitParameter(	"uploadDir_checked");
		String importedDir	= getServletContext().getInitParameter(	"uploadDir_imported");
		String quarantineDir= getServletContext().getInitParameter(	"uploadDir_quarantine");
		

		PrintWriter out = response.getWriter();
		File path = new File(checkedDir);
		if(!path.isDirectory()) out.println("Fehler: "+path.getAbsolutePath()+" ist kein gueltiges Verzeichnis");

		try { Thread.sleep(Math.round((Math.random()*500)+500)); } catch (InterruptedException e1) { }	//Flootingvorbeuge
		String[] files = (path).list();
		if(files!=null && files.length > 0)
		{
			String error = null;
			Connection connection = null;
			
			for(int i=0;i<files.length;i++)
			{
				try
				{
					connection = getDataSource().getConnection();
					error = null;
					File tf = new File(path.getAbsolutePath() + "/" + files[i]);
					FileInputStream fis = new FileInputStream(tf);
					CallableStatement cs;
//					________________________________________________________________________________________________________________ 	
//					Speichern der Daten...

					cs = SqlWorker.prepareCs(connection,"pss_ANLA_IUD",9);

					SqlWorker.setCsString(cs,  	"@SESSION_ID",					null);
					cs.registerOutParameter(   	"@RC",							java.sql.Types.INTEGER);
					cs.registerOutParameter(   	"@SQL_ERROR",					java.sql.Types.INTEGER);
					cs.registerOutParameter(   	"@RC_TEXT",						java.sql.Types.VARCHAR);

					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_DELETED",			"0");
					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_MODIFIED",		"1");
					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_GEPRUEFT",		"1");
					SqlWorker.setCsLong(  		cs,	"@ANLA_ID",					files[i]);
					cs.setBinaryStream(			"@ANLA_DATEI",					fis, fis.available());

					cs.execute();
					SqlWorker.finalizeResults(cs);
					error = SqlWorker.getErrorString(cs,1);
					cs.close();
					if(error!=null) throw new Exception(error);
					File dest = new File(importedDir+"/"+files[i]);
					fis.close();
					if(!tf.renameTo(dest)) tf.delete();
					else out.println("Erfolgreich hochgeladene Datei wurde nach "+dest.getAbsolutePath()+" verschoben.");
				}
				catch(Exception ex)
				{
					log.error("Fehler beim Hochladen der Datei "+files[i]+": "+ex.toString());
					out.println("Fehler beim Hochladen der Datei "+files[i]+": "+ex.toString());
				}
				finally
				{
					if(connection!=null) try{ connection.close(); }catch(Exception e){}
				}
			}
		}
		
		path = new File(infectedDir);
		if(!path.isDirectory()) out.println("Fehler: "+path.getAbsolutePath()+" ist kein gueltiges Verzeichnis");
		files = (path).list();
		if(files!=null && files.length > 0)
		{
			String error = null;
			Connection connection = null;
			
			for(int i=0;i<files.length;i++) if(files[i]!=null && files[i].indexOf(".logs")==-1)
			{
				try
				{
					files[i] = files[i].replaceAll(".virus", "");
					out.println("Virus in Datei "+files[i]+" gefunden");
					connection = getDataSource().getConnection();
					error = null;
					File tf = new File(path.getAbsolutePath() + "/" + files[i]);
					if(!tf.exists()) tf = new File(path.getAbsolutePath() + "/" + files[i] + ".virus");
					File logFile = new File(path.getAbsolutePath() + "/" + files[i]+".logs");
					if(!logFile.exists()) out.println("Kein Logfile fuer "+files[i]+" gefunden!"); 
					byte[] logFileData = new byte[(int)logFile.length()];
					(new FileInputStream(logFile)).read(logFileData);

					CallableStatement cs;
//					________________________________________________________________________________________________________________ 	
//					Speichern der Daten...

					cs = SqlWorker.prepareCs(connection,"pss_ANLA_IUD",9);

					SqlWorker.setCsString(cs,  	"@SESSION_ID",					null);
					cs.registerOutParameter(   	"@RC",							java.sql.Types.INTEGER);
					cs.registerOutParameter(   	"@SQL_ERROR",					java.sql.Types.INTEGER);
					cs.registerOutParameter(   	"@RC_TEXT",						java.sql.Types.VARCHAR);
					cs.setString(				"@RC_TEXT",						new String(logFileData));

					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_DELETED",			"0");
					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_MODIFIED",		"1");
					SqlWorker.setCsBit(			cs,	"@ANLA_KZ_GEPRUEFT",		"1");
					SqlWorker.setCsLong(  		cs,	"@ANLA_ID",					files[i]);
					cs.setNull(					"@ANLA_DATEI",					Types.BINARY);

					cs.execute();
					SqlWorker.finalizeResults(cs);
					error = SqlWorker.getErrorString(cs,1);
					cs.close();
					if(error!=null) throw new Exception(error);
					File dest = new File( quarantineDir+"/"+files[i]);
					if(!tf.renameTo(dest)) tf.delete();
					else out.println("Virusinfizierte Datei wurde nach "+dest.getAbsolutePath()+" verschoben.");
					if(logFile.exists()) logFile.renameTo( new File( quarantineDir+"/"+files[i]+".logs") );
				}
				catch(Exception ex)
				{
					log.error("Fehler beim Absetzen der Viruswarnung fuer Datei "+files[i]+": "+ex.toString());
					out.println("Fehler beim Absetzen der Viruswarnung fuer Datei "+files[i]+": "+ex.toString());
				}
				finally
				{
					if(connection!=null) try{ connection.close(); }catch(Exception e){}
				}
			}
		}
	}
}