package com.topdev.aa.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

public class ConfigLoader implements Serializable
{

	private static final long	serialVersionUID	= 1L;

	public ConfigLoader()
	{
	}
	public ConfigLoader(HttpSession session)
	{
	}
	
	public List<SiteGroupContainer> getSiteConfigs(ServletContext sc) throws Exception
	{
		if(sc.getAttribute("mappings")==null) return new ArrayList<SiteGroupContainer>();
		Properties mappings = (Properties)sc.getAttribute("mappings");
		List<SiteGroupContainer> result=new ArrayList<SiteGroupContainer>();
		Enumeration e = mappings.propertyNames();
		String key	=null;
		String value=null;
		
		while(e.hasMoreElements())
		{
			key=String.valueOf(e.nextElement());
			value=mappings.getProperty(key);
			
			result.add(new SiteGroupContainer(new SiteContainer(
					key,
					((value.substring(0,value.indexOf(","))).equals("1")?true:false),
					value.substring(value.indexOf(",")+1,value.length()))));
		}
		return result;
	}
}