<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="id"				required="true" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="active"			required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="hideButtons"	required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="virtual"		required="false" rtexprvalue="true" type="java.lang.Boolean"%>

<%@ tag import="com.opensymphony.xwork2.ActionContext"%>
<%
	String name = (String)request.getAttribute("tabboxName");
	if(virtual==null)		virtual		=false;
	if(active==null)		active		=virtual;
	if(hideButtons==null)	hideButtons	=false;
	if(virtual) name=ns;
	BasicActionSupport action = (BasicActionSupport)ActionContext.getContext().getActionInvocation().getAction();
	String tabId = name+"_view"+id;
	action.setAjaxId(tabId);
	request.setAttribute("ajaxId",tabId);
	request.setAttribute("currentTabId",tabId);
%>

<script>
	TopdevUtil.objs["<%=ns%>"].tabIds[TopdevUtil.objs["<%=ns%>"].tabIds.length] = "<%=tabId%>";
	TopdevUtil.objs["<%=ns%>"].tabs["<%=tabId%>"]					= new Object();
	TopdevUtil.objs["<%=ns%>"].tabs["<%=tabId%>"].obligationFields	= new Array();
	TopdevUtil.objs["<%=ns%>"].tabs["<%=tabId%>"].id				= <%=id%>;
	TopdevUtil.objs["<%=ns%>"].tabs["<%=tabId%>"].hideButtons		= <%=hideButtons%>;
	<% if(virtual) { %>
		TopdevUtil.objs["<%=ns%>"].tabs["<%=tabId%>"].virtual		= true;
	<% } %>
</script>
<div
	ondblclick="openForm('<%=name%>','<%=name%>_view<%=id%>')"
	class="topdev_tabbox_body"
	style="display:<%=active?"inline":"none" %>;"
	id="<%=tabId%>">
		<jsp:doBody/>
</div>