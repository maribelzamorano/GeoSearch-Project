<%@ include file="/pages/lib/init/init.jsp" %>

<c:set var="tEx_raw" scope="request"><s:property value="exception"/></c:set>
<c:set var="tEx" scope="request"><s:property value="exception.localizedMessage"/></c:set>
<c:set var="tExStack" scope="request"><s:property value="exceptionStack"/></c:set>
<%
	if(request.getAttribute("tExStack")!=null)
		System.out.println(request.getAttribute("tExStack"));
	if(request.getAttribute("tEx")!=null)
	{
		if(((String)request.getAttribute("tEx")).trim().length()<2 && request.getAttribute("tEx_raw")!=null)
			request.setAttribute("tEx", String.valueOf(request.getAttribute("tEx_raw")));
		request.setAttribute("tEx",((String)request.getAttribute("tEx")).replaceAll("#MSG#","").replaceAll("\\n","<br/>") );
	}
%>
<span class="portlet-msg-error">
	Ein Fehler ist aufgetreten:<br/>
	${tEx}
</span>