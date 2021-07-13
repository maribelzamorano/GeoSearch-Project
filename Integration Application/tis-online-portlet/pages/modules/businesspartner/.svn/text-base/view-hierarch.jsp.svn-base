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
		Telefon: <s:property value="telefon"/><br/>
		Telefax: <s:property value="telefax"/><br/>
		E-Mail: <a href=""><s:property value="email"/></a><br/>
		Internet: <a href=""><s:property value="url"/></a><br/>
	</td>
</tr>

<tr>
	<td class="topdev_title_gray space_top space" colspan="2">
		<a href="http://maps.google.de/maps?f=q&hl=de&q=<s:property value="cc_strasse"/>+<s:property value="cc_plz_ort"/>+" target="_blank">Wegbeschreibung</a>	
	</td>
</tr>
<tr>
	<td><br/><br/>
	<img src="<s:url value="/images/icons/portlet/back.gif"/>" title="zur&uuml;ck" border="0"/>  
		<a href="<tui:url action="true" windowState="normal">index</tui:url>&topdev_id=<s:property value="mainId"/>&topdev_anwf=<s:property value="anwf"/>&topdev_option=<s:property value="option"/>"/>
		Zur&uuml;ck zur Schule</a>
	</td>
</tr>
</table>
</s:push>