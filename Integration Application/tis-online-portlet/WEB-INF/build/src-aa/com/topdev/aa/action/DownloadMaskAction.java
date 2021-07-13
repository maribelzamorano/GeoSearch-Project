package com.topdev.aa.action;

import java.io.File;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class DownloadMaskAction extends StandardAction
{
	public ActionForward run(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception
	{
		throw new UnsupportedOperationException("Die von Ihnen verwendete Download-Methode wird nicht mehr unterst&uuml;tzt.");
		/*
		String file 	= String.valueOf(request.getAttribute("file"));
		String filename = String.valueOf(request.getAttribute("filename"));
		
		String physicalFilename = toOsPath(gc.getPath()+"/resources/download/"+getSessionId(session)+"/"+filename);
		File tf = new File(physicalFilename);
		while(tf.lastModified() + 500  > (new Date()).getTime()) Thread.sleep(500);
		
		response.reset();
		response.setHeader("Content-Type", "application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"");
		response.sendRedirect(gc.getAbsoluteUrl()+"/resources/download/"+getSessionId(session)+"/"+filename);
		return null;
		*/
	}
}