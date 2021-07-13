<%@ include file="init.jsp" %>
<s:push value="mainObject">
<table class="topdev_view" width="100%" cellspacing="0">
<s:if test="documentList.entryList.size>0 || linkList.entryList.size>0">
<%--
	<s:iterator value="documentSortList">
		<tr>
			<td class="topdev_title_gray_first" colspan="2"><s:property value="value"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<s:action name="document-list_view_filter" executeResult="true">
					<s:param name="filter"><s:property value="key"/></s:param>
				</s:action><br/>
			</td>
		</tr>	
	</s:iterator>
--%>
		<tr>
			<td colspan="2">
				<s:action name="document-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
				<br/>
			</td>
		</tr>	
</s:if>
<s:else>
	<tr>	
		<td colspan="2">
			<tui:msg key="keine_daten" type="label"/><br/>
		</td>
	</tr>
</s:else>
</table>
</s:push>