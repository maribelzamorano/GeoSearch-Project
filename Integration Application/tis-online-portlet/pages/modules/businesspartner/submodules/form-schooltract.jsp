<%@ include file="init.jsp" %>
</form>
<s:push value="entry">
<c:set var="scriptOnSubmit">
	var url = '<tui:url>/businesspartner/schooltract-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
	TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
</c:set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="350px">
</colgroup>
<%-- 
<tr>
	<tui:fieldlabel>Art:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="adressart_decode"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="adressart"/></tdl:var-set>
	<tui:dropdown name="adressart" labelname="adressart_decode" obligation="true" nullable="true" parameter="TBSH=ANAR" preload="ANAR" colspan="4" content="${content}" value="${value}"/>
				
</tr>
<tr>
	<tui:fieldlabel>Ort:</tui:fieldlabel>

	<tui:textfield name="ort" obligation="true" maxlength="40"><s:property value="Ort"/></tui:textfield>		
	<tui:fieldlabel>PLZ:</tui:fieldlabel>
	<tui:textfield colspan="4" name="plz" obligation="true" maxlength="20"><s:property value="Plz"/></tui:textfield>	
</tr>
<tr>
	<tui:fieldlabel>Stra&szlig;e/Postfach:</tui:fieldlabel>
	<tui:textfield name="strasse" obligation="true" maxlength="60"><s:property value="Strasse"/></tui:textfield>
		
	<tui:fieldlabel>Hausnummer:</tui:fieldlabel>
	<tui:textfield name="hausnummer_1" maxlength="4"><s:property value="hausnummer_1"/></tui:textfield>
	<tui:textfield name="hausnummer_2" maxlength="30" ><s:property value="hausnummer_2"/></tui:textfield>
	
</tr>--%>
<tr>
	<tui:fieldlabel>Nebenstelle:</tui:fieldlabel>
	<tui:textfield name="bezeichnung" maxlength="90" obligation="true"><s:property value="bezeichnung"/></tui:textfield>		
</tr>

<tr>
<td colspan="2" class="buttonbar">
		<tui:button type="ok" submit="true">${scriptOnSubmit}</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/businesspartner/schooltract-list_edit.action</tui:url>')</tui:button>
	</td>
	
	

</tr>
</table>
</s:push>
</form>
<c:set var="scriptOnSubmit"></c:set>