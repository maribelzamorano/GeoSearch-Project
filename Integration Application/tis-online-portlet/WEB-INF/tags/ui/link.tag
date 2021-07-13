<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="type"	required="true"		rtexprvalue="true"%>
<%@ attribute name="text"	required="true"		rtexprvalue="true"%>
<%@ attribute name="js"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
	String body = String.valueOf(request.getAttribute("resultBodyString"));
	if(body==null) body="";
	if(js==null) js=false;
%>

<a
	<%	if(!js)	{ %>href="javascript:TopdevUtil.updateTab('<%=ns%>','<%=ajaxId%>','<%=body%><%=(body.indexOf("?")==-1)?"?":"&"%>action=<%=type%>')"<% } 
		else	{%>href="javascript:;" onclick="<%=body%>"<%} %>
	>	
<%=text%>
</a>