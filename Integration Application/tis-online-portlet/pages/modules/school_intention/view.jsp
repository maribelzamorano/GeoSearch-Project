<%@ include file="init.jsp" %>
<s:push value="mainObject">
<table class="topdev_view" width="100%" border="0">
<s:if test="intentionList.entryList.size>0 || foreignlanguageList.entryList.size>0">
	<s:if test="intentionList.entryList.size>0">
		<tr>	
			<td colspan="2">
				<s:action name="intention-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
			</td>
		</tr>
	</s:if>
	<s:if test="foreignlanguageList.entryList.size>0">
		<tr>	
			<td colspan="2">
				<s:action name="foreignlanguage-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
			</td>
		</tr>
	</s:if>
</s:if>
<s:else>
	<tr>	
		<td colspan="2">
			<tui:msg key="keine_daten" type="label"/><br/>
		</td>
	</tr>
</s:else>
<s:if test="intentionList.entryList.size>0 || foreignlanguageList.entryList.size>0" >
	<tr height="50px" valign="bottom"> 		
		<td class="button" align="right" colspan="2">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/school_intention/print.action</tui:url>')"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="change">
			<tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/>
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
