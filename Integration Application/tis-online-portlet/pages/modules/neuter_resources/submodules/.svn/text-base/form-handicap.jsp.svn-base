<%@ include file="init.jsp" %>
</form>
<s:push value="handicapEntry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form" >
<colgroup>
	<col >
	<col width="250px">
</colgroup>

<tr>
	<tui:fieldlabel key="auar_code"/>
	<tdl:var-set name="content"><s:property value="auar_decode"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="auar_code"/></tdl:var-set>
	<tui:dropdown name="auar_code" labelname="auar_decode" nullable="true" obligation="true" parameter="TBSH=AUAR" preload="AUAR" content="${content}" value="${value}"/>
</tr>

<tr>
	<td colspan="2" class="buttonbar"><br/><br/>
		<tui:button type="ok">
			var url = '<tui:url>/neuter_resources/handicap-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/neuter_resources/handicap-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table><br/><br/>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>

