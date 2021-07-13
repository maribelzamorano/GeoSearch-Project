package com.topdev.aa.lib.filter;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BasicFilter implements Filter
{
	private String 			debug			= "false";

	public void init(FilterConfig config) throws ServletException
	{
		throw new UnsupportedOperationException("Methode wurde nicht ueberschrieben.");
	}

	public void log(String msg)
	{
		if(this.debug.equals("true"))
			System.out.println(this.getClass().getName()+" :: " + msg);
	}
	
	private void ignore(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException
	{
		log(":: Ignore " + ((HttpServletRequest)servletRequest).getRequestURI());
		chain.doFilter(servletRequest, servletResponse);
	}
	
	
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException 
	{
		throw new UnsupportedOperationException("Methode wurde nicht ueberschrieben.");
	}

	public void redirect(HttpServletResponse response, String uri) throws IOException
	{
		log(":: Redirect ->"+uri);
		response.sendRedirect(uri);
	}
	
	public static void showAttributes(HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		showAttributes(session);
	}	
	
	public static void showAttributes(HttpSession session)
	{
		Enumeration attNames = session.getAttributeNames();
		while(attNames.hasMoreElements())
		{
			String attName = (String) attNames.nextElement();
			System.out.println("SessionAttribute:  NAME= " + attName + ",\t\tVALUE= " + session.getAttribute(attName));
		}
	}	
	
	public void destroy()
	{

	}
}