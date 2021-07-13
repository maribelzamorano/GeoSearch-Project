package com.topdev.tsp.listener;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

//import com.topdev.aa.lib.DownloadManager;

public class SessionBindingListener implements HttpSessionBindingListener
{
	private Log log = LogFactory.getLog(this.getClass());
	
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionBindingListener#valueBound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueBound(HttpSessionBindingEvent arg0)
	{
//		if(arg0.getSession().getServletContext().getAttribute("DownloadManager")!=null)
//			((DownloadManager) arg0.getSession().getServletContext().getAttribute("DownloadManager")).checkStream();

		bound(arg0);
	}

	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpSessionBindingListener#valueUnbound(javax.servlet.http.HttpSessionBindingEvent)
	 */
	public void valueUnbound(HttpSessionBindingEvent arg0)
	{
//		if(arg0.getSession().getServletContext().getAttribute("DownloadManager")!=null)
//			((DownloadManager) arg0.getSession().getServletContext().getAttribute("DownloadManager")).checkStream();

/*		Connection c = (Connection) arg0.getSession().getServletContext().getAttribute("connection");
		
		try
		{
			if(c!=null)
			{
				c.close();
				log.warn("Offen gelassene Connection beendet!");
			}
			
		} catch (SQLException e)
		{
			log.fatal("Connection konnte nicht geschlossen werden");
		}*/
		unbound(arg0);
	}
	
	public void unbound(HttpSessionBindingEvent e) { }
	public void bound(HttpSessionBindingEvent e) { }
}