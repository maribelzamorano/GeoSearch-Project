package com.topdev.aa.model.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Hex;
import org.apache.struts2.ServletActionContext;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class AjaxImpl extends DefaultImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;
	private static final String downloadDir ="/resources/download";

	public Object getSessionAttribute(String key)
	{
		Object result = null;
//		if(session!=null)							result = session.get(key);
//		if(result==null && portletSession!=null)	result = portletSession.getAttribute(key);
		if(result==null && httpSession!=null)		result = httpSession.getAttribute(key);
		getLog().info("completed: getSessionObject "+key+"="+result);
		return result;
	}

	public void setSessionAttribute(String key, Object value)
	{
//		if(session!=null)			session.put(key, value);
		if(httpSession!=null)		httpSession.setAttribute(key, value);
//		if(portletSession!=null)	portletSession.setAttribute(key, value);
//		if(httpSession!=null)		httpSession.setAttribute(key, value);
//		if(session==null && portletSession==null && httpSession==null)
//			getLog().error("No session Object found");
		getLog().info("completed: setSessionAttribute "+key+"="+value);
	}
	public String getRealPath(String path)
	{
		return ServletActionContext.getServletContext().getRealPath(path);
	}
	public boolean downloadFileExists(String id) throws InterruptedException
	{
		File file = new File(getRealPath(downloadDir+"/"+id));
		if(!file.exists()) return false;
		else while(file.lastModified() + 500  > (new Date()).getTime())
			Thread.sleep(500);
		return true;
	}
	public void createDownloadFile(String id, String fileName, String hexData) throws IOException, InterruptedException, DecoderException
	{
//		if(!downloadFileExists(id) && hexData!=null && hexData.length()>0)
//		{
//			File dir	= new File(getRealPath(downloadDir+"/"+id));
//			dir.mkdir();
//			FileOutputStream fos = new FileOutputStream(new File(getRealPath(downloadDir+"/"+id+"/"+fileName)));
//			fos.write(Hex.decodeHex(hexData.toCharArray()));
//		}
		throw new UnsupportedOperationException("createDownloadFile wird nicht unterstützt.");
	}
	public String getInitParameter(String parameter)
	{
		return ServletActionContext.getServletContext().getInitParameter("imageRefreshDelay");
	}
	public String initDownload(String TBSH_ID, String TBSH_SHORTNAME) throws Exception
	{
		return super.initDownload(TBSH_ID, TBSH_SHORTNAME);
/*		ServletActionContext.getServletContext().getRealPath("/resources/download");
		String imageURL = null;
		try
		{
			String	ANLA_ID			= null;
			Date	ANLA_PTS		= null;
			String	downloadDir = ServletActionContext.getServletContext().getRealPath("/resources/download");
			File	anlaDir = new File(downloadDir);
			File	outFile = null;
			
			String			error		= null;
	//		Abfrage(n)
			Connection		connection	= null;
		   	SqlProcedure	p			= null;
			try
			{
				connection	= BasicActionSupport.getConnection();
				p			= new SqlProcedure("psp_ANLA_Download", getSessionId());
				p.setInt(	"@TBSH_ID",			TBSH_ID);
				p.setString("@TBSH_SHORTNAME",	TBSH_SHORTNAME);
				p.execute(	connection);
				ResultSet rs = p.getResultSet();
				if(rs!=null && rs.next())
				{
					ANLA_PTS = new Date(rs.getTimestamp("ANLA_PTS").getTime());
					ANLA_ID = rs.getString("ANLA_ID");
					downloadDir += "/"+ANLA_ID;
					anlaDir = new File(downloadDir);

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
						else getLog().error("Das angeforderte Bild ist zurzeit noch nicht Verfuegbar.");
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
				getLog().error(error);
				throw new Exception(error);
			}
			
			if(outFile!=null)
			{
				while(outFile.lastModified() + 500  > (new Date()).getTime()) Thread.sleep(500);
				imageURL = "/tis-online-portlet/resources/download/"+ ANLA_ID+"/"+outFile.getName();
			}
		}
		catch(Exception ex3)
		{
			getLog().error(ex3.toString());
			throw ex3;
		}
		getLog().debug("Bildinitialisierung beendet");
		return imageURL;*/
	}
	

}