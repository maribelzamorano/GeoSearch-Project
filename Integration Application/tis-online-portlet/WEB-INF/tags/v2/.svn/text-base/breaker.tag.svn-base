<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<jsp:doBody  var="resultBodyString" scope="request"/>
<%
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
out.print(body.replaceAll("\n","<br/>"));
%>