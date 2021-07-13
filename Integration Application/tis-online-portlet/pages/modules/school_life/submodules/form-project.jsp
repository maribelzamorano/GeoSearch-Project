<%@ include file="init.jsp" %>
<s:push value="entry">
<tdl:var-set name="form_forwardUrl"><tui:url>/school_life/project-list_edit.action</tui:url></tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="id_entity" value="<s:property value="id_entity"/>"/>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="400">

</colgroup>

<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Kurzbezeichnung:</tui:fieldlabel>	
	<tui:textfield name="eipr_bezeichnung" obligation="true" maxlength="255"><s:property value="eipr_bezeichnung"/></tui:textfield>	 			
</tr>
<tr>
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>	
	<tui:textarea name="eipr_beschreibung" obligation="true" maxlength="1000" rows="7"><s:property value="eipr_beschreibung"/></tui:textarea>			
</tr>
<tr>
	<tui:fieldlabel>Weitere Informationen:&nbsp;	&nbsp;http://</tui:fieldlabel>	
	<tui:textfield name="weitere_informationen" obligation="false" maxlength="200"><s:property value="weitere_informationen"/></tui:textfield>			
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">sub_list2</tdl:var-set>
		<tdl:var-set name="tbsh">KLST</tdl:var-set>
		<tdl:var-set name="msgkey_info_new">klassen</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp" %><br/>
	</td>
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">sub_list1</tdl:var-set>
		<tdl:var-set name="tbsh">FACH</tdl:var-set>
		<tdl:var-set name="tbsh">FACH</tdl:var-set>
		<tdl:var-set name="msgkey_info_new">faecher</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp" %>
	</td>
</tr>
<tr>
	<td colspan="4" class="buttonbar" ><br/>
		<tui:button type="save" scope="tab">
			var url = '<tui:url>/school_life/project-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_life/project-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>

</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>