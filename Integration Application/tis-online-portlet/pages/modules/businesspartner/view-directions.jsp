<%@ include file="init.jsp" %>
<s:push value="mainObject">

<table class="topdev_view" width="100%">
<tr>
	<td colspan="2">
		<div class="title_big"><s:property value="schulname"/></div>
	</td>
</tr>

<tr>
	<td class="space" colspan="2">
		<s:property value="cc_strasse"/><br/>  
		<s:property value="cc_plz_ort"/> <br/><br/>
	</td>
</tr>
<tr>
	<td class="topdev_title_gray space_top" colspan="2">
		Wegbeschreibung
	</td>
</tr>
<tr>
	<td class="space block" colspan="2">
		<s:property value="wegbeschreibung"/><br/>
	</td>
</tr>
<tr>
	<td class="space block" colspan="2">
		<img src="<s:url value="/images/icons/portlet/forward.gif"/>" title="zur&uuml;ck" border="0"/>
		&nbsp;<a href="http://maps.google.de/maps?f=q&hl=de&q=<s:property value="cc_strasse"/>+<s:property value="cc_plz_ort"/>+" target="_blank">Adresse mit Google-Maps anzeigen</a>	
	</td>
</tr>

		
<tr>
	<td><br/><br/>
	<img src="<s:url value="/images/icons/portlet/back.gif"/>" title="zur&uuml;ck" border="0"/>
	&nbsp;<a href="<tui:url action="true" windowState="normal">view</tui:url>">
		Zur&uuml;ck zur Schule
	</a>

	</td>
</tr>
</table>
</s:push>