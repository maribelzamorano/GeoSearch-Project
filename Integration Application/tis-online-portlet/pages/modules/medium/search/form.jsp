<%@ include file="init.jsp" %>

<script>
function ${ns}_after_search()
{
	if(document.all && document.getElementById("t389_success"))
	{
		location.href="/web/guest/media/search";
	}
}
function ${ns}_search()
{
	//alert(document.getElementById('suchbegriff').value);
	var url='<tv2:url>/medium_search/search.action</tv2:url>&' +Form.serialize(document.getElementById('${ns}_form'));
	TopdevUtil.updateDiv("${ns}_div_loaded", url, ${ns}_after_search);
	//alert(url);
	return false;
}
function showPopupSelectSachgebiete(divId, actionName, ns)
{
	var url = '/tis-online-portlet'+actionName+'.action?ajaxId='+divId;
	popup001 = Liferay.Popup( { title: "Auswahl", message: document.getElementById(divId).innerHTML, modal: true, width:600, height:460 } );
	if(document.getElementById(divId+'_loaded').value=="0") AjaxUtil.update(url, popup001);
	document.getElementById(divId+'_loaded').value = "1";
}

function showPopupSelectSchlagworte(divId, actionName, ns)
{
	var url = '/tis-online-portlet'+actionName+'.action?ajaxId='+divId;
	popup001 = Liferay.Popup( { title: "Auswahl", message: document.getElementById(divId).innerHTML, modal: true, width:300, height:460 } );
	if(document.getElementById(divId+'_loaded').value=="0") AjaxUtil.update(url, popup001);
	document.getElementById(divId+'_loaded').value = "1";
}

function popupSelect(tobj, divId, code)
{
	if(divId=='${ns}_select_div_sachgebiete')
	{
		if(document.getElementById('sachgebiete').value!='') document.getElementById('sachgebiete').value+=",";
		document.getElementById('sachgebiete').value += " "+code;
	}
	else if(divId=='${ns}_select_div_schlagworte')
	{
		if(document.getElementById('schlagworte').value!='') document.getElementById('schlagworte').value+=",";
		document.getElementById('schlagworte').value += " "+code;
	}
	tobj.disabled = true;
	Liferay.Popup.close(tobj);
}


</script>
<s:push value="searchObj">
<c:set var="extendedContents">
	<s:property value="mediumArtCode"/>
	<s:property value="mediumNummer"/>
	<s:property value="produktionsjahrVon"/>
	<s:property value="produktionsjahrBis"/>
	<s:property value="schlagworte"/>
	<s:property value="sachgebiete"/>
	<s:property value="adressaten"/>
	<s:property value="mediumStatusCode"/>
</c:set>

<c:set var="extended">${not empty extendedContents}</c:set>
<c:set var="clearForm"><s:property value="clearForm"/></c:set>
<s:if test="clearForm == 1"><c:set var="extended">false</c:set></s:if>

<style>
.topdev_form input, .topdev_form select	{ max-width:165px; }
.topdev_form #produktionsjahrBis		{ max-width:65px; }
</style>

<form id="${ns}_form" name="${ns}_form" action="/web/guest/media/search" onsubmit="return ${ns}_search();">

<table class="topdev_form topdev_form_view" width="165px">
	<tr><tv2:fieldlabel key="suchbegriff"/></tr>
	<tr height="23px"><tv2:textfield  name="suchbegriff" maxlength="255"><s:property value="suchbegriff"/></tv2:textfield></tr>
	<tr><tv2:fieldlabel key="titelsuche"/></tr>
	<tr height="23px"><tv2:textfield name="mediumTitel" maxlength="100"><s:property value="mediumTitel"/></tv2:textfield></tr>
</table>

<div id="${ns}_ext" style="display:${extended?'inline':'none'}">
<table class="topdev_form topdev_form_view" width="165px">
<colgroup>
		<col width="145px">
		<col width="20px">
</colgroup>
<tr>	<tv2:fieldlabel  key="sachgebieteDesMediums"/><td></td></tr>
<tr>	<tv2:textfield  name="sachgebiete" maxlength="1000"><c:if test="${extended}"><s:property value="sachgebiete"/></c:if></tv2:textfield>
		<td><a href="javascript:;" onclick="showPopupSelectSachgebiete('${ns}_select_div_sachgebiete','/medium_search/sachgebiete_select','${ns}')">
		<img class="multiselect" src="/tis-online-portlet/images/nothing.gif" border="0"/>
		</a></td>
	</tr>
<tr><tv2:fieldlabel key="schlagworte"/><td></td></tr>
<tr><tv2:textfield  name="schlagworte" maxlength="1000"><s:property value="schlagworte"/></tv2:textfield>
	<td>
		<a href="javascript:;" onclick="showPopupSelectSchlagworte('${ns}_select_div_schlagworte','/medium_search/schlagworte_select','${ns}')">
		<img class="multiselect" src="/tis-online-portlet/images/nothing.gif" border="0"/>
		</a>
	</td>
