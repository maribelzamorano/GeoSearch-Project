<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="tabCount"		required="true"		rtexprvalue="true" type="java.lang.Integer" %>
<%@ attribute name="name"			required="true"		rtexprvalue="true"							%>
<%@ attribute name="activeTabId"	required="false"	rtexprvalue="true" type="java.lang.Integer"	%>
<%@ attribute name="msgKey"			required="false"	rtexprvalue="true"							%>

<%
if(activeTabId==null) activeTabId=1;
request.setAttribute("tabboxName",name);
if(msgKey==null) msgKey=name+".tablabel";
%>
<div class="topdev_tabbox">
	<table width="100%" cellspacing="0" cellpadding="0" id="topdev_tabbox">
	<tr>
		<td>
			<table cellspacing="0" cellpadding="0">
			<tr>
<%
for(int i=1; i<=tabCount; i++)
{
	%>
	<td class="tab_<%=(activeTabId==i)?"active":"inactive"%>" id="<%=name%>_tab<%=i%>">
		<table>
		<tr>
			<td>
				<div
					id="<%=name%>_divX<%=i%>"
					class="tab_divX"
					style="display:none">
					<b>&nbsp;&nbsp;&nbsp;</b>
				</div>
			</td>
			<td>
				<a href="javascript:TopdevUtil.toggleTabOn('<%=ns%>', '<%=name%>','<%=i%>')">
				<nobr>	<%= bas.getText(ns+"."+msgKey+i) %> </nobr>
				</a>
			</td>
		</tr>
		</table>
	</td>
	<%
	if((i)<tabCount)
	{
		%>
		<td class="tab_pusher1">
			&nbsp;
		</td>
		<%
	}
	else
	{
		%>
		<td width="100%" class="tab_pusher2">&nbsp;
		</td>
		<%
	}
}
%>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="body">
			<jsp:doBody/>
		</td>
	</tr>
</table>
</div>