<%@ tag body-content="scriptless" %>
<%@ attribute name="name" required="true" rtexprvalue="true" %>
<jsp:doBody  var="resultBodyString" scope="request"/>
<%
	String body = String.valueOf(request.getAttribute("resultBodyString"));
	request.setAttribute(name, body);
%>