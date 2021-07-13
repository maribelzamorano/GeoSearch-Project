package com.topdev.aa.model.action;

import java.util.Iterator;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class PortletImpl extends DefaultImpl implements Portlet
{
	private static final long	serialVersionUID	= 1L;
	private Log log	= LogFactory.getLog(this.getClass());
	
	public Object getSessionAttribute(String key)
	{
		Object result = getSession().get(key);
		log.info("PortletImpl a getSessionAttribute() "+key+"="+result);
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
	//				System.out.println("getSessionAttribute::"+t2+"="+sessionMap.get(t1));
				if(t2.equals(key)) result = sessionMap.get(t1);
			}
		}
		log.info("PortletImpl b getSessionAttribute() "+key+"="+result);

		return getSession().get(key);
	}
	public void setSessionAttribute(String key, Object value)
	{
		log.info("ModuleImpl setSessionAttribute() "+key+"="+value);
		context.getSession().put(key, value);
	}
	

}