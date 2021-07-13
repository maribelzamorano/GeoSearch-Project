<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<input type="hidden" name="koop_id" value="<s:property value="koop_id"/>"/>

<table class="topdev_form" border="0" >
<colgroup>
	<col>
	<col width="80px">
	<col width="70px">
	<col width="30px">
	<col width="100px">
	<col width="80px">
</colgroup>
<tr>
	<tui:fieldlabel>Name:</tui:fieldlabel>			
	<tui:textfield  name="name" colspan="5" obligation="true" maxlength="100"><s:property value="name"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel>Partnerart:	</tui:fieldlabel>	
	<tdl:var-set name="content"><s:property value="partnerart"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="partnerart_code"/></tdl:var-set>
	<tui:dropdown name="partnerart_code" colspan="3" nullable="true" labelname="partnerart" obligation="true" parameter="TBSH=KOOA" preload="KOOA" content="${content}" value="${value}"/>
	
	<tui:fieldlabel >Partner seit:	</tui:fieldlabel>	
	<tui:textfield  name="beginn" maxlength="10" ><s:property value="Beginn"/></tui:textfield>
		
</tr>
<tr>	
	<tui:fieldlabel>PLZ:	</tui:fieldlabel>		
	<tui:textfield  name="plz" maxlength="20"><s:property value="plz"/></tui:textfield>	
	<td></td>
	<tui:fieldlabel>Ort:</tui:fieldlabel>			
	<tui:textfield  colspan="2" name="ort" maxlength="40"><s:property value="Ort"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel>Stra&szlig;e:	</tui:fieldlabel>		
	<tui:textfield  colspan="3" name="strasse" maxlength="100"><s:property value="strasse"/></tui:textfield>
	<tui:fieldlabel>Hausnummer:	</tui:fieldlabel>		
	<tui:textfield  name="hausnummer" maxlength="4"><s:property value="hausnummer"/></tui:textfield>
</tr>

<tr>
<tui:fieldlabel>Land:	</tui:fieldlabel>	
	
	<tdl:var-set name="content"><s:property value="land"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="land_code"/></tdl:var-set>
	<tui:dropdown colspan="5" name="land_code"  labelname="land" parameter="TBSH=LAND" content="${content}" value="${value}" preload="LAND"/>
	<td></td>
</tr>
<tr>
	<tui:fieldlabel>Schwerpunkt der <br/>Zusammenarbeit:</tui:fieldlabel>		
	<tui:textarea colspan="5" name="schwerpunkt" obligation="true" maxlength="1000"><s:property value="schwerpunkt"/></tui:textarea>	
</tr>
<tr>
	<tui:fieldlabel>Homepage:	&nbsp;	&nbsp;http://</tui:fieldlabel>			
	<tui:textfield colspan="5"  name="homepage" ><s:property value="homepage"/></tui:textfield>
</tr>
<tr>
	<td colspan="6" class="buttonbar">
		<tui:button type="ok">
			var url = '<tui:url>/cooperation/partner-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/cooperation/partner-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
</form>