<%@ include file="init.jsp" %>

<script>
function ${ns}_after_search()
{
	if(document.all) location.href="/web/guest/media/logview";
}
function ${ns}_search()
{
	//alert(document.getElementById('suchbegriff').value);
	var url='<tv2:url>/medium_logview/search.action</tv2:url>&' +Form.serialize(document.getElementById('${ns}_form'));
	TopdevUtil.updateDiv("${ns}_div_loaded", url, ${ns}_after_search);
	//alert(url);
	return false;
}
</script>
<s:push value="logObj">

	<form id="${ns}_form" name="${ns}_form" action="/web/guest/media/logview" onsubmit="return ${ns}_search();">

		<table class="topdev_form">
			<colgroup>
				<col>
				<col width="130px">
				<col>
				<col width="79px">
				<col>
				<col width="79px">
			</colgroup>
			<tr>
				<tv2:fieldlabel key="loglevels"/>
				<tdl:var-set name="content"><s:property value="Decode"/></tdl:var-set>
				<tdl:var-set name="value"><s:property value="Code"/></tdl:var-set>
				<tv2:dropdown
					serviceName="com.topdev.service.eafimport.Client"
					name="logLevelCode"
					labelname="logLevelDecode"
					parameter="TBSH=schu"
					preload="eafimport"
					content="${content}"
					value="${value}"/>
				<tv2:fieldlabel key="dateVon"/>
				<tv2:textfield  name="dateVon" maxlength="10"><s:property value="dateVon"/></tv2:textfield>
				<tv2:fieldlabel key="dateBis"/>
				<tv2:textfield  name="dateBis" maxlength="10"><s:property value="dateBis"/></tv2:textfield>
			</tr>
			<tr>
				<td align="right" colspan="6">
					<input style="padding-top:0px" type="button" value="Leeren"	class="portlet-form-button" onclick="document.getElementById('dateVon').value=''; document.getElementById('dateBis').value=''; document.getElementById('Code').selectedIndex=0; "/>
					<input style="padding-top:0px" type="submit" value="Suchen"	class="portlet-form-button"/>
				</td>
			</tr>
		</table>
	</form>
<br>
<br>

<div class="back">
	<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Alle anzeigen" border="0"/>
	&nbsp;<a class="topdev_link" href="/web/guest/media/">Zur&uuml;ck zur &Uuml;bersicht</a>
</div>

<div id="${ns}_div_loaded">
<table class="topdev_form">
			<colgroup>
				<col>
				<col>
			</colgroup>

<s:if test="results != NULL">
<s:iterator value="results">
<tr>
	<td>
		<b>Auftrittszeitpunkt: </b><tv2:spacer><s:property value="creationDate"/></tv2:spacer>
	</td>
	<td>
		<b>Loglevel: </b><tv2:spacer><s:property value="logLevel"/></tv2:spacer>
	</td>
</tr>
<tr>
	<td valign="top" colspan="2">
		<tv2:spacer><s:property value="userMessage"/></tv2:spacer>
	</td>
	
</tr>
<tr></tr>
<tr></tr>
</s:iterator>
</s:if>
</table>		
</div>
<br>
<br>

<table class="topdev_view" width="100%" border="0">
	<tbody>
		<tr>
			<td align="left">
				<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tv2:url>/medium_logview/print.action</tv2:url>')"/>
			</td>
		<td align="right">
			<div class="back">
				<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Alle anzeigen" border="0"/>
				&nbsp;<a class="topdev_link" href="/web/guest/media/">Zur&uuml;ck zur &Uuml;bersicht</a>
			</div>
		</td>
		</tr>
	</tbody>
</table>


</s:push>


