package com.topdev.aa.interceptor;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.model.action.Ajax;

public class AjaxInterceptor extends StandardInterceptor implements Interceptor
{
	private static final long	serialVersionUID	= 1L;
	private	Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception
	{
		log.debug("intercept "+this.getClass().getSimpleName());
		final ActionContext	context		= invocation.getInvocationContext ();
		Map<String, Object>	requestMap	= (Map<String, Object>) context.get("request");
		HttpServletRequest	request		= (HttpServletRequest)	context.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse	response	= (HttpServletResponse)	context.get(StrutsStatics.HTTP_RESPONSE);

		Ajax ajaxAction = (Ajax)invocation.getAction();
		ajaxAction.setSession(context.getSession());
		if(response!=null) response.setContentType("text/html; charset=UTF-8");
		if(request!=null)
		{
			HttpSession session = request.getSession(true);
			if(session.isNew()) session.setAttribute("sessionReinitTime", (new Date()).getTime());
//			if(request.getSession(true).isNew()) return "SessionEndException";
			ajaxAction.setSessionId(request.getSession(true).getId());
			ajaxAction.setHttpSession(request.getSession(true));
			ajaxAction.setSession(context.getSession());
		}

		String loginId = "";
		if(requestMap!=null && requestMap.get(portalParameterPrefix+"login_name")!=null)			loginId = (String) requestMap.get(portalParameterPrefix+"login_name");
		else if(request!=null && request.getAttribute(portalParameterPrefix+"login_name")!=null)	loginId = (String) request.getAttribute(portalParameterPrefix+"login_name");
		checkAuthorisation(loginId, ajaxAction);
			
		return invocation.invoke();
	}
}