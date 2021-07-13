<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="type" required="true" rtexprvalue="true"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
String body = String.valueOf(  request.getAttribute("resultBodyString"));
if(body==null) body="";

if(mode==1 && type.equals("hideButtons"))
{
	%>
	<script>
		TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].hideButtons = <%=body%>;
	</script>
	<%
}
else if(mode==1 && type.equals("listModified"))
{
	%>
	<script>
		TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].listModified = <%=body%>;
	</script>
	<%
}
%>