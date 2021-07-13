<%@ include file="init.jsp" %>
<s:push value="mainObject">
<s:if test="pupilmagazineList.entryList.size>0">
	<table class="topdev_view" width="100%" cellspacing="0">
	<tr>
		<td class="topdev_title_gray_first" colspan="2">
			<%--<div>Sch&#252;lerzeitungen</div>	--%>
		</td>
	</tr>
	<tr>
		<td>
			<s:action name="pupil_magazine-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		<br/>
		</td>
	</tr>
	<tr height="50px" valign="bottom"> 				
		<td class="button" align="right">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/pupil_magazine/print.action</tui:url>')"/>
		</td>
	</tr>
	<tr>
		<td class="change">
			<s:if test="pts != ''">Quelle:<s:property value="quelle"/> <br/>Stand: <s:property value="pts"/></s:if>
		</td>		
	</tr>
	</table>
</s:if>
<s:else>
	<tui:msg key="keine_statistikdaten" type="label"/>
</s:else>
</s:push>