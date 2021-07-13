<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>

<s:push value="mainObject.bobj">
<table class="topdev_form" width="750">
	<colgroup>
		<col width="130px">
		<col>
	</colgroup>
		<tr>
			<tv2:fieldlabel key="begleitmaterial"/>	
			<tv2:textarea  name="begleitmaterial" maxlength="1000" cols="70" rows="3"><s:property value="begleitmaterial"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="kontextmedien"/>	
			<tv2:textarea  name="kontextmedien" maxlength="1000" cols="70" rows="3"><s:property value="kontextmedien"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="internetlinks"/>	
			<tv2:textarea  name="internetlinks" maxlength="1000" cols="70" rows="3"><s:property value="internetlinks"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="erfahrungsbericht"/>	
			<tv2:textarea  name="erfahrungsbericht" maxlength="5000" cols="70"><s:property value="erfahrungsbericht"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="ausstrahlungsdatenSchulfernsehen"/>
			<td style="padding-right:4px;">
				<tv2:textfield notd="true" name="ausstrahlungsdatenSchulfernsehen" maxlength="255"><s:property value="ausstrahlungsdatenSchulfernsehen"/></tv2:textfield>
			</td>
		</tr>	
	
	<s:push value="mainObject">
		<tr>
			<td colspan="2">
				<tdl:var-set name="sublistName">adressat_liste</tdl:var-set>
				<%@ include file="templates/template-adressat.jsp" %>
			</td>
		</tr>	 
		<tr>
			<td colspan="2">
				<tdl:var-set name="sublistName">klassifikation_liste</tdl:var-set>
				<%@ include file="templates/template-klassifikation.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="2">
				<tdl:var-set name="sublistName">sachgebiet_liste</tdl:var-set>
				<%@ include file="templates/template-sachgebiet.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="2">
				<tdl:var-set name="sublistName">freiesschlagwort_liste</tdl:var-set>
				<%@ include file="templates/template-freiesschlagwort.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="2">
				<tdl:var-set name="sublistName">kontrolliertesschlagwort_liste</tdl:var-set>
				<%@ include file="templates/template-kontrolliertesschlagwort.jsp" %>
			</td>
		</tr>
	</s:push>
</table>

<%@ include file="tab-foot.jsp" %>
</s:push>