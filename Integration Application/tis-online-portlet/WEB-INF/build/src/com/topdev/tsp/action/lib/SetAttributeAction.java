package com.topdev.tsp.action.lib;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class SetAttributeAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public	static final String	sessionPrefix		= "AjaxAttribute.";
	
	private String targetElement;
	
	public String execute() throws Exception
	{
		System.out.println("SetAttributeAction ist deprecated");
		ServletActionContext.getResponse().setHeader("Cache-Control", "max-age=0, must-revalidate, no-cache");
		Map<String, String[]> paras = ActionContext.getContext().getParameters();
		targetElement = paras.get("targetElement")[0];
		Iterator it = paras.entrySet().iterator();
		while(it.hasNext())
		{
			Entry<String, String[]> entry = (Entry<String, String[]>) it.next();
			if(entry.getValue().length>0)
			{
				ActionContext.getContext().getSession().put(entry.getKey(), entry.getValue()[0]);
				setSessionAttribute(sessionPrefix+entry.getKey(), entry.getValue()[0]);
			}
		}
		return SUCCESS;
	}
	
	public String getTargetElement()
	{
		return targetElement;
	}
	public void setTargetElement(String targetElement)
	{
		this.targetElement = targetElement;
	}
}