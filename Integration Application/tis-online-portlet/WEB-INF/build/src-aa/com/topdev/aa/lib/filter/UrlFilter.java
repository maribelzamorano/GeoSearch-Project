package com.topdev.aa.lib.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UrlFilter implements Filter
{
	private String 			debug			= "false";
	private String 			redirectPath	= "/cas";
	private List<String> 	ignoreStarts;
	private List<String> 	includeStarts;
	private List<String> 	ignoreLike;
	private List<String> 	includeLike;
	
	
	public void init(FilterConfig config) throws ServletException
	{
		if (config.getInitParameter("debug")!= null)
			this.debug = config.getInitParameter("debug");
		if (config.getInitParameter("redirectPath")!= null)
			this.redirectPath = config.getInitParameter("redirectPath");
		
		ignoreStarts	= new ArrayList<String>(10);
		includeStarts	= new ArrayList<String>(10);
		ignoreLike		= new ArrayList<String>(10);
		includeLike		= new ArrayList<String>(10);
		Enumeration e	= config.getInitParameterNames();
		
		while (e.hasMoreElements())
		{
			String name = (String) e.nextElement();
			if		(name.startsWith("ignore.like"))	ignoreLike.add( config.getInitParameter(name));
			else if	(name.startsWith("ignore.starts"))	ignoreStarts.add( config.getInitParameter(name));
			else if	(name.startsWith("include.like"))	includeLike.add( config.getInitParameter(name));
			else if	(name.startsWith("include.starts"))	includeStarts.add( config.getInitParameter(name));
		}
	}

	private void log(String msg)
	{
		if (this.debug.equals("true"))
			System.out.println(this.getClass().getName()+" :: " + msg);
	}
	
	private void ignore(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException
	{
		log(":: Ignore " + ((HttpServletRequest)servletRequest).getRequestURI());
		chain.doFilter(servletRequest, servletResponse);
	}
	
	private void include(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException
	{
		HttpServletRequest	request;
		HttpServletResponse	response;
		HttpSession			session;

		try
		{
			request		= (HttpServletRequest)	servletRequest;
			response	= (HttpServletResponse)	servletResponse;
			session		= (HttpSession)			request.getSession();
		}
		catch(ClassCastException e)
		{
			chain.doFilter(servletRequest, servletResponse);
			return;
		}
		
		if(session == null)	session=request.getSession(true);
		if(session != null && session.getAttribute(this.getClass().getName()+".requestingURI")==null)
			session.setAttribute(this.getClass().getName()+".requestingURI", request.getRequestURI());

		log("redirect: " + redirectPath + " requestingURI " + request.getRequestURI());
		redirect(response, redirectPath);
		chain.doFilter(request, response);

	}
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException 
	{
		HttpServletRequest	request = (HttpServletRequest)	servletRequest;
		log("\n------------- Filteraufruf -------------");
//		log("info 1: "+request.getPathInfo());
		log("info 2: "+request.getRequestURI());
//		log("info 3: "+request.getServletPath());
//		log("info 4: "+request.getServerName());

		String path = request.getRequestURI();

		if (path != null)
		{
			HttpSession session = request.getSession();
			log("url-Variable = "+session.getAttribute(edu.yale.its.tp.cas.client.filter.CASFilter.class.getName()+".requestingURI"));
			if(session!=null && session.getAttribute(edu.yale.its.tp.cas.client.filter.CASFilter.class.getName()+".requestingURI")!=null)
			{
				if(path.equals(session.getAttribute(edu.yale.its.tp.cas.client.filter.CASFilter.class.getName()+".requestingURI")));
				{
					ignore(servletRequest, servletResponse, chain);
					return;
				}
			}
			
			Iterator i;
			i = ignoreStarts.iterator();
			while (i.hasNext()) if (path.startsWith((String)i.next()))
			{
				ignore(servletRequest, servletResponse, chain);
				return;
			}

			i = ignoreLike.iterator();
			while (i.hasNext()) if (path.indexOf((String) i.next()) != -1)
			{
				ignore(servletRequest, servletResponse, chain);
				return;
			}

			i = includeStarts.iterator();
			while (i.hasNext()) if (path.startsWith((String)i.next()))
			{
				include(servletRequest, servletResponse, chain);
				return;
			}

			i = includeLike.iterator();
			while (i.hasNext()) if (path.indexOf((String) i.next()) != -1)
			{
				include(servletRequest, servletResponse, chain);
				return;
			}
		}
		if(this.debug.equals("true")) log("Es trag keine Mapping-Regel zu!");
		chain.doFilter(servletRequest, servletResponse);
	}

	private void redirect(HttpServletResponse response, String uri) throws IOException
	{
		log(":: Redirect ->"+uri);
		response.sendRedirect(uri);
	}
	
	private void showAttributes(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		Enumeration attNames = session.getAttributeNames();
		while(attNames.hasMoreElements())
		{
			String attName = (String) attNames.nextElement();
			log("SessionAttribute:  NAME= " + attName + ",\t\tVALUE= " + session.getAttribute(attName));
		}
	}	
	
	public void destroy()
	{

	}
}