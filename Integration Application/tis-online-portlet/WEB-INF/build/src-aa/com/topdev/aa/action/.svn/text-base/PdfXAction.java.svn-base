package com.topdev.aa.action;

import org.apache.struts.action.Action;

public class PdfXAction extends Action 
{
	/*
	private Log log = LogFactory.getLog("com.topdev.tis");
	public 	ActionForward execute(
		ActionMapping mapping,
		ActionForm form,
		HttpServletRequest request,
		HttpServletResponse response) 
	throws 	Exception 
	{
		response.setContentType("application/pdf");
		String xslPath=String.valueOf(request.getAttribute("xsl_path"));
		
		
		InputStream xmlIS = (InputStream)request.getAttribute("xml_data");
		InputStream xslIS = null;

		try
		{
			//gesicherte Verbindung versuchen
			xslIS = (new CarelesslyHttpsStreamer()).getStream(xslPath);
		}
		catch (ClassCastException cce)
		{
			//ansonsten normale
			xslIS = (new URL(xslPath)).openStream();
		}




		request.removeAttribute("xml_data");
		request.removeAttribute("xsl_path");


		Driver driver = new Driver();
		driver.setLogger(null);
        driver.setRenderer(Driver.RENDER_PDF);
        	        
		
		OutputStream os = (OutputStream)response.getOutputStream();
		try 
		{
            		driver.setOutputStream(os);
            		TransformerFactory factory = TransformerFactory.newInstance();
            		Transformer transformer = factory.newTransformer(new StreamSource(xslIS));
            		Source src = new StreamSource(xmlIS);
            		Result res = new SAXResult(driver.getContentHandler());
            		transformer.transform(src, res);
					os.close();
       	}
		catch(Exception ex)
		{
			os.close();
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			out.println("Ein Fehler ist aufgetreten:\n"+ex.toString());
		}
		finally
		{

			xmlIS.close();
			xslIS.close();
		}
		return null;
  	}
  	*/
}
