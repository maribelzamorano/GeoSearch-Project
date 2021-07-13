<%@ include file="init.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="400px">
</colgroup>

<tr>
	<tui:fieldlabel>Schultr&auml;ger:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="schultraeger"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="gepa_id_traeger"/></tdl:var-set>
	<tui:dropdown name="gepa_id_traeger" labelname="schultraeger" parameter="TBSH=DITR" preload="DITR" obligation="true" nullable="true" colspan="3" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel>Schulamt:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="schulamt"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="schulamt_code"/></tdl:var-set>
	<tui:dropdown name="schulamt_code" labelname="schulamt" parameter="TBSH=KREI" preload="KREI" obligation="true" nullable="true" colspan="3" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel>Wegbeschreibung:</tui:fieldlabel>	
	<tui:textarea name="wegbeschreibung" maxlength="4000"><s:property value="wegbeschreibung"/></tui:textarea>
</tr>
<c:choose>
	<c:when test="${anwf ne 'media'}">
		<tr>
			<tui:fieldlabel>Leitbild:</tui:fieldlabel>	
			<tui:textarea obligation="true" name="leitbild" maxlength="4000"><s:property value="leitbild"/></tui:textarea>
		</tr>
	</c:when>
	<c:otherwise>
		<tr>
			<tui:fieldlabel>Aufgaben:</tui:fieldlabel>	
			<tui:textarea name="aufgaben" maxlength="4000"><s:property value="aufgaben"/></tui:textarea>
		</tr>
		<tr>
			<tui:fieldlabel>&Ouml;ffnungszeiten:</tui:fieldlabel>	
			<tui:textarea name="oeffnungszeiten" maxlength="4000"><s:property value="oeffnungszeiten"/></tui:textarea>
		</tr>
	</c:otherwise>
</c:choose>
</table>