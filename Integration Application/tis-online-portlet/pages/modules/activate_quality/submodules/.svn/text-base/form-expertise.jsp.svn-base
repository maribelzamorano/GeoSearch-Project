<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="wiqu_id" value="<s:property value="wiqu_id"/>"/>

<table class="topdev_form" border="0" >
<colgroup>
	<col>
	<col width="30px">
	<col width="370px">
</colgroup>
<tr>
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>			
	<tui:textarea colspan="2" name="beschreibung" obligation="true" maxlength="255" rows="4"><s:property value="beschreibung"/></tui:textarea>
</tr>
<tr>
	<tui:fieldlabel>Sortierfolge:</tui:fieldlabel>			
	<tui:textfield name="sortierung" maxlength="1" ><s:property value="sortierung"/></tui:textfield>
	<td></td>
</tr>

<tr>
	<td colspan="3" class="buttonbar"></br>
		<tui:button type="ok">
			var url = '<tui:url>/activate_quality/expertise-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/activate_quality/expertise-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
</form>