<%@ include file="init.jsp" %>
<s:push value="schoolWorkingGroup">
	<table class="topdev_view" width="100%" cellspacing="0">
	<s:iterator value="workinggroupSortList">
		<tr>
			<td class="topdev_title_gray" ><s:property value="value"/></td>
		</tr>
		<tr>
			<td >
				<s:action name="working_group-list_view_filter" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
					<s:param name="filter"><s:property value="key"/></s:param>
				</s:action><br/><br/>
			</td>
		</tr>	
	</s:iterator>
<s:if test="workinggroupList.entryList.size>0" >
	<tr height="50px" valign="bottom"> 
			<td class="button" align="right">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/working_group/print.action</tui:url>')"/>
		</td>
	</tr>
	<tr>
		<td class="change">
			<s:if test="pts != ''">Quelle:<s:property value="quelle"/> <br/>Stand: <s:property value="pts"/></s:if>
		</td>
	</tr>
</s:if>
<s:else> <tr><td><tui:msg key="keine_statistikdaten" type="label"/></td></tr>
</s:else>
	</table>
</s:push>