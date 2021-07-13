package com.topdev.aa.exception.handler;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;

public class GlobalExceptionHandler extends ExceptionHandler
{
	private Log log = LogFactory.getLog(GlobalExceptionHandler.class);


	protected void logException(Exception ex) 
	{
		log.error(ex.toString());
	}

	public ActionForward execute(java.lang.Exception ex, ExceptionConfig ae, ActionMapping mapping, ActionForm formInstance, javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
	{
		log.error("\n" +
				"\t mapping:"+mapping.toString()+"  \n" +
				"\t error:"+ex.toString()+"\n\n");
		
		request.setAttribute("error",ex);
		return mapping.findForward("error");
	}
 
}