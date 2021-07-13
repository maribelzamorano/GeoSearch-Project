<%@ include file="init.jsp" %>
<s:push value="mainObject">
<tdl:var-set name="_mainId"><s:property value="id"/></tdl:var-set>
</s:push>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="spar_code" value="<s:property value="filter"/>"/>

<table class="topdev_form">
<colgroup>
	<col width="150px">
	<col width="350px">
</colgroup>

<tr>
	<tui:fieldlabel>
		<s:if test="filter=='PROJ'">Projekt:</s:if>
		<s:if test="filter=='VERS'">Schulversuch:</s:if>
		<s:if test="filter=='VORH'">Entwicklungsvorhaben:</s:if>
	</tui:fieldlabel>
	<tdl:var-set name="_p2"><s:property value="filter"/></tdl:var-set>
	<tdl:var-set name="_content"><s:property value="schw_bezeichnung"/></tdl:var-set>
	<tdl:var-set name="_value"><s:property value="schw_id"/></tdl:var-set>
	<tui:dropdown_filtered
		name="${_p2}_schw_id"
		labelname="${_p2}_schw_bezeichnung"
		obligation="true"
		nullable="true"
		preload="SCHW"
		anwf=""
		p1="${_mainId}"
		p2="${_p2}"
		colspan="3"
		content="${_content}"
		value="${_value}"
		exclusion="1"/>
</tr>
<tr>
	<td colspan="5" class="buttonbar">
		<tui:button type="ok">
			var url = '<tui:url>/school_intention/intention-detail_save.action</tui:url>&filter=<s:property value="filter"/>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_intention/intention-list_edit.action</tui:url>&filter=<s:property value="filter"/>')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
</form>