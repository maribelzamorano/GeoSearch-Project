<%@ include file="init.jsp" %>
<s:push value="mainObject">

	<table class="topdev_view" width="100%" cellspacing="0">
	<s:if test="ITroomList.entryList.size>0">
	<tr>
		<td class="topdev_title_gray_first" colspan="2">
			<div>Unterrichtsr&#228;ume mit PC-Technik</div>	
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="it_room-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		<br/>
		</td>
	</tr>
</s:if>
<s:if test="ComputerList.entryList.size>0">
		<tr>
		<td class="topdev_title_gray" colspan="2">
			<div>Rechnerausstattung im Sch&#252;lerbereich</div>	
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="computer-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
			<br/>
		</td>
	</tr>
</s:if>
<s:if test="InternetList.entryList.size>0">
	<tr>
		<td class="topdev_title_gray" colspan="2">
			<div>Internetanschluss</div>	
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="internet-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
			<br/>
		</td>
	</tr>
</s:if>
<s:if test="ITroomList.entryList.size>0 || InternetList.entryList.size>0 || ComputerList.entryList.size>0" >
	<tr height="50px" valign="bottom"> 		
		<td class="button" align="right">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/media/print.action</tui:url>')"/>
		</td>
	</tr>

	<tr>
		<td class="change">
			<s:if test="pts != ''">Quelle:<s:property value="quelle"/> <br/>Stand: <s:property value="pts"/></s:if>
		</td>	
	</tr>
</s:if>
<s:else><tr><td><tui:msg key="keine_statistikdaten" type="label"/></td></tr>
</s:else>
	</table>
</s:push>