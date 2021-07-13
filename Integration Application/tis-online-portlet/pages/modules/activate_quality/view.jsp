<%@ include file="init.jsp" %>
<s:push value="mainObject">
<table class="topdev_view" width="100%" cellspacing="0">
	<s:if test="ExpertiseList.entryList.size>0" >
		<tr>
			<td colspan="3">
				<s:action name="expertise-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
				<br/>
			</td>
		</tr>	
	
		<tr height="50px" valign="bottom"> 
			<td colspan="2">
			</td>			
			<td class="button" align="right">
				<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/activate_quality/print.action</tui:url>')"/>
			</td>
		</tr>

		<tr>
			<td colspan="2">
			</td>
			<td class="change">
					<nobr><tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/></nobr>
			</td>
		</tr>
	</s:if>

	<s:if test="ExpertiseList.entryList.size==0" >
		<tr>
			<td colspan="2"><tui:msg key="keine_daten" type="label"/>
			</td>
		</tr>
	</s:if>
	<tr>
		<td colspan="2">
			<tui:icon type="editViewAction"/>
		</td>
		<td class="change">
		</td>
	</tr>
</table>	

</s:push>
