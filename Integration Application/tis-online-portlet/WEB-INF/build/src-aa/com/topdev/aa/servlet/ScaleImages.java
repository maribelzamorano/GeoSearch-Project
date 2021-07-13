package com.topdev.aa.servlet;

// 2008-02-11 08:11:09.667

import java.io.IOException;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.imageio.ImageIO;
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

import com.topdev.aa.lib.ImageUtil;
import com.topdev.aa.lib.SqlWorker;

public class ScaleImages extends HttpServlet
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
			
			if (ds==null) throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		} 
		catch (Exception ex)
		{ log.error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); }
		
		if (ds == null) log.error("Fehler bei Anfrage einer Datenbankverbindung (DataSource == null).");			
		
		return ds;
	}

	Connection getConnection() throws ClassNotFoundException, SQLException
	{
		return getDataSource().getConnection();
	}
	@Override
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			response.setContentType("text/html");
			//if(!request.getParameter("key").equals("as9bvfh76asd4576rbhDGsd8asd8asd8w4no")) throw new Exception("Unbefungte Ausführung.");
			
			response.getWriter().print("- Bilderskalierung -<br/>");
			
			Connection connection = getConnection();				
			
			try
			{				
				String sql = "select count(*) as count_files from t_anlage_verweis verweis join t_anlage anla on (anla.ANLA_ID = verweis.ANLA_ID) join t_anlage_datei datei on (anla.ANLA_ID = datei.ANLA_ID) where verweis.TBSH_SHORTNAME in ('MEDI','GEBI','AB08','AB07','AB04','AB01','AB02','AB03','AB06','AB05') and anla.ANLA_KZ_GEPRUEFT = 1;";
				PreparedStatement p = connection.prepareStatement(sql);
				ResultSet rs = p.executeQuery();				
				rs.next();
				String count = rs.getString("count_files");
				response.getWriter().print("<br/>Anzahl der Bilder: "+count);				
				
				sql = "select anla.ANLA_#PTS as ANLA_PTS, anla.ANLA_USER as ANLA_USER, anla.ANLA_BEZEICHNUNG as ANLA_NAME, anla.ANLA_ID as ANLA_ID, datei.ANLA_DATEI as ANLA_DATEI, verweis.TBSH_SHORTNAME as TBSH_SHORTNAME from t_anlage_verweis verweis join t_anlage anla on (anla.ANLA_ID = verweis.ANLA_ID) join t_anlage_datei datei on (anla.ANLA_ID = datei.ANLA_ID) where verweis.TBSH_SHORTNAME in ('MEDI','GEBI','AB08','AB07','AB04','AB01','AB02','AB03','AB06','AB05') and anla.ANLA_KZ_GEPRUEFT = 1;";

				p = connection.prepareStatement(sql);
				rs = p.executeQuery();
				String fileName;
				String id;
				InputStream ioStream;
				String src;
				String user;
				String pts;				
				int imgTargetWidth = 0;	
				int counter = 0;
				java.util.List<String> formats = Arrays.asList(ImageIO.getReaderFormatNames());		// Liste aller verfügbaren Datentypen	
				while(rs.next())
				{				
					fileName = rs.getString("ANLA_NAME");				// Name
					id = rs.getString("ANLA_ID");						// id
					ioStream = rs.getBinaryStream("ANLA_DATEI");		// Bilddaten								
					src = rs.getString("TBSH_SHORTNAME");				// Kategorie		
					user = rs.getString("ANLA_USER");
					pts = rs.getString("ANLA_PTS");
					
																	
					if ((fileName == null) || (fileName == "")) { continue; }
					if ((id == null) || (id == "")){ continue; }
					if ((ioStream == null) || (ioStream.available() == 0)) { continue; }
					if ((src == null) || (src == "")) { continue; }			
					
					imgTargetWidth = (src.equals("MEDI")) ? 340 : 186;								
					String ext = fileName.substring(fileName.lastIndexOf(".")+1);
					if (!formats.contains(ext.toLowerCase())) { continue; }		// Nichts tun, wenn falsches Suffix						
					
					ImageUtil imgUtil = new ImageUtil();
					InputStream tempis = imgUtil.scaleImage(fileName, ioStream, imgTargetWidth);					
					fileName = imgUtil.getFileName();
					
					updateAnla(connection, id, tempis, fileName, user, pts);
					tempis.close();
					counter++;
				}				
				response.getWriter().print("<br/>davon skaliert: "+counter);
				
			}
			finally { connection.close(); }
			
		}
		catch(Exception e)
		{
			throw new ServletException(e);
		}
	}

	static void updateAnla(Connection connection, String id, InputStream is, String fileName, String user, String pts) throws Exception
	{
		CallableStatement cs;
//		________________________________________________________________________________________________________________ 	
//		Speichern der Daten...
		cs = SqlWorker.prepareCs(connection,"pss_ANLA_IUD",12);		

		SqlWorker.setCsString(cs,  	"@SESSION_ID",					null);
		cs.registerOutParameter(   	"@RC",							java.sql.Types.INTEGER);
		cs.registerOutParameter(   	"@SQL_ERROR",					java.sql.Types.INTEGER);
		cs.registerOutParameter(   	"@RC_TEXT",						java.sql.Types.VARCHAR);		

		SqlWorker.setCsBit(			cs,	"@ANLA_KZ_DELETED",			"0");
		SqlWorker.setCsBit(			cs,	"@ANLA_KZ_MODIFIED",		"1");
		SqlWorker.setCsBit(			cs,	"@ANLA_KZ_GEPRUEFT",		"1");
		SqlWorker.setCsLong(  		cs,	"@ANLA_ID",					id);		
		SqlWorker.setCsString(		cs, "@ANLA_NAME",				fileName);	
		SqlWorker.setCsString(		cs, "@ANLA_USER",				user);
		SqlWorker.setCsString(		cs, "@ANLA_XPTS",				pts);
		cs.setBinaryStream(  			"@ANLA_DATEI",				is, is.available());

		cs.execute();

		SqlWorker.finalizeResults(cs);
		String error = SqlWorker.getErrorString(cs,1);
		cs.close();		
		if(error!=null && error.length()>0) throw new Exception(error);		
	}
}