package com.topdev.aa.model.action;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.portlet.PortletSession;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;

import com.opensymphony.xwork2.ActionContext;

public interface Default extends Serializable
{
	public Log getLog();
	public void setLog(Log log);
	public String getMode();
	public void setMode(String mode);
	public String getSessionId();
	public void setSessionId(String sessionId);
	public String getVsid();
	public void setVsid(String vsid);
	public Map<String, Object> getSession();
	public void setSession(Map<String, Object> session);
	public List<String> getErrors();
	public void setErrors(List<String> errors);
	public PortletSession getPortletSession();
	public void setPortletSession(PortletSession portletSession);
	public HttpSession getHttpSession();
	public void setHttpSession(HttpSession httpSession);
	public Object getSessionAttribute(String key);
	public void setSessionAttribute(String key, Object value);
	public void storeSessionObject(Object obj);
	@SuppressWarnings("unchecked")
	public Object getSessionObject(Class c);
	public String getUserName();
	public String getTspm();
	public void setTspm(String tspm);
	public String getTspi();
	public void setTspi(String tspi);
	public ActionContext getContext();
	public void setContext(ActionContext context);
}
