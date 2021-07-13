<%@ include file="init.jsp" %>
<s:push value="mainObject">

	<table class="topdev_view" width="100%" cellspacing="0">
<s:if test="LibraryList_manage.entryList.size>0">
	<tr>
		<td class="topdev_title_gray_first" colspan="2">
			<div>Verwaltung</div>	
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="manage-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
			<br/>
		</td>
	</tr>
	</s:if>
<s:if test="LibraryList_equipe.entryList.size>0">
	<tr>
		<td class="topdev_title_gray" colspan="2">
			<div>Ausstattung</div>	
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="equipe-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
			<br/>
		</td>
	</tr>
</s:if>			
<s:if test="LibraryList_manage.entryList.size>0" >
	<tr height="50px" valign="bottom"> 		
		<td class="button" align="right" colspan="2">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/school_library/print.action</tui:url>')"/>
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