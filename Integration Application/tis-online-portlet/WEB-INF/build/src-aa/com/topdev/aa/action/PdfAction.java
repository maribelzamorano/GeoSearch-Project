package com.topdev.aa.action;

import org.apache.struts.action.Action;

public class PdfAction extends Action 
{
	/*
	private Log log = LogFactory.getLog("com.topdev.tis");
	public boolean debug=false;

	public 	ActionForward execute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) 
	throws 	Exception 
	{
		response.setContentType("application/pdf");
		String xmlPath=request.getParameter("xml_path");
		String xslPath=request.getParameter("xsl_path");
		InputStream xmlIS = null;
		InputStream xslIS = null;

		try
		{
			//gesicherte Verbindung versuchen
			xmlIS = (new CarelesslyHttpsStreamer()).getStream(xmlPath);
			xslIS = (new CarelesslyHttpsStreamer()).getStream(xslPath);
		}
		catch (ClassCastException cce)
		{
			//ansonsten normale
			xmlIS = (new URL(xmlPath)).openStream();
			xslIS = (new URL(xslPath)).openStream();
		}

		if(debug) 
		{
			String temp="init->|";
			int n=xslIS.read();
			while(n!=-1)
			{
				temp+=""+(char)n;
				n=xslIS.read();
			}
			temp+="|<-\n->|";
			n=xmlIS.read();
			while(n!=-1)
			{
				temp+=""+(char)n;
				n=xmlIS.read();
			}
			temp+="|<-end";

			throw new Exception(""+temp);
		}

		Driver driver = new Driver();
		Logger logger = new ConsoleLogger(ConsoleLogger.LEVEL_DISABLED);
		driver.setLogger(logger);
		MessageHandler.setScreenLogger(logger);
       	driver.setRenderer(Driver.RENDER_PDF);

		OutputStream out = (OutputStream)response.getOutputStream();
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
			out.close();
			xmlIS.close();
			xslIS.close();
		}

		return null;
  	}*/
}
