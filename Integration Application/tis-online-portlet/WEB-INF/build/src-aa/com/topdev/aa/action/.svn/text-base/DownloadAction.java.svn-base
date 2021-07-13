package com.topdev.aa.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.SocketException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletResponse;

public class DownloadAction extends StandardAction
{
	public String writeFile(String sessionId, InputStream in ,String filename) throws IOException
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		String s=System.getProperty("file.separator");
		String path = gc.path+s+"resources"+s+"download"+s+sessionId;
		File dir = new File(path);
		
		if (!dir.exists()) dir.mkdir();
		File outFile = new File(path + s + filename);
		FileOutputStream out = new FileOutputStream(outFile);

		int i = 0;
		while ((i = in.read()) != -1)
			out.write((byte) i);
		return "/resources/download/"+sessionId+"/"+filename;
		*/
	}
	

	public static void writeResponse(HttpServletResponse response, byte[] b, String filename) throws IOException, SQLException, SocketException
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		response.reset();
		response.setHeader("Content-Type", "application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"");
		OutputStream os   = response.getOutputStream();
		os.write(b);
        os.flush();
		os.close();
		*/
	}
}