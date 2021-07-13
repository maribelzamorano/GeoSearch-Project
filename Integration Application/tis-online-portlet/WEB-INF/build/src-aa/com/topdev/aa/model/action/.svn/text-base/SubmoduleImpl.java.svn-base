package com.topdev.aa.model.action;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.aa.object.MainObject;

public class SubmoduleImpl extends DefaultImpl implements Submodule
{
	private static final long	serialVersionUID	= 1L;
	private Log log	= LogFactory.getLog(this.getClass());

	private	MainObject mainObject;
	private String mode;
	private String vsid				= "none";
	private String mainObjectName	= "none";

	public Object getSessionAttribute(String key)
	{
		Object result = null;
//		if(session!=null)							result = session.get(key);
//		if(result==null && portletSession!=null)	result = portletSession.getAttribute(key);
		if(result==null && httpSession!=null)		result = httpSession.getAttribute(key);
		getLog().info("completed: getSessionObject "+key+"="+result);
		return result;
	}

	public void setSessionAttribute(String key, Object value)
	{
//		if(session!=null)			session.put(key, value);
		if(httpSession!=null)		httpSession.setAttribute(key, value);
//		if(portletSession!=null)	portletSession.setAttribute(key, value);
//		if(httpSession!=null)		httpSession.setAttribute(key, value);
//		if(session==null && portletSession==null && httpSession==null)
//			getLog().error("No session Object found");
		getLog().info("completed: setSessionAttribute "+key+"="+value);
	}
	
	public String getVsid()
	{
		return vsid;
	}
	public void setVsid(String vsid)
	{
		this.vsid = vsid;
	}
	public MainObject getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(MainObject mainObject)
	{
		this.mainObject = mainObject;
	}
	public String getMode()
	{
		return mode;
	}
	public void setMode(String mode)
	{
		this.mode = mode;
	}
	public Log getLog()
	{
		return log;
	}
	public void setLog(Log log)
	{
		this.log = log;
	}
	public String getMainObjectName()
	{
		return mainObjectName;
	}
	public void setMainObjectName(String mainObjectName)
	{
		this.mainObjectName = mainObjectName;
	}
}