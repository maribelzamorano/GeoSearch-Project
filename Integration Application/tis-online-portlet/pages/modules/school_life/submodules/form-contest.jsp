<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="wete_id" value="<s:property value="wete_id"/>"/>

<table class="topdev_form">
<colgroup>
	<col>
	<col width="800px">
</colgroup>

<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel align="left">Kurzbezeichnung:</tui:fieldlabel>	
	<tdl:var-set name="content"><s:property value="wett_bezeichnung"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="wett_bezeichnung_code"/></tdl:var-set>
	<tui:dropdown name="wett_bezeichnung_code" labelname="bezeichnung" obligation="true" nullable="true" parameter="TBSH=WETT" preload="WETT" content="${content}" value="${value}"/>
</tr>

<tr>
	<td colspan="3" class="buttonbar" align="right"><br/>
				<tui:button type="save" scope="tab">
			var url = '<tui:url>/school_life/contest-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_life/contest-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>

</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>