package com.topdev.tsp.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class DownloadFilter implements Filter
{
	private Log		log = LogFactory.getLog(this.getClass());
	private String	logoutUrl;
	private String	validateUrls;
	private int 	validateInterval;

    public void doFilter( ServletRequest request, ServletResponse response, FilterChain fc) throws ServletException, IOException
    {
    	((HttpServletResponse)response).sendRedirect("/services/lib/download.action?id="+((HttpServletRequest)request).getParameter("ANLA_ID"));
        return;
    }

	public void destroy()
	{
	}

	public void init(FilterConfig arg0) throws ServletException
	{
	}
}