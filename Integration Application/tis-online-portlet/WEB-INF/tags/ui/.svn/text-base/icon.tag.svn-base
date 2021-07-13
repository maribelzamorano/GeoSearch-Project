<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="type"	required="true"		rtexprvalue="true"%>
<%@ attribute name="js"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="msgkey"	required="false"	rtexprvalue="true"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
	String body = String.valueOf(request.getAttribute("resultBodyString"));
	if(body==null)		body="";
	if(js==null)		js=false;
	if(type==null)		type="";
	if(type.equals("editViewAction"))
	{
%>
	<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
	<s:if test="kz_edit==1">
		<a href="<tui:url action="true" windowState="maximized" newVs="true" withMode="1">edit</tui:url>">
			<img src="<s:url value="/images/icons/portlet/edit.gif"/>" title="bearbeiten" border="0"/>
		</a>	
	</s:if>
<%
	}
	else
	{
%><a
	<%	if(!js)	{ %>href="javascript:TopdevUtil.updateTab('<%=ns%>','<%=ajaxId%>','<%=body%><%=(body.indexOf("?")==-1)?"?":"&"%>action=<%=type%>')"<% } 
		else	{%>href="javascript:;" onclick="<%=body%>"<%} %>
	>
	<img class="icon_<%=type%>" src="<s:url value="/images/nothing.gif"/>" border="0"<%
		if(msgkey!=null)	type = msgkey;
		out.print(" title=\""+bas.getText(ns, "icon_info-"+type)+"\"");
	%>/>
</a><%
	}
%>