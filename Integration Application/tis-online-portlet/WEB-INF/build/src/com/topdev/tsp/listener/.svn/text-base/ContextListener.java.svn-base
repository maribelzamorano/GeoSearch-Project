package com.topdev.tsp.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.topdev.tsp.model.aop.ConfigurationBean;

public class ContextListener implements ServletContextListener 
{
	private Log log = LogFactory.getLog(this.getClass());

	public void contextInitialized(ServletContextEvent event) 
	{
		ServletContext sc = event.getServletContext();
		log.debug("TIS-Portlet Context wird initialisiert.");
		try
		{
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(sc);
			if(ctx.containsBean("configurationBean")) ((ConfigurationBean)ctx.getBean("configurationBean")).loadConfig(sc);
			else throw new NullPointerException("Das Objekt configurationBean konnte nicht gefunden werden.");
		}
		catch(Exception ex) { log.fatal("Fehler bei der Initialisierung einer Sitzung:"+ex.toString()); }
	}

	public void contextDestroyed(ServletContextEvent event)
	{
	}
}