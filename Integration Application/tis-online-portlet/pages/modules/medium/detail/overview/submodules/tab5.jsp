<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>

<table class="topdev_form" width="750">
	<colgroup>
		<col width="130px">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col width="20%">
		<col>
		<col width="100px">
	</colgroup>
	<s:push value="mainObject.bobj">
		<tr>
			<tv2:fieldlabel key="mediumStatusCode"/>
			<tdl:var-set name="content"><s:property value="mediumStatusDecode"/></tdl:var-set>
			<tdl:var-set name="value"><s:property value="mediumStatusCode"/></tdl:var-set>
			<tv2:dropdown serviceName="com.topdev.service.mediumstatus.Client" style="height:20px" obligation="true" colspan="3" name="mediumStatusCode" nullable="true" labelname="funktion" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumstatus" anwf="MITW" content="${content}" value="${value}"/>

			<tv2:checkbox name="isOeffentlich" colspan="2"><s:property value="isOeffentlich"/></tv2:checkbox>
		</tr>	
		<tr>
			<tv2:fieldlabel key="auszeichnungen"/>
			<tv2:textarea  name="auszeichnungen" maxlength="1000" rows="3" colspan="5"><s:property value="auszeichnungen"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="vertrieb"/>
			<tv2:textarea  name="vertrieb" maxlength="1000" rows="3" colspan="5"><s:property value="vertrieb"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="bemerkungen"/>
			<tv2:textarea  name="bemerkungen" maxlength="1000" rows="3" colspan="5"><s:property value="bemerkungen"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="erschliesser"/>
			<tv2:textarea  name="erschliesser" maxlength="1000" rows="3" colspan="5"><s:property value="erschliesser"/></tv2:textarea>
		</tr>	
		<tr>
			<tv2:fieldlabel key="systemvoraussetzungen"/>
			<tv2:textfield  name="systemvoraussetzungen" maxlength="255" colspan="5"><s:property value="systemvoraussetzungen"/></tv2:textfield>
		</tr>	
		<tr>
			<tv2:fieldlabel key="preis"/>
			<tv2:textfield  name="preis" maxlength="255" colspan="5"><s:property value="preis"/></tv2:textfield>
		</tr>	
		<tr>
			<tv2:fieldlabel key="verfuegbarkeitAnfang" />
			<tv2:textfield  name="verfuegbarkeitAnfang" colspan="1" maxlength="10"><s:property value="verfuegbarkeitAnfang"/></tv2:textfield>

			<tv2:fieldlabel key="verfuegbarkeitEnde"/>
			<tv2:textfield  name="verfuegbarkeitEnde" colspan="1" maxlength="10"><s:property value="verfuegbarkeitEnde"/></tv2:textfield>

			<tv2:fieldlabel key="verleihEnde"/>
			<tv2:textfield  name="verleihEnde" colspan="1" maxlength="10"><s:property value="verleihEnde"/></tv2:textfield>

		</tr>	
	</s:push>
	<s:push value="mainObject">
		<tr>
			<td colspan="6">
				<tdl:var-set name="sublistName">isbn_liste</tdl:var-set>
				<%@ include file="templates/template-isbn.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="6">
				<tdl:var-set name="sublistName">signatur_liste</tdl:var-set>
				<%@ include file="templates/template-signatur.jsp" %>
			</td>
		</tr>	
		<tr>
			<td colspan="6">
				<tdl:var-set name="sublistName">standort_liste</tdl:var-set>
				<%@ include file="templates/template-standort.jsp" %>
			</td>
		</tr>	
	</s:push>
</table>

<%@ include file="tab-foot.jsp" %>
