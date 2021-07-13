<%--

Fügt zu langen Wörtern ein Leerzeichen hinzu...

--%><%@ include file="../init.jsp" %><%@ tag body-content="scriptless" %><%@ attribute name="maxWordLength" required="false" rtexprvalue="true" type="java.lang.Integer"%><%@ attribute name="maxLength" required="false" rtexprvalue="true" type="java.lang.Integer"%><jsp:doBody  var="resultBodyString" scope="request"/><%
if(maxWordLength==null) maxWordLength = 25;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
if(body.length()>maxWordLength)
{
	String[] bs = body.split(" ");
	String newBody = "";
	for(int i=0; i<bs.length; i++)
	{
		if(bs[i].length()>maxWordLength) bs[i]=bs[i].substring(0,maxWordLength)+" "+bs[i].substring(maxWordLength);
		newBody+=bs[i]+" ";
	}
	body = newBody;
	if(maxLength!=null && body.length()>=maxLength)
		body = body.substring(0,maxLength).trim()+"...";
}
out.print(body);
%>