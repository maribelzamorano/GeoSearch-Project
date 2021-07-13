package com.topdev.aa.interceptor;

import java.util.Map;

import javax.portlet.RenderRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.model.action.Module;
import com.topdev.aa.object.MainObject;

public class ModuleActionInterceptor extends StandardInterceptor implements Interceptor
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
			if(c[i].equals(Module.class)) implementsCorrectInterfaces = true;

		if(!implementsCorrectInterfaces)
			throw new Exception("Das angeforderte Objekt ist kein kompatibles Hauptobjekt.");

		Module module = (Module)invocation.getAction();
		log.debug(this.getClass().getSimpleName()+"<-vsid:"+module.getVsid());
		
		if( context.getContextMap().get("struts.portlet.request")!=null )
			module.setState(((RenderRequest)context.getContextMap().get("struts.portlet.request")).getWindowState().toString());

		/*
		System.out.println("\n\n\n::::::::::: ModulInterceptor-session-variables:");
		RenderRequest	renderRequest	= (RenderRequest)		context.get("struts.portlet.request");
		HttpServletRequest	request		= (HttpServletRequest)	context.get(StrutsStatics.HTTP_REQUEST);
		System.out.println("renderRequest :"+renderRequest);
		System.out.println("request :"+request);
		if(request!=null) System.out.println("request.getSession(true) :"+request.getSession(true));
		Iterator<String> it = session.keySet().iterator();
		while(it.hasNext())
		{
			String t1 = it.next();
			System.out.println("context.getSession():"+t1+"="+session.get(t1));
		}
		if(renderRequest!=null)
		{
			System.out.println("renderRequest.getPortletSession():"+renderRequest.getPortletSession());

			Enumeration<String> e = renderRequest.getPortletSession().getAttributeNames();
			while(e.hasMoreElements())
			{
				String t1 = e.nextElement();
				System.out.print("renderRequest.getPortletSession().attributename:"+t1+"=");
				try
				{
					System.out.print(renderRequest.getPortletSession().getAttribute(t1));
				}
				catch(Exception ex45) {}
				System.out.print("\n");
			}

	
			System.out.println("\n----------------------------------------------------------------------------" +
					"\nrenderRequest.getPortletSession():"+renderRequest.getAttributeNames());
			e = renderRequest.getAttributeNames();
			while(e.hasMoreElements())
			{
				String t1 = e.nextElement();
				System.out.print("renderRequest.getPortletSession().attributename:"+t1+"=");
				try
				{
					System.out.print(renderRequest.getAttribute(t1));
				}
				catch(Exception ex45) {}
				System.out.print("\n");
			}
		}	
		*/
		checkAuthorisation((String)requestMap.get(portalParameterPrefix+"login_name"), module);
		
		//setze mode auf view falls nicht bekannt.
		if(module.getMode()==null) module.setMode("2");
		if(module.getVsid()==null) module.setVsid("none");
		if(module.getName()==null) module.setName("none");
		if(module.getMode().equals("1"))
		{
			if(module.getVsid().equals("none")) return handleError(requestMap, "Die Angabe einer VsID ist obligatorisch.");
			if(module.getName().equals("none")) return handleError(requestMap, "Die Angabe eines Modulnamens ist obligatorisch.");
			String mainObjectName = module.getName()+"_"+module.getVsid();
			if(session.get(mainObjectName)==null)
				module.initMainObject(mainObjectName);
			else
				module.setMainObject((MainObject) session.get(mainObjectName));
			module.setMainObjectName(mainObjectName);

			log.debug("Writing "+module.getMainObject().getName()+" in Session and Request before invocation cn="+module.getMainObject().getClass().getName()+ " - "+module.getMainObject().getClass().getCanonicalName());
			session.put(module.getMainObject().getName(), module.getMainObject());
			requestMap.put("mainObject", module.getMainObject());
		}
		String result = invocation.invoke();
		log.debug("intercept after "+this.getClass().getSimpleName());
		if(module.getMode().equals("1"))
		{
			log.debug("Writing "+module.getMainObject().getName()+" in Session and Request after invocation. cn="+module.getMainObject().getClass().getName());
			session.put(module.getMainObject().getName(), module.getMainObject());
			requestMap.put("mainObject", module.getMainObject());
		}
		return result;
	}
}