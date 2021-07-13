<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>


<s:push value="mainObject.bobj">
<table class="topdev_form" width="750">
	<colgroup>
		<col>
		<col width="70px">
		<col width="140px">
		<col width="100px">
		<col width="100px">
		<col width="150px">
	</colgroup>
	<tr>
		
		<tv2:fieldlabel key="mediumNummer"/>
		<tv2:textfield  name="mediumNummer" maxlength="8" obligation="true"><s:property value="mediumNummer"/></tv2:textfield>


		<tv2:fieldlabel key="dokumentierendeStelleId" nobr="true"/>
		<tdl:var-set name="content"><s:property value="dokumentierendeStelleBez"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="dokumentierendeStelleId"/></tdl:var-set>
		<tv2:dropdown serviceName="com.topdev.service.dokumentierendestelle.Client" tdalign="right" colspan="3" name="dokumentierendeStelleId" style="height:20px;" nullable="true" labelname="dokumentierendeStelleBez" parameter="TBSH=FUNK&ANWF=MITW" preload="dokumentierendestellele" anwf="MITW" obligation="true" content="${content}" value="${value}"/>
	</tr>
	<tr>
		<tv2:fieldlabel key="mediumArtCode"/><%-- Medienart: --%>
		<tdl:var-set name="content"><s:property value="mediumArtDecode"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="mediumArtCode"/></tdl:var-set>
		<tv2:dropdown serviceName="com.topdev.service.mediumart.Client" name="mediumArtCode" style="height:20px;" colspan="3"  nullable="true" labelname="mediumArtDecode" obligation="true" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumart" anwf="MITW" content="${content}" value="${value}"/>
	
		<tv2:fieldlabel key="mediumUnterartCode"/><%-- Medienunterart: --%>
		<tdl:var-set name="content"><s:property value="mediumUnterartDecode"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="mediumUnterartCode"/></tdl:var-set>
		<tv2:dropdown serviceName="com.topdev.service.mediumunterart.Client" name="mediumUnterartCode" style="height:20px;" nullable="true" labelname="mediumUnterartDecode" obligation="false" parameter="TBSH=FUNK&ANWF=MITW" preload="mediumunterart" anwf="MITW" content="${content}" value="${value}"/>
	</tr>	
	<tr>
		<tv2:fieldlabel key="serientitel"/><%-- Serientitel: --%>
		<tv2:textfield colspan="5" name="serientitel" maxlength="255"><s:property value="serientitel"/></tv2:textfield>
	</tr>
	<tr>
		<tv2:fieldlabel key="serienuntertitel"/><%--Serienuntertitel:  --%>
		<tv2:textfield colspan="5" name="serienuntertitel" maxlength="255"><s:property value="serienuntertitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="serienoriginaltitel"/><%-- Serienoriginaltitel --%>
		<tv2:textfield colspan="5" name="serienoriginaltitel" maxlength="255"><s:property value="serienoriginaltitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="seriensortiertitel"/><%-- Seriensortiertitel --%>
		<tv2:textfield colspan="5"name="seriensortiertitel" maxlength="59"><s:property value="seriensortiertitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="einzeltitel"/><%--Einzeltitel --%>
		<tv2:textarea colspan="5"  name="einzeltitel" obligation="true" maxlength="1000" cols="70" rows="2"><s:property value="einzeltitel"/></tv2:textarea>
	</tr>	
	<tr>
		<tv2:fieldlabel key="einzeluntertitel"/><%-- Einzeluntertitel --%>
		<tv2:textfield colspan="5" name="einzeluntertitel" maxlength="255"><s:property value="einzeluntertitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="einzeloriginaltitel"/><%--Einzeloriginaltitel  --%>
		<tv2:textfield colspan="5" name="einzeloriginaltitel" maxlength="255"><s:property value="einzeloriginaltitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="einzelsortiertitel"/><%--Einzelsortiertitel  --%>
		<tv2:textfield colspan="5" name="einzelsortiertitel" maxlength="59"><s:property value="einzelsortiertitel"/></tv2:textfield>
	</tr>	
	<tr>
		<tv2:fieldlabel key="kurzinhalt"/><%-- Kurzinhalt --%>
		<tv2:textarea colspan="5"  name="kurzinhalt" obligation="false" maxlength="1000" cols="70" rows="2"><s:property value="kurzinhalt"/></tv2:textarea>
	</tr>	
	<tr>
		<tv2:fieldlabel key="inhalt"/><%--  Inhalt--%>
		<tv2:textarea colspan="5"  name="inhalt" maxlength="5000" cols="70" rows="5"><s:property value="inhalt"/></tv2:textarea>
	</tr>	
	<tr>
		<tv2:fieldlabel key="serienbeschreibung"/><%-- Serienbeschreibung --%>
		<tv2:textarea colspan="5"  name="serienbeschreibung" obligation="false" maxlength="1000" cols="70" rows="2"><s:property value="serienbeschreibung"/></tv2:textarea>
	</tr>
	<tr>
		<tv2:fieldlabel key="anzahlLaufzeitFarben"/>
		<tv2:textfield  name="anzahlLaufzeitFarben" maxlength="255" colspan="5"><s:property value="anzahlLaufzeitFarben"/></tv2:textfield>
	</tr>
	<s:push value="mainObject">
		<tr>
			<td colspan="6">
				<tdl:var-set name="sublistName">sprache_liste</tdl:var-set>
				<%@ include file="templates/template-sprache.jsp" %>
			</td>
		</tr>	
	</s:push>
</table>

<%@ include file="tab-foot.jsp" %>
</s:push>