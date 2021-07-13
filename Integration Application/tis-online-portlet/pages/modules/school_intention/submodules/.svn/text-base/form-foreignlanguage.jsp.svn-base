<%@ include file="init.jsp" %>
<s:push value="mainObject">
<tdl:var-set name="_mainId"><s:property value="id"/></tdl:var-set>
</s:push>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="spar_code" value="<s:property value="filter"/>"/>

<table class="topdev_form">
<colgroup>
	<col>
	<col width="350px">
</colgroup>

<tr>
	<tui:fieldlabel>
		Fremdsprache:
	</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="code"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="decode"/></tdl:var-set>
	<tui:dropdown
		name="code"
		labelname="decode"
		obligation="true"
		nullable="true"
		preload="FRSP"
		anwf=""
		colspan="3"
		parameter="TBSH=FRSP"
		content="${content}"
		value="${value}"/>
</tr>
<tr>
	<td colspan="5" class="buttonbar">
		<tui:button type="ok">
			var url = '<tui:url>/school_intention/foreignlanguage-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_intention/foreignlanguage-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
</form>