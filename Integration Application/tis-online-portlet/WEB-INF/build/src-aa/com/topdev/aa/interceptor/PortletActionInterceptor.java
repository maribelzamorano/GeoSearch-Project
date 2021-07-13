package com.topdev.aa.interceptor;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.model.action.Portlet;

public class PortletActionInterceptor extends StandardInterceptor implements Interceptor
{
	private static final long	serialVersionUID	= 1L;
	private	Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception
	{
		Log log = LogFactory.getLog(this.getClass());
		log.debug("intercept before "+this.getClass().getSimpleName());
		final ActionContext	context		= invocation.getInvocationContext ();
		Map<String, Object>	requestMap	= (Map<String, Object>) context.get("request");
		Map<String, Object>	session		= context.getSession();
		boolean implementsCorrectInterfaces = false;
		Class[] c = invocation.getAction().getClass().getInterfaces();
		for(int i =0; i < c.length; i++)
			if(c[i].equals(Portlet.class)) implementsCorrectInterfaces = true;

		if(!implementsCorrectInterfaces)
			throw new Exception("Das angeforderte Objekt ist kein kompatibles Hauptobjekt.");

		Portlet d = (Portlet)invocation.getAction();
		d.setSession(session);
		checkAuthorisation((String) requestMap.get(portalParameterPrefix+"login_name"), d);
		return invocation.invoke();
	}
}