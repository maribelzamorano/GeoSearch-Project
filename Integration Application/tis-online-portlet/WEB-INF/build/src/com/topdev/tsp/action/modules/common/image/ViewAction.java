package com.topdev.tsp.action.modules.common.image;

import com.topdev.aa.model.action.Module;
import com.topdev.aa.model.action.ModuleImpl;

public class ViewAction extends ModuleImpl implements Module
{
	private static final long	serialVersionUID	= 1L;
	public String view() throws Exception
	{
		return "success";
	}
}