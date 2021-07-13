<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>

<s:push value="mainObject.bobj">
<table class="topdev_form" width="750">
	<colgroup>
		<col width="130px">
		<col>
		<col>
		<col width="100px">
	</colgroup>
	
		<tr>
			<tv2:fieldlabel key="produktionsartCode"/>
			<tdl:var-set name="content"><s:property value="produktionsartDecode"/></tdl:var-set>
			<tdl:var-set name="value"><s:property value="produktionsartCode"/></tdl:var-set>
			<tv2:dropdown serviceName="com.topdev.service.mediumproart.Client" style="height:20px" colspan="1" name="produktionsartCode" nullable="true" labelname="funktion" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumproart" anwf="MITW" content="${content}" value="${value}"/>

			<tv2:fieldlabel key="produktionsjahr"/>	
			<tv2:textfield  name="produktionsjahr" maxlength="4"><s:property value="produktionsjahr"/></tv2:textfield>
		</tr>	
		<tr>
			<tv2:fieldlabel key="produzent"/>	
			<tv2:textarea  name="produzent" maxlength="1000" cols="70" rows="2" colspan="3"><s:property value="produzent"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="herausgeber"/>	
			<tv2:textarea  name="herausgeber" maxlength="1000" cols="70" rows="2" colspan="3"><s:property value="herausgeber"/></tv2:textarea>
		</tr>
		<tr>
			<tv2:fieldlabel key="fskVermerkCode"/>
			<tdl:var-set name="content"><s:property value="fskVermerkDecode"/></tdl:var-set>
			<tdl:var-set name="value"><s:property value="fskVermerkCode"/></tdl:var-set>
			<tv2:dropdown serviceName="com.topdev.service.mediumfsk.Client" style="height:20px" colspan="1" name="fskVermerkCode" nullable="true" labelname="funktion" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumfsk" anwf="MITW" content="${content}" value="${value}"/>

			<tv2:fieldlabel key="feiertagsfreigabeCode"/>
			<tdl:var-set name="content"><s:property value="feiertagsfreigabeDecode"/></tdl:var-set>
			<tdl:var-set name="value"><s:property value="feiertagsfreigabeCode"/></tdl:var-set>
			<tv2:dropdown serviceName="com.topdev.service.mediumfeiertagsfreigabe.Client" style="height:20px" colspan="1" name="feiertagsfreigabeCode" nullable="true" labelname="funktion" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumfeiertagsfreigabe" anwf="MITW" content="${content}" value="${value}"/>
		</tr>	
		<tr>
			<tv2:fieldlabel key="vorfuehrrechteBeschreibung"/>	
			<tv2:textfield  name="vorfuehrrechteBeschreibung" maxlength="255"><s:property value="vorfuehrrechteBeschreibung"/></tv2:textfield>

			<tv2:fieldlabel key="vorfuehrrechteDatum"/>	
			<tv2:textfield  name="vorfuehrrechteDatum" maxlength="10"><s:property value="vorfuehrrechteDatum"/></tv2:textfield>
		</tr>	
		<tr>
			<tv2:fieldlabel key="nothing"/>
			<tv2:checkbox  name="isGemaPflicht"><s:property value="isGemaPflicht"/></tv2:checkbox>

			<tv2:fieldlabel key="endabnahmejahr"/>	
			<tv2:textfield  name="endabnahmejahr" maxlength="4"><s:property value="endabnahmejahr"/></tv2:textfield>
		</tr>	
	
	<s:push value="mainObject">
		<tr>
			<td colspan="4">
				<tdl:var-set name="sublistName">produktionsland_liste</tdl:var-set>
				<%@ include file="templates/template-produktionsland.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="4">
				<tdl:var-set name="sublistName">urheber_liste</tdl:var-set>
				<%@ include file="templates/template-urheber.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="4">
				<tdl:var-set name="sublistName">lizenz_liste</tdl:var-set>
				<%@ include file="templates/template-lizenz.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="4">
				<tdl:var-set name="sublistName">lizenzpreis_liste</tdl:var-set>
				<%@ include file="templates/template-lizenzpreis.jsp" %>
			</td>
		</tr>	
	</s:push>
</table>
</s:push>
<%@ include file="tab-foot.jsp" %>
