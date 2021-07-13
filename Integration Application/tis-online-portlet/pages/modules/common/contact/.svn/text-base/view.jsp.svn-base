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
			<tui:breaker><s:property value="beschreibung_gebaeude"/></tui:breaker>	
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
			<s:action name="handicap-list_view" executeResult="true"/>
		</td>
		<td valign="top" width="100%" style="padding-top:15px; padding-left:8px">
			<tui:breaker><s:property value="besonderheiten_beau"/></tui:breaker>
		</td>
	</s:if>
	<s:else>
		<td colspan="2" class="space" valign="top" width="100%">
			<tui:breaker><s:property value="besonderheiten_beau"/></tui:breaker>
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
			<tui:breaker><s:property value="beschreibung_weitere_gebaeude"/></tui:breaker><br/><br/>									
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
			<s:action name="sport-list_view" executeResult="true"/>
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
			<s:action name="cabinet-list_view" executeResult="true"/>	<br/>
		</td>
	</tr>
	</s:if>
	<s:if test="cabinetList.entryList.size>0 || sportList.entryList.size>0 || beschreibung_weitere_gebaeude!='' || beschreibung_gebaeude!='' || besonderheiten_beau!='' || handicapList.entryList.size>0" >
	<tr>
		<td>
		</td>
		<td class="change"><nobr><tui:msg key="change" type="label"/><s:property value="pts"/></nobr>
		</td>
	</tr>
</s:if>
<s:else><tr><td><tui:msg key="keine_daten" type="label"/></td></tr>
</s:else>
	<tr>
		<td>
			<s:if test="kz_edit==1">
				<a href="<tui:url action="true" windowState="maximized">edit</tui:url>">
					<img src="<s:url value="/images/icons/portlet/edit.gif"/>" title="bearbeiten" border="0"/>
				</a>	
			</s:if>
		</td>
		<td class="change">
		</td>
	</tr>

	</table>
	
</s:push>