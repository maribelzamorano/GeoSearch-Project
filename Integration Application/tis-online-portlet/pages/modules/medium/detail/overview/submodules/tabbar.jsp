
<%
String name="tabboxMedium";

request.setAttribute("tabboxName", name);
int		t_activeTabId	= 1;
int		t_tabCount		= 7;
%>
<c:if test="${mainObject.bobj.id == 0}">
	<%t_tabCount		= 5;%>
</c:if>
<%
String ns = (String)request.getAttribute("ns");
String tabId = ns+"_view"+t_activeTabId;
%>
<c:set var="ajaxId" scope="request">${ns}_view${mainObject.currentTab}</c:set>
<c:set var="currentTabId" scope="request">${mainObject.currentTab}</c:set>

<input type="hidden" id="hiddenEmptyField" name="hiddenEmptyField" value=""/>



<div class="topdev_tabbox">
	<table width="750px" cellspacing="0" cellpadding="0"  id="topdev_tabbox">
	<tr>

<%
for(int i=1; i<=t_tabCount; i++)
{
	request.setAttribute("tablabel",	name+".tablabel"+i);
	request.setAttribute("tab_i",		i);
	%>
	<td

		<c:if test="${mainObject.currentTab == tab_i}">
			class="tab_active"
		</c:if>
		<c:if test="${mainObject.currentTab != tab_i}">
			class="tab_inactive"
		</c:if>
		id="<%=name%>_tab<%=i%>"><nobr>
		<table id="<%=name%>_tabContent<%=i%>">
		<tr>
			<td>
				<div
					id="${ns}_divX<%=i%>"
					<s:if test="action != 'edit'">class="tab_divX"</s:if>
					style="display:none">
					<s:if test="action != 'edit'"><b>&nbsp;&nbsp;&nbsp;</b></s:if>
				</div>
			</td>
			<td >
				<nobr>
					<a href="javascript:goToTab(${tab_i})">
						<tv2:msg key="${tablabel}"/>
					</a>
				</nobr>
			</td>
		</tr>
		</table>
		</nobr>
	</td>
	<%
	if((i)<t_tabCount)
	{
		%>
		<td class="tab_pusher1" id="<%=name%>_tab_pusher_<%=i%>">
			&nbsp;
		</td>
		<%
	}
	else
	{
		%>
		<td width="100%" class="tab_pusher2" id="<%=name%>_tab_pusher_<%=i%>">&nbsp;
		</td>
		<%
	}
}
%>

</tr>
</table>