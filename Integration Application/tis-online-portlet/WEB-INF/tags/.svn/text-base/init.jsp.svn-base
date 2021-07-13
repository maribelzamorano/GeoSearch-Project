<%@ taglib prefix="s" uri="/struts-tags" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ tag import="com.opensymphony.xwork2.ActionContext"%><%@ tag import="com.topdev.tsp.action.basic.BasicActionSupport"%><%
	String ns = "defaultNamespace";
	if(request.getAttribute("ns")==null)
		out.println("<font color='red'>Es wurde kein Namespace deklariert.</font>");
	else
		ns = String.valueOf(request.getAttribute("ns"));
	
	String ajaxId = "defaultId";
	if(request.getAttribute("ajaxId")!=null)
		ajaxId = String.valueOf(request.getAttribute("ajaxId"));
	else
		ajaxId = String.valueOf(request.getAttribute("currentTabId"));

	BasicActionSupport bas = (BasicActionSupport)ActionContext.getContext().getActionInvocation().getAction() ;
	int mode = bas.getMode();
%>