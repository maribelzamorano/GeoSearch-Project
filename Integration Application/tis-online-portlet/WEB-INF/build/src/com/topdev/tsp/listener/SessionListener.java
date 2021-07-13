package com.topdev.tsp.listener;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.topdev.tsp.model.aop.ConfigurationBean;
import com.topdev.tsp.model.aop.SessionBean;

public class SessionListener implements HttpSessionListener
{
	private Log log = LogFactory.getLog(this.getClass());

	public void sessionCreated(HttpSessionEvent arg0)
	{
		log.debug("Session '"+arg0.getSession().getId()+"' wird begonnen.");
		try
		{
			HttpSession				session	= arg0.getSession();
			WebApplicationContext	ctx		= WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
			if(ctx.containsBean("configurationBean"))
				((ConfigurationBean)ctx.getBean("configurationBean")).setSessionTimeout(session.getMaxInactiveInterval());
		}
		catch(Exception ex) { log.fatal("Fehler bei der Initialisierung einer Sitzung:"+ex.toString()); }
	}

	public void sessionDestroyed(HttpSessionEvent arg0)
	{
		log.debug("Session '"+arg0.getSession().getId()+"' wird beendet.");
		try
		{
			HttpSession		session			= arg0.getSession();
//			DataSourceBean	dataSourceBean	= null;
			SessionBean		sessionBean		= null;
			WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
			if(ctx.containsBean("sessionBean") && ctx.containsBean("dataSourceBean"))
			{
				sessionBean		= (SessionBean)ctx.getBean("sessionBean");
//				dataSourceBean	= (DataSourceBean) ctx.getBean("dataSourceBean");
			}
			else
			{
				System.out.println("Bean 'sessionBean' or 'dataSourceBean' could not be acquired.");
				return;
			}
	
			/*
			String error = "";
			Connection connection = null;
			try
			{
				connection = dataSourceBean.getDataSource().getConnection();
				String call;
				CallableStatement cs;
	//			___________________________________________________________________________
	//			Logout...
	
				cs = SqlWorker.prepareCs(connection,"psp_Logout",4); 
	
				SqlWorker.setCsString(		cs,	"@SESSION_ID",			session.getId());
				cs.registerOutParameter( 		"@RC", 					Types.INTEGER);
				cs.registerOutParameter( 		"@SQL_ERROR",			Types.INTEGER);
				cs.registerOutParameter( 		"@RC_TEXT",				Types.VARCHAR);
				cs.execute();
				SqlWorker.finalizeResults(cs);
				error = SqlWorker.getErrorString(cs,1);
				if(error!=null && error.length()>0) log.error("Fehler bei Beendung einer Session:\n"+error);
				cs.close();
			}
			catch(Exception ex) 
			{
				log.error("Fehler bei Beendung einer Session:\n"+ex.toString()+"\n"+error);
			}
			finally 
			{
				SqlProcedure.closeConnection(connection);
			}
			*/
			sessionBean.removeSessionObject(session.getId());
		}
		catch(Exception ex2) { log.fatal("Fehler bei der Beendung einer Sitzung: "+ex2.toString()); }
	}
}