package com.topdev.aa.interceptor;

import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.topdev.aa.model.action.Submodule;
import com.topdev.aa.object.MainObject;

public class SubmoduleActionInterceptor extends StandardInterceptor implements Interceptor
{
	private static final long	serialVersionUID	= 1L;
	private	Log log = LogFactory.getLog(this.getClass());

	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception
	{
		log.debug("intercept "+this.getClass().getSimpleName());
		final ActionContext	context		= invocation.getInvocationContext ();
		Map<String, Object>	requestMap	= (Map<String, Object>) context.get("request");
	
		boolean implementsCorrectInterfaces = false;
		Class[] c = invocation.getAction().getClass().getInterfaces();
		for(int i =0; i < c.length; i++) if(c[i].equals(Submodule.class))
			implementsCorrectInterfaces = true;
		if(!implementsCorrectInterfaces)
		{
			requestMap.put("error", "Das angeforderte Objekt ist kein kompatibles Hauptobjekt.");
			log.error(requestMap.get("error"));
			return "error-div";
		}

		Submodule submodule = (Submodule)invocation.getAction();
		log.debug(this.getClass().getSimpleName()+"<-vsid:"+submodule.getVsid());

		//Initialisiere Submodulklasse.
		if(submodule.getMainObjectName()==null)
			throw new NullPointerException("Die Variable mainObjectName kann nicht ermittelt werden.");

		if(submodule.getMode()==null)						submodule.setMode("2");
		if(submodule.getVsid()==null)						submodule.setVsid("none");
		if(submodule.getMainObjectName()==null)				submodule.setMainObjectName("none");
		if(submodule.getMainObjectName().equals("none"))	submodule.setMainObjectName((String)requestMap.get("mainObjectName"));
		if(submodule.getMainObjectName()==null)				throw new Exception("Der Hauptobjektname konnte nicht ermittelt werden.");

		MainObject mainObject = (MainObject) requestMap.get("mainObject");
		if(mainObject==null) mainObject = (MainObject) getSessionAttribute(context, submodule.getMainObjectName());
		if(mainObject==null) return handleError(requestMap, "Das angeforderte Objekt ["+submodule.getMainObjectName()+"] konnte nicht gefunden werden.");
		if(submodule.getVsid().equals("none")) return handleError(requestMap, "Die Angabe einer VsID ist obligatorisch.");
		submodule.setMainObject(mainObject);
		String result = invocation.invoke();
		log.debug("intercept after "+this.getClass().getSimpleName());
		if(submodule.getMode().equals("1"))
			setSessionAttribute(context, submodule.getMainObject().getName(), submodule.getMainObject());
		return result;
	}
}