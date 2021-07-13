<%@ include file="../init.jsp" %>
<%@ attribute name="styling"	required="false"	rtexprvalue="false" type="java.lang.Boolean"%>
<%@ tag body-content="scriptless" %>
<jsp:doBody  var="resultBodyString" scope="request"/>
<%
if(styling==null) styling=false;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
String resultBody = "";
String[] sa = body.split(" ");
for(int i=0; i<sa.length;i++)
{
	if(sa[i].startsWith("http://") || sa[i].startsWith("https://"))
		resultBody+=" <a target=\"_blank\" href=\""+sa[i].replaceAll("'","").replaceAll("<","").replaceAll("\"","")+"\">"+sa[i]+"</a> ";
	else	resultBody += sa[i]+" ";
}

if(styling) resultBody = resultBody.replaceAll("\\[list\\]","<ul>").replaceAll("\\[/list\\]","</ul>").replaceAll("\\[\\*\\]","<li>");
out.print(resultBody);

%>