<%@ include file="init.jsp" %>
<s:push value="mainObject">
	<table class="topdev_view" width="100%">

	<s:iterator value="personalSortList">
		<tr>
			<td class="topdev_title_gray_first" colspan="3"><s:property value="decode"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<s:action name="personal-list_view_filter" executeResult="true">
					<s:param name="filter"><s:property value="code"/></s:param>
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action><br/>
			</td>
		</tr>	
	</s:iterator>
	<s:if test="PersonalList.entryList.size>0" >
		<tr height="50px" valign="bottom"> 
			<td class="space_left" ></td>
			<td class="button" align="right">
				<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/personal_resources/print.action</tui:url>')"/>
			</td>
		</tr>

		<tr>
			<td ></td>
			<td class="change">
				<tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/>			
			</td>
		</tr>
	</s:if>
	<s:if test="PersonalList.entryList.size==0" >
		<tr>
			<td colspan="2"><tui:msg key="keine_daten" type="label"/>
			</td>
		</tr>
	</s:if>
	<tr>
		<td>
			<tui:icon type="editViewAction"/>
		</td>
		<td class="change">
		
		</td>
	</tr>
	</table>
</s:push>