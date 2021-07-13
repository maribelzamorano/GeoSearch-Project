package com.topdev.tsp.action.modules.login;

import java.util.Date;

import com.topdev.tsp.action.basic.BasicActionSupport;

public class ViewAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	private int sessionCount;
	public String execute() throws Exception
	{
		setSessionObject("last-active", new Date());
		setSessionCount(getSessionBean().getSessionCount(String.valueOf(getAttribute("LIFERAY_SHARED_remoteIP")), getSessionId()));

		return SUCCESS;
	}

	public int getSessionCount()
	{
		return sessionCount;
	}

	public void setSessionCount(int sessionCount)
	{
		this.sessionCount = sessionCount;
	}
}
