package com.topdev.aa.action;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.topdev.aa.object.GlobalContainer;
import com.topdev.aa.object.SiteContainer;


public class SaveRamAction extends Action 
{
	private Log log = LogFactory.getLog(this.getClass());
	private HttpServletResponse response=null;

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) 
	throws Exception
	{
		HttpSession session = request.getSession(true);
		GlobalContainer gc=(GlobalContainer)session.getAttribute("container");
		if(gc==null) return null;

		Map map=request.getParameterMap();
		String[] mappingList 	= (String[])map.get("mapping");
		String[] foldList 		= (String[])map.get("fold");


		PrintWriter out = response.getWriter();
		if(mappingList!=null)
		for(int i=0;i<mappingList.length;i++)
		{
			SiteContainer sc	= gc.getSiteContainer(mappingList[i]);
			if(sc!=null)
			{
				sc.fold 			= foldList[i].equals("true");
				gc.setSiteContainer(sc);
				out.println(mappingList[i]+" -> "+foldList[i]+" gespeichert...<br>");
			}
		}
		//out.println("\n<script>window.close();</script>");


/*
		this.session = request.getSession(true);
		if(!session.isNew())
		{
			
		}
*/		return null;

	}
}
