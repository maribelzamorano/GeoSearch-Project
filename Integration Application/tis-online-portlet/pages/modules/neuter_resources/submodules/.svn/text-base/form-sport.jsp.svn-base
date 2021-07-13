<%@ include file="init.jsp" %>
</form>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form" >
<colgroup>
	<col >
	<col width="100px">
	<col width="150px">
	<col >
	<col width="100px">
	<col width="12px">
</colgroup>
<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Art:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="sportstaettenart"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="sportstaettenart_code"/></tdl:var-set>
	<tui:dropdown name="sportstaettenart_code" labelname="sportstaettenart" obligation="true" nullable="true" parameter="TBSH=SPAR" preload="SPAR" colspan="5" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel>Entfernung von Schule:</tui:fieldlabel>
	<tui:textfield name="entfernung" maxlength="7"><s:property value="entfernung"/></tui:textfield>
	<td align="left">m</td>
	<tui:fieldlabel >Gr&ouml;&szlig;e:</tui:fieldlabel>
	<tui:textfield name="groesse" maxlength="7"><s:property value="groesse"/></tui:textfield>
	<td align="left">m&#178;</td>
</tr>
<tr>
	<tui:fieldlabel>Erreichbarkeit:</tui:fieldlabel>
	<tui:textarea rows="2" colspan="5" name="erreichbarkeit" maxlength="255"><s:property value="erreichbarkeit"/></tui:textarea>
</tr>

<tr>
	<tui:fieldlabel key="ausstattung"/>
	<tui:textarea rows="3" colspan="5" name="ausstattung" maxlength="255"><s:property value="ausstattung"/></tui:textarea>
</tr>
<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>
	<tui:textarea colspan="5" name="beschreibung" obligation="true" maxlength="1000"><s:property value="beschreibung"/></tui:textarea>
</tr>
<tr>
	<td colspan="6" class="buttonbar">

		<tui:button type="ok">
			var url = '<tui:url>/neuter_resources/sport-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/neuter_resources/sport-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table><br/><br/>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>


