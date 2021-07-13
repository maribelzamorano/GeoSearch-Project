package com.topdev.aa.lib.filter;

import java.io.IOException;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirectFilter extends BasicFilter
{
	private String 			debug			= "false";
	private String 			redirectPath	= "/";
	private List<String> 	ignoreStarts;
	private List<String> 	includeStarts;
	private List<String> 	ignoreLike;
	private List<String> 	includeLike;
	
	
	public void init(FilterConfig config) throws ServletException
	{
		if(config.getInitParameter("debug")!= null)
			this.debug = config.getInitParameter("debug");
		if(config.getInitParameter("redirectPath")!= null)
			this.redirectPath = config.getInitParameter("redirectPath");
	}


	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest	request = (HttpServletRequest)	servletRequest;
		System.out.println("++++ Ticket: "+request.getParameter("ticket"));
		showAttributes(request);
		log("\n------------- RedirectFilter aufruf -------------");
//		log("info 1: "+request.getPathInfo());
		log("info 2: "+request.getRequestURI());
//		log("info 3: "+request.getServletPath());
//		log("info 4: "+request.getServerName());

		String path = request.getRequestURI();
		redirect( (HttpServletResponse)servletResponse, redirectPath);
	}
}