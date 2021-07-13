package com.topdev.tsp.action.modules.school_search;

import org.apache.struts2.portlet.context.PortletActionContext;

import com.liferay.util.servlet.SessionMessages;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DetailAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public String execute() throws Exception
	{
//		System.out.println("com.topdev.tsp.action.modules.school_search.DetailAction.execute()");
		SessionMessages.print(PortletActionContext.getRequest().getPortletSession());
		return SUCCESS;
	}
}