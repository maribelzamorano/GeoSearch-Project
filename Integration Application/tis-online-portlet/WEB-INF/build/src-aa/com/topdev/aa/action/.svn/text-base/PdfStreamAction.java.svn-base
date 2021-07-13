package com.topdev.aa.action;

import org.apache.struts.action.Action;

public class PdfStreamAction extends Action 
{
	/*
	private Log log = LogFactory.getLog("com.topdev.tis");
	public 	ActionForward execute(ActionMapping mapping,ActionForm form,HttpServletRequest request,HttpServletResponse response)
	throws IllegalStateException, Exception 
	{
		response.reset();
		response.setContentType("application/pdf");
		InputStream xmlIS = (InputStream)request.getAttribute("xml_data");
		InputStream xslIS = (InputStream)request.getAttribute("xsl_data");
		request.removeAttribute("xml_data");
		request.removeAttribute("xsl_path");

		Driver driver = new Driver();
		Logger logger = new ConsoleLogger(ConsoleLogger.LEVEL_ERROR);
		driver.setLogger(logger);
		MessageHandler.setScreenLogger(logger);
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
