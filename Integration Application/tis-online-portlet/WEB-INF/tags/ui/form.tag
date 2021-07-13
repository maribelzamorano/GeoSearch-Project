<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="name"			required="true"		rtexprvalue="true"							%>

<jsp:doBody  var="resultBodyString"/>
<%
request.setAttribute("ajaxId",		ns+"_"+name);	//wird jederzeit überschrieben
request.setAttribute("form.ajaxId",	ns+"_"+name);	//wird erst durch nächstes form überschrieben
String body = String.valueOf(request.getAttribute("resultBodyString"));
String url	= String.valueOf(request.getAttribute("url"));
if(body==null) body="";
if(url==null) out.println("Variable {url} wurde nicht spezifiziert.<br/>");
%>
<form action="<%= request.getAttribute("url") %>" method="post">
	<%=body %>
</form>