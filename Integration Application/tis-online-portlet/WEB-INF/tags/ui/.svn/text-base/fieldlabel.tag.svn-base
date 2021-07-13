<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="key" required="false" rtexprvalue="true"%>
<%@ attribute name="align"		required="false" rtexprvalue="true"%>
<%@ attribute name="colspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="rowspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
%>
<td<%
	if(align!=null) out.print(" align=\""+align+"\"");
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	if(rowspan!=null) out.print(" rowspan=\""+rowspan+"\"");
	%>>
	
	<%=key!=null?bas.getText(ns, "label-"+key):body%>
</td>