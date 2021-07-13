<%@ tag body-content="scriptless" %><%@ attribute name="name"		required="true" rtexprvalue="true" %><%=
	request.getAttribute(name)
%>