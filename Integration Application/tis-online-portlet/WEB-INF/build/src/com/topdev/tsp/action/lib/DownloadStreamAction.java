package com.topdev.tsp.action.lib;

import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DownloadStreamAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	String ANLA_ID = "0";
	
	public String execute() throws Exception
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();

		Map<String, String[]> paras = ActionContext.getContext().getParameters();
		String ANLA_ID = paras.get("ANLA_ID")!=null?paras.get("ANLA_ID")[0]:null;
		String TBSH_ID = paras.get("TBSH_ID")!=null?paras.get("TBSH_ID")[0]:null;
		String TBSH_SHORTNAME = paras.get("TBSH_SHORTNAME")!=null?paras.get("TBSH_SHORTNAME")[0]:null;
		
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
				String checked = rs.getString("ANLA_KZ_GEPRUEFT");
				if(checked!=null && checked.equals("1"))
				{
					String		filename	= rs.getString("ANLA_NAME");
					int 		i			= 0;
					InputStream in			= rs.getBinaryStream("ANLA_DATEI");
	
					String	contentType = "application/octet-stream";
					Date	lastModified = rs.getDate("ANLA_PTS");
					if(filename!=null)
					{
						if( filename.indexOf(".jpg")>-1 ) contentType = "image/jpeg";
						if( filename.indexOf(".gif")>-1 ) contentType = "image/gif";
						if( filename.indexOf(".bmp")>-1 ) contentType = "image/bmp";
						if( filename.indexOf(".png")>-1 ) contentType = "image/png";
					}
					
					if(lastModified!=null)
					{
						SimpleDateFormat sdf = new SimpleDateFormat("E’, ’d’ ’MMM’ ’y H’:’m’:’s’ ’z", Locale.ENGLISH);
						response.setHeader("Last-Modified",	sdf.format(lastModified));
					}
					response.setHeader("Content-Type",	contentType);
	
					response.setHeader("Content-Disposition", "attachment; filename=\""+filename +"");
					OutputStream out = response.getOutputStream();
					while ((i = in.read()) != -1) out.write((byte) i);
					out.close();
				}
				else
					response.getWriter().println("Das von Ihnen angeforderte Dokument ist zurzeit noch nicht Verfuegbar.");
				rs.close();
			}
			else
			{
				response.getWriter().println("Das von Ihnen angeforderte Dokument konnte nicht geoeffnet werden.");
			}
			p.finalizeResults();
			if(p.getErrorString()!=null)
			{
				String error = p.getErrorString();
				log.error(error);
				response.getWriter().println("Das von Ihnen angeforderte Dokument konnte nicht geoeffnet werden. \n"+error);
			}
			p.close();
		}
		catch(SQLException e)
		{
			response.getWriter().println("Das von Ihnen angeforderte Dokument konnte nicht geoeffnet werden. \n"+e.getLocalizedMessage());
			log.error((e.getLocalizedMessage()));
			while((e = e.getNextException())!=null) log.error((e.getLocalizedMessage()));
		}
		finally { SqlProcedure.closeConnection(connection); }
		
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