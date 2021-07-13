<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="futr_id" value="<s:property value="futr_id"/>"/>

<table class="topdev_form">
<colgroup>
	<col>
	<col width="300px">
</colgroup>
<tr>
	<tui:fieldlabel>Funktion:</tui:fieldlabel>		
	<tdl:var-set name="content"><s:property value="funktion"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="funktion_code"/></tdl:var-set>
	<tui:dropdown name="funktion_code" nullable="true" labelname="funktion" obligation="true" parameter="TBSH=FUNK&ANWF=MITW" preload="FUNK" anwf="MITW" colspan="3" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel>Titel:	</tui:fieldlabel>	
	<tui:textfield  name="titel" maxlength="30"><s:property value="Titel"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel>Vorname:</tui:fieldlabel>
	<tui:textfield  name="vorname" obligation="true" maxlength="50"><s:property value="Vorname"/></tui:textfield>			
</tr>
<tr>
	<tui:fieldlabel>Nachname:</tui:fieldlabel>	
	<tui:textfield  name="nachname" obligation="true" maxlength="50"><s:property value="Nachname"/></tui:textfield>	
</tr>
<tr>
	<tui:fieldlabel>Erreichbarkeit:	</tui:fieldlabel>	
	<tui:textfield  name="erreichbarkeit" ><s:property value="Erreichbarkeit"/></tui:textfield>
</tr>
<tr>
	<td colspan="5" class="buttonbar">
		<tui:button type="ok">
			var url = '<tui:url>/contributer/contributer-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/contributer/contributer-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
</form>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
