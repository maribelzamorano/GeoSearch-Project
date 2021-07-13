<%@ include file="/pages/lib/init/init.jsp" %>
<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@taglib prefix="tdl" tagdir="/WEB-INF/tags/data" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<portlet:defineObjects/>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="com.topdev.tsp.action.basic.BasicActionSupport"%>

<%
String ajaxId = "";
{
	BasicActionSupport action = (BasicActionSupport)ActionContext.getContext().getActionInvocation().getAction();	
	if(request.getAttribute("currentTabId")!=null)
		request.setAttribute("ajaxId",request.getAttribute("currentTabId"));
	else
		request.setAttribute("ajaxId",action.getAjaxId());

	ajaxId = String.valueOf(request.getAttribute("ajaxId"));
	action.setAjaxId(ajaxId);
}
String ns = String.valueOf(request.getAttribute("ns"));
%>
<script>
	if(
			TopdevUtil.objs["<%=ns%>"] 
		&&	TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"]
		&&	TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields)
		TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields = new Array();
</script>
<div id="${ajaxId}_infoDiv"><tui:errors/></div>