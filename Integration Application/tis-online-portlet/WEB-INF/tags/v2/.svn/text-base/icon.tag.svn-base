<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="type"	required="true"		rtexprvalue="true"%>
<%@ attribute name="js"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="msgkey"	required="false"	rtexprvalue="true"%>
<%@ attribute name="visible"	required="false"	rtexprvalue="true" type="java.lang.Boolean"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
	String body = String.valueOf(request.getAttribute("resultBodyString"));
	if(body==null)		body="";
	if(js==null)		js=false;
	if(type==null)		type="";
	if(visible==null)	visible=true;
	if(type.equals("editViewAction"))
	{
%>
	<%@taglib prefix="tv2" tagdir="/WEB-INF/tags/v2" %>
	<a href="<tv2:url action="true" windowState="maximized" newVs="true" withMode="1">edit</tv2:url>">
		<img src="<s:url value="/images/icons/portlet/edit.png"/>" title="bearbeiten" border="0" <%if(!visible) out.print("style='display:none'"); %>/>
	</a>
<%
	}
	else
	{
%>
<%-- '<%=ns%>','<%=ajaxId%>','<%=body%><%=(body.indexOf("?")==-1)?"?":"&"%>action=<%=type%>'--%>
	<a
	<%	if(!js)	{ %>href="javascript:TopdevUtil.updateTab('<%=ns%>','<%=ajaxId%>','<%=body%><%=(body.indexOf("?")==-1)?"?":"&"%>action=<%=type%>')"<% } 
		else	{%>href="javascript:;" onclick="<%=body%>"<%} %>
	>
	<img class="icon_<%=type%>" src="<s:url value="/images/nothing.gif"/>" border="0" <%
		if(!visible) out.print(" style='display:none'"); 
		if(msgkey!=null)	type = msgkey;
		out.print(" title=\""+""+"\"");
	%>/>
</a><%
	}
%>