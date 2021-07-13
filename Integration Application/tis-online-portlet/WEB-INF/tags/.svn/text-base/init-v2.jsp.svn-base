<%@ taglib prefix="s" uri="/struts-tags" %><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ tag import="com.opensymphony.xwork2.ActionContext"%><%@ tag import="com.topdev.aa.model.action.Default"%><%
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

	Default bas = (Default)ActionContext.getContext().getActionInvocation().getAction() ;
	int mode = 2;
	try
	{
		mode = Integer.parseInt(bas.getMode());
	} catch (Exception ex)
	{
//		ex.printStackTrace();
	}
%>