</tr>
<tdl:var-set name="content"><s:property value="Decode"/></tdl:var-set>
<tdl:var-set name="value"><s:property value="adressaten"/></tdl:var-set>
<c:if test="${not extended}"><tdl:var-set name="content"></tdl:var-set><tdl:var-set name="value"></tdl:var-set></c:if>
<tr><tv2:fieldlabel key="adressaten"/><td></td></tr>
<tr><td colspan = "2" height="23px">
		<tv2:dropdown
			serviceName="com.topdev.service.mediumadr.Client"
			notd="true"
			name="adressaten"
			style="width:165px,;height:20px"
			labelname="Decode"
			parameter="TBSH=schu"
			preload="mediumadr"
			content="${content}"
			value="${value}"/>
	</td></tr>

<tdl:var-set name="content"><s:property value="mediumArtDecode"/></tdl:var-set>
<tdl:var-set name="value"><s:property value="mediumArtCode"/></tdl:var-set>
<tr><tv2:fieldlabel key="mediumArtCode"/><td></td></tr>
<tr><td colspan = "2" height="23px">
	<tv2:dropdown
		serviceName="com.topdev.service.mediumart.Client"
		notd="true"
		name="mediumArtCode"
		style="width:165px;height:20px"
		labelname="mediumArtDecode"
		parameter="TBSH=schu"
		preload="mediumart"
		content="${content}"
		value="${value}"/>
</td></tr>

<tr><tv2:fieldlabel key="mediumNummer"/><td></td></tr>
<tr height="23px"><tv2:textfield colspan = "2" name="mediumNummer" maxlength="8"><s:property value="mediumNummer"/></tv2:textfield><td></td></tr>
<tr>
	<td colspan = "2">
		<table width="100%">
			<colgroup>
				<col width="60px">
				<col width="45px">
			</colgroup>
			<tr><tv2:fieldlabel key="produziertVon" colspan = "3"/></tr>
			<tr style = "text-align:center" height="23px"><tv2:textfield  name="produktionsjahrVon" maxlength="4"><s:property value="produktionsjahrVon"/></tv2:textfield>
				<tv2:fieldlabel key="produziertBis"/>
				<tv2:textfield  name="produktionsjahrBis" maxlength="4"><s:property value="produktionsjahrBis"/></tv2:textfield>
		
		</table>
	</td><td></td>
</tr>
	
<tv2:permission object="mediumStatus" action="read">
	<tdl:var-set name="content"><s:property value="mediumStatusDecode"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="mediumStatusCode"/></tdl:var-set>
	<tr><td>Medienstatus:</td><td></td></tr>
	<tr><td colspan = "2" height="23px">
		<tv2:dropdown
			serviceName="com.topdev.service.mediumstatus.Client"
			notd="true"
			name="mediumStatusCode"
			style="width:165px;height:20px"
			labelname="mediumStatusDecode"
			parameter="TBSH=schu"
			preload="mediumstatus"
			content="${content}"
			value="${value}"/>
	</td></tr>
</tv2:permission>
</table>
</div>
<table class="topdev_form">
<tr>
	<td>
		<input type="button" onclick="TopdevUtil.clearForm('${ns}_form')" value="Leeren" class="portlet-form-button-line"/>
	    <input style="padding-top:0px" type="submit" value="Suchen"	class="portlet-form-button"/>
	</td>
</tr>
<tr>
	<td style="padding-top:8px">
	</td>
</tr>
</table>

<div id="${ns}_button_ext" style="display:${not extended?'inline':'none'}">
	<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="erweiterte Suche" border="0"/>
	&nbsp;<a class="topdev_link" href="#" onclick="document.getElementById('${ns}_ext').style.display='inline'; document.getElementById('${ns}_button_ext').style.display='none'; document.getElementById('${ns}_button_lim').style.display='inline';">erweiterte Suche</a>
</div>
<div id="${ns}_button_lim" style="display:${extended?'inline':'none'}">
	<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="eingeschr&auml;nkte Suche" border="0"/>
	&nbsp;<a class="topdev_link" href="#" onclick="document.getElementById('${ns}_ext').style.display='none'; document.getElementById('${ns}_button_ext').style.display='inline'; document.getElementById('${ns}_button_lim').style.display='none';">eingeschr&auml;nkte Suche</a>
</div>
</form>
</s:push>
<div id="${ns}_div_loaded"></div>

<c:set var="tDivName">${ns}_select_div_sachgebiete</c:set>
<input type="hidden" id="${tDivName}_loaded" name="${tDivName}_loaded" value="0"/>
<div style="display:none" id="${tDivName}"><%@ include file="/pages/lib/fragment/dialog/loading.jsp" %></div>

<c:set var="tDivName">${ns}_select_div_schlagworte</c:set>
<input type="hidden" id="${tDivName}_loaded" name="${tDivName}_loaded" value="0"/>
<div style="display:none" id="${tDivName}"><%@ include file="/pages/lib/fragment/dialog/loading.jsp" %></div>

