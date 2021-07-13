<%@ include file="init.jsp" %>
</form>
<s:push value="cabinetEntry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form" >
<colgroup>
	<col >
	<col width="300px">
	<col >
	<col width="50px">
</colgroup>

<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Nutzungsprofil:</tui:fieldlabel>
	<tui:textfield name="nutzungsprofil" obligation="true"><s:property value="nutzungsprofil"/></tui:textfield>
	<tui:fieldlabel>Anzahl:</tui:fieldlabel>
	<tui:textfield name="anzahl"><s:property value="anzahl"/></tui:textfield>
</tr>

<tr>
	<td colspan="4" class="buttonbar"><br/><br/>
		<tui:button type="ok">
			var url = '<tui:url>/neuter_resources/cabinet-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/neuter_resources/cabinet-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table><br/><br/>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>

