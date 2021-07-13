<%@ include file="init.jsp" %>
</form>
<s:push value="mainObject"><tdl:var-set name="gepaId"><s:property value="id"/></tdl:var-set></s:push>
<s:push value="entry">
<c:set var="scriptOnSubmit">
	var url = '<tui:url>/businesspartner/communication-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
	TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
</c:set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="300px">
	<col >	
</colgroup>

<tr>
	<tui:fieldlabel>Standort:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="gstaId"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="gstaId"/></tdl:var-set>
	<tui:dropdown name="gstaId" noCache="true" labelname="gstaBezeichnung" obligation="true" nullable="true" parameter="TBSH=GSTA" preload="GSTA" colspan="2" p1="${gepaId}" content="${content}" value="${value}"/>
</tr>

<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Art:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="kommunikationsart_decode"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="kommunikationsart"/></tdl:var-set>
	<tui:dropdown name="kommunikationsart" labelname="kommunikationsart_decode" obligation="true" nullable="true" preload="KOAR" parameter="TBSH=KOAR" colspan="2" content="${content}" value="${value}"/>
	
</tr>
<tr>
	<tui:fieldlabel>Verbindung:</tui:fieldlabel>
	<tui:textfield colspan="2" name="verbindung" obligation="true"><s:property value="verbindung"/></tui:textfield>	
</tr>
<tr>
	<td>
	</td>	
	<tui:checkbox name="bevorzugt"><s:property value="bevorzugt"/></tui:checkbox>
</tr>

<tr>
	<td colspan="3" class="buttonbar">
		<tui:button type="ok" submit="true">${scriptOnSubmit}</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/businesspartner/communication-list_edit.action</tui:url>')</tui:button>
	</td>
	
</tr>
</table>
</s:push>
</form>
<c:set var="scriptOnSubmit"></c:set>