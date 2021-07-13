package com.topdev.tsp.action.modules.businesspartner.submodules;

import com.topdev.tsp.action.modules.businesspartner.DetailAction;

public class CommonFormAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;

	public String execute() throws Exception
	{
		init( "edit");
		return SUCCESS;
	}
}