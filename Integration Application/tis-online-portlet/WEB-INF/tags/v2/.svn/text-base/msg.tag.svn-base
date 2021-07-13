<%@ include file="../init-v2.jsp" %>
<%@ tag import="com.topdev.aa.lib.Message"%>
<%@ tag body-content="scriptless" %>
<%@ attribute name="key" required="false" rtexprvalue="true" %>
<jsp:doBody  var="resultBodyString" scope="request"/><%
	if(key==null) key = String.valueOf(request.getAttribute("resultBodyString"));
	if(key==null) out.print("???nokey???");
	out.print(Message.getText(key));
%>