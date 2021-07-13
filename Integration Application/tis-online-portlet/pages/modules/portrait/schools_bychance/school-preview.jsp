<%@ include file="init.jsp" %>
<%@page import="java.util.Enumeration"%>


<s:push value="bild">
	<c:set var="bildUrl" scope="request"><s:property value="bildUrl"/></c:set>

<%

/*
Enumeration e = request.getAttributeNames();
while(e.hasMoreElements())
{
	String s = (String)e.nextElement();
	System.out.println("-"+s+"="+request.getAttribute(s)+"<br/>");
}
*/


String url="";
try
{
	// url = AnlaProxy.getDownloadUrlById((String)request.getAttribute("LIFERAY_SHARED_login_name"),session.getId(),(String)request.getAttribute("anlaId"));
	%>
		<a href="/web/guest/schools/overview?tspi=<s:property value="schulId"/>">
			
			<img width="186px" src="${bildUrl }"/>
		</a><br/>
		<tv2:spacer><s:property value="schulName"/></tv2:spacer>
		<ul class="topdev_link_intern">
			<li class="topdev_icon_schulportrait">
				<a class="topdev_link" href="/web/guest/schools/overview?tspi=<s:property value="schulId"/>">Zum Schulportr&auml;t der Schule</a>
			</li>
		</ul>
	<%
}
catch(Exception ex)
{
	out.println("<br/><br/><font color='red'>"+ex.toString()+"</font><br/><br/>");
}

%>
</s:push>
