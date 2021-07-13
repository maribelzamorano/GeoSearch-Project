<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="key"		required="false" rtexprvalue="true" %>
<%@ attribute name="type"		required="false" rtexprvalue="true" %>
<%@ attribute name="parameter"	required="false" rtexprvalue="true" %>
<jsp:doBody  var="resultBodyString" scope="request"/><%

	if(type==null) type="text";
	if(key==null) key = String.valueOf(request.getAttribute("resultBodyString"));
	out.print(bas.getTextBean().getText(ns, key, type));
%>