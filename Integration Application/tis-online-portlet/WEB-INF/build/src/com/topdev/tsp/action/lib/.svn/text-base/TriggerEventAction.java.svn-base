package com.topdev.tsp.action.lib;

import org.apache.struts2.ServletActionContext;

import com.topdev.tsp.action.basic.BasicActionSupport;

public class TriggerEventAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public	static final String	sessionPrefix		= "AjaxAttribute.";

	String event;
	String object;
	
	public String execute() throws Exception
	{
		ServletActionContext.getResponse().reset();
		ServletActionContext.getResponse().setContentType("text/html; charset=UTF-8");
		ServletActionContext.getResponse().getWriter().println("status ok");
		
		System.out.println("TriggerEventAction event="+event+" object="+object);
		log.info("TriggerEventAction event="+event+" object="+object);
		if(event!=null)
		{
			if(event.equals("sessionDestroy") && object!=null)
			{
				//log.info("removing Session:"+object);
				//getSessionBean().removeSessionObject(object);
			}
		}
		return null;
	}

	public String getEvent()
	{
		return event;
	}

	public void setEvent(String event)
	{
		this.event = event;
	}

	public String getObject()
	{
		return object;
	}

	public void setObject(String object)
	{
		this.object = object;
	}
}