<%@ include file="../init-v2.jsp" %><%@ tag body-content="scriptless" %><%@ attribute name="windowState" required="false" rtexprvalue="true"%><%@ attribute name="action" required="false" rtexprvalue="true" type="java.lang.Boolean"%><%@ attribute name="withMode" required="false" rtexprvalue="true" type="java.lang.Integer"%><%@ attribute name="newVs" required="false" rtexprvalue="true" type="java.lang.Boolean"%><jsp:doBody  var="resultBodyString" scope="request"/><%
if(action==null)	action=false;
if(newVs==null)		newVs=false;
if(withMode!=null)	request.setAttribute("tmp_mode",withMode);

if(action)
{
	if(windowState!=null)
	{
		request.setAttribute("tmp_windowState",windowState);
		%><s:url action="${resultBodyString}" windowState="${tmp_windowState}"><%
								%><s:param name="tspi"><s:property value="tspi"/></s:param><%
		if(newVs)			{	%><s:param name="vsid"><s:property value="newVsid"/></s:param><%	}
		else				{	%><s:param name="vsid"><s:property value="vsid"/></s:param><%		}
		if(withMode!=null)	{	%><s:param name="mode">${tmp_mode}</s:param><%						}
		else				{	%><s:param name="mode"><s:property value="mode"/></s:param><%		}
		%></s:url><%
	}
	else
	{
		%><s:url action="${resultBodyString}"><%
								%><s:param name="tspi"><s:property value="tspi"/></s:param><%
		if(newVs)			{	%><s:param name="vsid"><s:property value="newVsid"/></s:param><%	}
		else				{	%><s:param name="vsid"><s:property value="vsid"/></s:param><%		}
		if(withMode!=null)	{	%><s:param name="mode">${tmp_mode}</s:param><%						}
		else				{	%><s:param name="mode"><s:property value="mode"/></s:param><%		}
		%></s:url><%
	}
}
else
{
	%><s:url value="${resultBodyString}"><%
							%><s:param name="tspi"><s:property value="tspi"/></s:param><%
	if(newVs)			{	%><s:param name="vsid"><s:property value="newVsid"/></s:param><%	}
	else				{	%><s:param name="vsid"><s:property value="vsid"/></s:param><%		}
	if(withMode!=null)	{	%><s:param name="mode">${tmp_mode}</s:param><%						}
	else				{	%><s:param name="mode"><s:property value="mode"/></s:param><%		}
	%></s:url><%
}
%>