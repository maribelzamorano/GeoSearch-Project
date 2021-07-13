package com.topdev.aa.exception.handler;

import java.sql.SQLException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ExceptionHandler;
import org.apache.struts.config.ExceptionConfig;

public class GlobalSQLExceptionHandler extends ExceptionHandler
{
	private Log log = LogFactory.getLog(GlobalSQLExceptionHandler.class);


	protected void logException(Exception ex) 
	{
		log.error(ex.toString());
	}

	public ActionForward execute(Exception ex, ExceptionConfig ae, ActionMapping mapping, ActionForm formInstance, javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response)
	{
		SQLException sqlex = (SQLException)ex;
		if(sqlex.getErrorCode()==1205)
			ex = new Exception("Die Verarbeitung konnte nicht durchgefuehrt werden.\n Bitte wiederholen Sie Ihre Aktion.\n");

		log.error("\n" +
			"\t mapping:"+mapping.toString()+"  \n" +
			"\t error:"+ex.toString()+"\n\n");

		request.setAttribute("error",ex);
		return mapping.findForward("sql-error");
	}
}