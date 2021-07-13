package com.topdev.tsp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.StrutsStatics;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.object.TopdevPrincipal;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class ActionInterceptor implements Interceptor
{
	private static final long	serialVersionUID	= 1L;
	private	Log log = LogFactory.getLog(this.getClass());
	public void destroy()	{	}
	public void init()		{	}


	public String intercept(ActionInvocation invocation) throws Exception
	{
		try
		{
			final ActionContext	context		= invocation.getInvocationContext ();
			HttpServletRequest	request		= (HttpServletRequest)	context.get(StrutsStatics.HTTP_REQUEST);
			HttpServletResponse	response	= (HttpServletResponse)	context.get(StrutsStatics.HTTP_RESPONSE);
			HttpSession			session		= request.getSession(true);

			BasicActionSupport action = (BasicActionSupport)invocation.getAction();
			action.setSessionId(session.getId());
			action.setPrincipal((TopdevPrincipal) action.getSessionObject("userPrincipal"));
			response.setContentType("text/html; charset=UTF-8");
			
			if(action.getParm("tspi",false)!=null)
			{
				action.setTspi(action.getParm("tspi"));
				action.setTspm(action.getParm("tspm", false));
			}
			String t_tspi = request.getParameter("tspi");
			if(t_tspi!=null && t_tspi.trim().length()>0)
			{
				action.setTspi(t_tspi);
				action.setTspm(request.getParameter("tspm"));
			}
//			System.out.println("--------- myajid:"+request.getParameter("ajaxId"));

		}
		catch(Exception ex)
		{
			log.warn("Action "+invocation.getAction()+" konnte vom ActionInterceptor nicht aufbereitet werden.");
		}
		
		return invocation.invoke();
	}
}