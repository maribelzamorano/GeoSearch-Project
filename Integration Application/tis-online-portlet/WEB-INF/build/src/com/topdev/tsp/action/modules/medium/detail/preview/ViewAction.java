package com.topdev.tsp.action.modules.medium.detail.preview;

import com.topdev.aa.lib.Validator;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class ViewAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public String view() throws Exception
	{
		if(Validator.empty(getUserName()))	return "login";
		else								return SUCCESS;
	}
}