package com.topdev.aa.lib.thread;

import java.io.InputStream;

import javax.sql.DataSource;

public class PdfFileThread extends Thread
{
	private DataSource ds; 
	private String sessionId;
	private InputStream xmlIS; 
	private InputStream xslIS; 
	private String ANLA_NAME;
	private String ANLA_BEZEICHNUNG;
	private String ANLA_BESCHREIBUNG;

	public PdfFileThread(
			DataSource ds, 
			String sessionId, 
			InputStream xmlIS, 
			InputStream xslIS, 
			String ANLA_NAME,
			String ANLA_BEZEICHNUNG,
			String ANLA_BESCHREIBUNG)
	{
		this.ds = ds;
		this.sessionId = sessionId;
		this.xmlIS = xmlIS;
		this.xslIS = xslIS;
		this.ANLA_NAME = ANLA_NAME;
		this.ANLA_BEZEICHNUNG = ANLA_BEZEICHNUNG;
		this.ANLA_BESCHREIBUNG = ANLA_BESCHREIBUNG;
	}
	
	public void run()
	{
		/*
		try
		{
  			Driver driver = new Driver();
			driver.setLogger(null);
	        driver.setRenderer(Driver.RENDER_PDF);
	        ByteArrayOutputStream out	= new ByteArrayOutputStream();
			Connection connection 		= ds.getConnection();
			
			try
			{
				CallableStatement cs;
				ResultSet rs;
				String call;
				
//    				________________________________________________________________________________________________________________ 	
//    				speichern...
				try 
				{
	        		driver.setOutputStream(out);
	        		TransformerFactory factory = TransformerFactory.newInstance();
	        		Transformer transformer = factory.newTransformer(new StreamSource(xslIS));
	        		Source src = new StreamSource(xmlIS);
	        		Result res = new SAXResult(driver.getContentHandler());
	        		transformer.transform(src, res);
		        }
				finally
				{
					xmlIS.close();
					xslIS.close();
				}
				
				File file = new File(ANLA_BESCHREIBUNG);
				FileOutputStream fileOut = new FileOutputStream(file);
				fileOut.write(out.toByteArray());
				fileOut.close();
				out.close();
				
			} finally 
			{
				connection.close();
			}
		} catch(Exception ex){System.out.println("Thread faild: "+ex.toString());}
		*/
	}
}