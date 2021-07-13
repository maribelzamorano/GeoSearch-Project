package com.topdev.tsp.action.modules.school_search;

import java.util.Iterator;
import java.util.Map;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.portlet.context.PortletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class SetValueAction extends BasicActionSupport implements ParameterAware
{
	private static final long	serialVersionUID	= 1L;

	public String execute() throws Exception
	{
		ActionContext ac = ActionContext.getContext();
		
		Iterator i = parameters.keySet().iterator();
		while(i.hasNext())
		{
			String key = (String) i.next();
			Object o = parameters.get(key);
			if(o!=null)
			{
				String value = ((String[])o)[0];
				//System.out.println("Setting "+key+"\t= "+value);
				ac.getSession().put(key, value);
				PortletActionContext.getRequest().getPortletSession().setAttribute(key, value);
			}
		}
		return NONE;
	}
	Map parameters;
	public void setParameters(Map parameters)
	{
		this.parameters = parameters;
	}
	
	
}