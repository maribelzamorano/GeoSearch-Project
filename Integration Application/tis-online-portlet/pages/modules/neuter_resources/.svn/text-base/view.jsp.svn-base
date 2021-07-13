<%@ include file="init.jsp" %>

<s:push value="mainObject">
	
	<table class="topdev_view" width="100%" cellspacing="0">
<s:if test="beschreibung_gebaeude!=''">
	<tr>
		<td colspan="2" class="neuter_left" >
	
			<div class="topdev_title_gray_first">Schulgeb&auml;ude</div>
		</td>
	</tr>
	<tr >
		<td class="space" colspan="2">
			<tui:reviser><tui:breaker><s:property value="beschreibung_gebaeude"/></tui:breaker></tui:reviser>
		</td>		
	</tr>
</s:if>
<s:if test="besonderheiten_beau!='' || handicapList.entryList.size>0">	
	<tr>
		<td colspan="2" class="neuter_left" >
				<br/>
			<div class="topdev_title_gray">Behindertengerechte Ausf&uuml;hrung</div>
		</td>
	</tr>
	<tr >
	<s:if test="handicapList.entryList.size>0">
		<td class="space" valign="top" >
			<s:action name="handicap-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</td>
		<td valign="top" width="100%" style="padding-top:15px; padding-left:8px">
			<tui:reviser>
				<tui:breaker><s:property value="besonderheiten_beau"/></tui:breaker>
			</tui:reviser>
		</td>
	</s:if>
	<s:else>
		<td colspan="2" class="space" valign="top" width="100%">
			<tui:reviser>
				<tui:breaker><s:property value="besonderheiten_beau"/></tui:breaker>
			</tui:reviser>
		</td>
	</s:else>
	</tr>
</s:if>
<s:if test="beschreibung_weitere_gebaeude!=''">	
	<tr>
		<td class="neuter_left" colspan="2">
			<br/>
			<div class="topdev_title_gray">Schulhof / Weitere Geb&auml;ude </div>						
		</td>
	</tr>
	<tr>
		<td class="space" colspan="2">
			<tui:reviser>
				<tui:breaker><s:property value="beschreibung_weitere_gebaeude"/></tui:breaker><br/><br/>									
			</tui:reviser>
		</td>
	</tr>
</s:if>	
	
	<s:if test="sportList.entryList.size>0">
	<tr>
		<td colspan="2">
			<div class="topdev_title_gray">Sportst&auml;tten</div>
		</td>
	</tr>
	<tr>	
		<td colspan="2">
			<s:action name="sport-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		<br/>
		</td>
	</tr>
	</s:if>
	
	<s:if test="cabinetList.entryList.size>0">
	<tr>
		<td colspan="2">
			<div class="topdev_title_gray">Unterrichtsr&auml;ume und Fachkabinette</div>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<s:action name="cabinet-list_view" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
			<br/>
		</td>
	</tr>
	</s:if>
	<s:if test="cabinetList.entryList.size>0 || sportList.entryList.size>0 || beschreibung_weitere_gebaeude!='' || beschreibung_gebaeude!='' || besonderheiten_beau!='' || handicapList.entryList.size>0" >
	<tr height="50px" valign="bottom"> 
		<td class="space_left" >
		</td>
		<td class="button" align="right">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/neuter_resources/print.action</tui:url>')"/>
		</td>
	</tr>
	<tr>
		<td>
		</td>
		<td class="change"><nobr><tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/></nobr>
		</td>
	</tr>
</s:if>
<s:else><tr><td><tui:msg key="keine_daten" type="label"/></td></tr>
</s:else>
	<tr>
		<td>
			<tui:icon type="editViewAction"/>
		</td>
		<td class="change">
		</td>
	</tr>

	</table>
	
</s:push>