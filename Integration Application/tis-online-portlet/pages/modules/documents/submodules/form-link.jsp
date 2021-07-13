<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col width="100px">
	<col width="400px">
</colgroup>

<tr>	
	<tui:fieldlabel>Verweis-Text:</tui:fieldlabel>		
	<tui:textfield name="text" obligation="true"><s:property value="text"/></tui:textfield>	
</tr>

<tr>	
	<tui:fieldlabel>Verweis-URL:</tui:fieldlabel>		
	<tui:textfield name="url" obligation="true"><s:property value="url"/></tui:textfield>	
</tr>


<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">gruppen_liste</tdl:var-set>
		<tdl:var-set name="tbsh">ANVW</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template3.jsp" %>
	</td>
</tr>
<tr>
	<tui:fieldlabel> </tui:fieldlabel>		
	<td> </td>
	<tui:fieldlabel> </tui:fieldlabel>		
	<td> </td>
</tr>
<tr>
	<td colspan="4" class="buttonbar">
		<br/>
		<tui:button type="save">
 			var url = '<tui:url>/documents/link-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<script>
		</script>
		<tui:button type="abort">
			TopdevUtil.updateTab(
				'<tdl:var name="ns"/>',
				'<tdl:var name="ajaxId"/>',
				'<tui:url>/documents/link-list_edit.action</tui:url>');
		</tui:button>
	</td>
</tr>


</table>
</form>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>