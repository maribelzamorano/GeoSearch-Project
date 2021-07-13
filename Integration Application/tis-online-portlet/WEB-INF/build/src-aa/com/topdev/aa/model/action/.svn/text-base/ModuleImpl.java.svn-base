package com.topdev.aa.model.action;

import java.util.Iterator;
import java.util.Map;

import javax.portlet.WindowState;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.aa.object.MainObject;

public class ModuleImpl extends DefaultImpl implements Module
{
	private static final long	serialVersionUID	= 1L;
	private Log log	= LogFactory.getLog(this.getClass());

	private String mode;
	private String vsid				= "none";
	private String name				= "none";
	private String mainObjectName	= "none";
	private MainObject mainObject;
	private String state;
	
	public Object getSessionAttribute(String key)
	{
		Object result = getSession().get(key);
		log.info("ModuleImpl a getSessionAttribute() "+key+"="+result);
		if(result==null)
		{
			Map<String, Object>	sessionMap	= getContext().getSession();
			Iterator<String> it = sessionMap.keySet().iterator();
			while(it.hasNext())
			{
				String t1 = it.next();
				String t2 = t1;
				int index = t2.indexOf("?");
				if(index>0) t2 = t2.substring(index+1, t2.length());
				log.info("getSessionAttribute::"+t1+"::"+t2+"="+sessionMap.get(t1));
				if(t2.equals(key)) result = sessionMap.get(t1);
			}
		}
		log.info("ModuleImpl b getSessionAttribute() "+key+"="+result);

		return getSession().get(key);
	}


	@SuppressWarnings("unchecked")
	public void setSessionAttribute(String key, Object value)
	{
		log.info("ModuleImpl setSessionAttribute() "+key+"="+value);
		context.getSession().put(key, value);
	}
	
	public boolean isMaximized()
	{
		if(state!=null && state.equals(WindowState.MAXIMIZED.toString())) return true;
		return false;
	}
	
	public void initMainObject(String mainObjectName)
	{
		System.out.println("init MainObject "+mainObjectName);
		this.mainObject = new MainObject();
		this.mainObject.setName(mainObjectName);
		this.mainObjectName=mainObjectName;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getVsid()
	{
		return vsid;
	}
	public void setVsid(String vsid)
	{
		this.vsid = vsid;
	}
	public Log getLog()
	{
		return log;
	}
	public void setLog(Log log)
	{
		this.log = log;
	}
	public String getMode()
	{
		return mode;
	}
	public void setMode(String mode)
	{
		this.mode = mode;
	}

	public MainObject getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(MainObject mainObject)
	{
		this.mainObject = mainObject;
	}

	public String getMainObjectName()
	{
		return mainObjectName;
	}

	public void setMainObjectName(String mainObjectName)
	{
		this.mainObjectName = mainObjectName;
	}


	public String getState()
	{
		return state;
	}


	public void setState(String state)
	{
		this.state = state;
	}



}