<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="30">
	<col width="300">
</colgroup>
<tr>
	<tui:fieldlabel key="sortierung"/>
	<tui:textfield name="sort" maxlength="150"><s:property value="sort"/></tui:textfield>
	<td/>
</tr>
<tr>
	<tui:fieldlabel key="bezeichnung"/>
	<tui:textfield colspan="2" name="bezeichnung" obligation="true" maxlength="150"><s:property value="bezeichnung"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel key="art"/>
	<tdl:var-set name="content"><s:property value="art"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="art_code"/></tdl:var-set>
	<tui:dropdown colspan="2" name="art_code" nullable="true" obligation="true" labelname="art" preload="SWAR" content="${content}" value="${value}"/>
</tr>
<tr>
	<td/>
	<tui:checkbox name="kz_veraltet"><s:property value="kz_veraltet"/></tui:checkbox>
	<td/>
</tr>

<tr>
	<td colspan="3" class="buttonbar">
		<br/>
		<tui:button type="ok">
			var url = '<tui:url>/system/project-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/system/project-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>

<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>