package com.topdev.tsp.action.modules.neuter_resources.submodules;

import com.topdev.tsp.action.modules.neuter_resources.DetailAction;

public class SchoohouseFormAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;

	public String execute() throws Exception
	{
		init( "edit");
		return SUCCESS;
	}
}