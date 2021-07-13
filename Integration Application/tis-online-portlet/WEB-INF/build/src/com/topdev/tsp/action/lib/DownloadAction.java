package com.topdev.tsp.action.lib;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DownloadAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	String ANLA_ID = "0";
	
	public String execute() throws Exception
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		HttpServletResponse response = ServletActionContext.getResponse();
		Map<String, String[]> paras = ActionContext.getContext().getParameters();
		String	ANLA_ID			= paras.get("ANLA_ID")!=null?paras.get("ANLA_ID")[0]:null;
		Date	ANLA_PTS		= null;
		String	TBSH_ID			= paras.get("TBSH_ID")!=null?paras.get("TBSH_ID")[0]:null;
		String	TBSH_SHORTNAME	= paras.get("TBSH_SHORTNAME")!=null?paras.get("TBSH_SHORTNAME")[0]:null;
		
		String	downloadDir = getRealPath("/resources/download/");
		if(ANLA_ID!=null) downloadDir+="/"+ANLA_ID;

		File	anlaDir = new File(downloadDir);
		File	outFile = null;
		
		if(ANLA_ID==null || !anlaDir.exists())
		{
			String			error		= null;
	//		Abfrage(n)
			Connection		connection	= null;
		   	SqlProcedure	p			= null;
			try
			{
				connection	= BasicActionSupport.getConnection();
				p			= new SqlProcedure("psp_ANLA_Download", getSessionId());
				if(ANLA_ID!=null)
				{
					p.setInt(	"@ANLA_ID",	ANLA_ID);
				}
				else
				{
					p.setInt(	"@TBSH_ID",			TBSH_ID);
					p.setString("@TBSH_SHORTNAME",	TBSH_SHORTNAME);
				}
				p.execute(	connection);
				ResultSet rs = p.getResultSet();
				if(rs!=null && rs.next())
				{
					ANLA_PTS = new Date(rs.getTimestamp("ANLA_PTS").getTime());
					if(ANLA_ID==null)
					{
						ANLA_ID = rs.getString("ANLA_ID");
						downloadDir += "/"+ANLA_ID;
						anlaDir = new File(downloadDir);
					}

					if(!anlaDir.exists())
					{
						String checked = rs.getString("ANLA_KZ_GEPRUEFT");
						if(checked!=null && checked.equals("1"))
						{
							String		filename	= rs.getString("ANLA_NAME");
							int 		i			= 0;
							InputStream in			= rs.getBinaryStream("ANLA_DATEI");
							File		dir			= new File(downloadDir);
			
							if (!dir.exists()) dir.mkdir();
												outFile	= new File(downloadDir+"/"+filename);
							FileOutputStream	out		= new FileOutputStream(outFile);
							while ((i = in.read()) != -1) out.write((byte) i);
						}
						else
						{
							response.getWriter().println("Das von Ihnen angeforderte Dokument ist zurzeit noch nicht Verfuegbar.");
							return null;
						}
					}
					else
					{
						String[] anla = anlaDir.list();
						if(anla.length<1) throw new Exception("Fehler: Das Verzeichnis "+anlaDir.getName()+" ist leer.");
						outFile = new File(anlaDir.getAbsolutePath()+"/"+anla[0]);
					}
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
				log.error(error);
				response.getWriter().println("Es ist ein Fehler aufgetreten:\n "+error);
				return null;
			}
		}
		else
		{
			String[] anla = anlaDir.list();
			if(anla.length<1) throw new Exception("Fehler: Das Verzeichnis "+anlaDir.getName()+" ist leer.");
			outFile = new File(anlaDir.getAbsolutePath()+"/"+anla[0]);
		}
		if(outFile!=null)
		{
			while(outFile.lastModified() + 500  > (new Date()).getTime()) Thread.sleep(500);
			response.reset();
			response.setHeader("Cache-Control", "max-age=0, must-revalidate, no-cache");
			SimpleDateFormat sdf = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz");
			sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
			if(ANLA_PTS!=null) response.setHeader("last-modified", sdf.format(ANLA_PTS));
			
			String contentType = "application/octet-stream";
			if(outFile.getName()!=null)
			{
				if( 	outFile.getName().toLowerCase().endsWith(".jpg"))	contentType = "image/jpeg";
				else if(outFile.getName().toLowerCase().endsWith(".gif"))	contentType = "image/gif";
				else if(outFile.getName().toLowerCase().endsWith(".bmp"))	contentType = "image/bmp";
				else if(outFile.getName().toLowerCase().endsWith(".pdf"))	contentType = "application/pdf";
			}
			response.setHeader("Content-Type", contentType);
			
			response.setHeader("Content-Disposition", "attachment; filename=\""+ outFile.getName() +"\"");
			response.sendRedirect("/tis-online-portlet/resources/download/"+ ANLA_ID+"/"+outFile.getName());
		}
		
		return null;
		*/
	}

	public String getANLA_ID()
	{
		return ANLA_ID;
	}

	public void setANLA_ID(String anla_id)
	{
		ANLA_ID = anla_id;
	}
}