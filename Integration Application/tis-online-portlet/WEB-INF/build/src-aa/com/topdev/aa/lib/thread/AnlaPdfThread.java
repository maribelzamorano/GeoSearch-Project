package com.topdev.aa.lib.thread;

import java.io.InputStream;

import javax.sql.DataSource;

public class AnlaPdfThread extends Thread
{
	private DataSource ds; 
	private String sessionId;
	private InputStream xmlIS; 
	private InputStream xslIS; 
	private String ANLA_NAME;
	private String ANLA_BEZEICHNUNG;
	private String ANLA_BESCHREIBUNG;

	public void setANLA_BEZEICHNUNG(String s)
	{
		this.ANLA_BEZEICHNUNG = s;
	}
	public AnlaPdfThread(
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
  			Logger logger = new ConsoleLogger(ConsoleLogger.LEVEL_INFO);
  			driver.setLogger(logger);
  			MessageHandler.setScreenLogger(logger);
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
				byte[] bytes = out.toByteArray();
				
				cs = SqlWorker.prepareCs(connection, "psp_ANLA_IUD",11);
				SqlWorker.setCsString(		cs,	"@SESSION_ID",			sessionId);
				cs.registerOutParameter( 		"@RC", 					Types.INTEGER);
				cs.registerOutParameter( 		"@SQL_ERROR",			Types.INTEGER);
				cs.registerOutParameter( 		"@RC_TEXT",				Types.VARCHAR);
				cs.registerOutParameter( 		"@ANLA_ID",				Types.INTEGER);
				SqlWorker.setCsString(		cs,	"@ANLA_NAME",			ANLA_NAME);
				SqlWorker.setCsString(		cs,	"@ANLA_BEZEICHNUNG",	ANLA_BEZEICHNUNG);
				SqlWorker.setCsString(		cs,	"@ANLA_BESCHREIBUNG",	ANLA_BESCHREIBUNG);
				cs.setBinaryStream(				"@ANLA_DATEI",			new ByteArrayInputStream(bytes), bytes.length );
				SqlWorker.setCsBit(		cs,	"@ANLA_KZ_GEPRUEFT",	"0");
				SqlWorker.setCsBit(		cs,	"@ANLA_KZ_MODIFIED",	"1");
				
				cs.execute();        
				cs.close();
			} finally 
			{
				connection.close();
			}
		} catch(Exception ex){System.out.println("Thread faild: "+ex.toString());}
		*/
	}
}