<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="futr_id" value="<s:property value="futr_id"/>"/>

<table class="topdev_form">
<colgroup>
	<col>
	<col width="150px">
	<col>
	<col width="150px">
</colgroup>

<tr>
	<tui:fieldlabel>Vorname:</tui:fieldlabel>
	<tui:textfield name="vorname" obligation="true" maxlength="100"><s:property value="vorname"/></tui:textfield>
	<tui:fieldlabel>Nachname:</tui:fieldlabel>
	<tui:textfield name="nachname" obligation="true" maxlength="100"><s:property value="nachname"/></tui:textfield>
</tr>

<tr>
	<tui:fieldlabel>Titel:</tui:fieldlabel>
	<tui:textfield name="titel" maxlength="40"><s:property value="titel"/></tui:textfield>
	<tui:fieldlabel>Telefon:</tui:fieldlabel>
	<tui:textfield name="telefon" maxlength="50"><s:property value="telefon"/></tui:textfield>
</tr>

<tr>
	<tui:fieldlabel>Funktion:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="funktion"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="funktion_code"/></tdl:var-set>
	<tui:dropdown name="funktion_code" nullable="true" labelname="funktion" preload="FUNK" anwf="PERE" obligation="true" colspan="3" content="${content}" value="${value}"/>	
</tr>

<tr>
	<tui:fieldlabel>E-Mail:</tui:fieldlabel>
	<tui:textfield name="email" colspan="3" maxlength="100"><s:property value="email"/></tui:textfield>
</tr>

<tr>
	<tui:fieldlabel>Sprechzeiten:</tui:fieldlabel>
	<tui:textarea name="sprechzeiten" colspan="3"><s:property value="sprechzeiten"/></tui:textarea>
</tr>

<tr>
	<tui:fieldlabel>Bemerkung:</tui:fieldlabel> 
	<tui:textarea name="bemerkung" colspan="3"><s:property value="bemerkung"/></tui:textarea>
</tr>

<tr>
	<td colspan="4" class="buttonbar"> 
		<tui:button type="ok" disabled="true">
			var url = '<tui:url>/personal_resources/personal-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/personal_resources/personal-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
</form>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>