<%@ include file="init.jsp" %>


<table class=topdev_form>
<colgroup >
	<col >
	<col width="80px">
	<col width="320px">
</colgroup>
<c:if test="${anwf ne 'media'}">
	<tr>
		<tui:fieldlabel><tui:msg key="schulnummer${(anwf eq 'media')?'_media':''}" type="label"/></tui:fieldlabel>
		<td><s:property value="schulnummer"/><input type="hidden" name="schulnummer" value="<s:property value="schulnummer"/>"/></td>
		<td></td>
	</tr>
</c:if>
<tr>
	<tui:fieldlabel><tui:msg key="schulname1${(anwf eq 'media')?'_media':''}" type="label"/></tui:fieldlabel>
	<c:set var="dien_typ"><s:property value="dien_typ"/></c:set>
	<tui:textfield colspan="2" name="schulname" obligation="true" maxlength="100" readonly="${dien_typ eq '10' && derivat eq 'thillm'}"><s:property value="schulname"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel><tui:msg key="schulname2${(anwf eq 'media')?'_media':''}" type="label"/></tui:fieldlabel>
	<tui:textfield colspan="2" name="schulname2"><s:property value="schulname2"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel><tui:msg key="schulname3${(anwf eq 'media')?'_media':''}" type="label"/></tui:fieldlabel>
	<tui:textfield colspan="2" name="schulname3"><s:property value="schulname3"/></tui:textfield>
</tr>

<c:if test="${anwf ne 'media'}">
	<tr>
		<tui:fieldlabel><tui:msg key="schulart" type="label"/></tui:fieldlabel>
		<tdl:var-set name="content"><s:property value="schulart"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="schulart_code"/></tdl:var-set>
		<tui:dropdown name="schulart_code" labelname="schulart" parameter="TBSH=SCHU" obligation="true" nullable="true" preload="SCHU" colspan="2" content="${content}" value="${value}"/>
	</tr>
</c:if>
</table>

