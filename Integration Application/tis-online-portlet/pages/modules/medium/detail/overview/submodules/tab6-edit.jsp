<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>

<s:push value="entry">
<c:set var="id_entity"><s:property value="id_entity"/></c:set>
<c:if test="${empty id_entity}"><c:set var="id_entity">0</c:set></c:if>
<%@ include file="/pages/lib/fragment/form-v2/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="240px">
	<col width="70px">
	<col width="85px">
</colgroup>
<s:if test="status!=1">
	<tr>
		<tv2:fieldlabel>laufendeNummer</tv2:fieldlabel>
		<tv2:textfield name="laufendeNummer" obligation="true" maxlength="8"><s:property value="laufendeNummer"/></tv2:textfield>
		<td colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<tv2:fieldlabel>dateiname</tv2:fieldlabel>
		<tv2:textfield name="dateiname" obligation="true" maxlength="100" colspan="1" readonly="${id_entity=='0'?'false':'true'}"><s:property value="dateiname"/></tv2:textfield>

		<tv2:fieldlabel>format</tv2:fieldlabel>
		<tv2:textfield name="format" obligation="true" maxlength="50" readonly="${id_entity=='0'?'false':'true'}"><s:property value="format"/></tv2:textfield>
	
	</tr>
	<tr>
		<tv2:fieldlabel>dateigroesse</tv2:fieldlabel>
		<tv2:textfield name="dateigroesse" obligation="true" maxlength="7"><s:property value="dateigroesse"/></tv2:textfield>
		
		<tv2:fieldlabel>dateigroesseEinheitCode</tv2:fieldlabel>
		<tdl:var-set name="content"><s:property value="dateigroesseEinheitDecode"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="dateigroesseEinheitCode"/></tdl:var-set>
		<tv2:dropdown 
			serviceName="com.topdev.service.mediumgroesseneinheit.Client" 
			obligation="true" 
			name="dateigroesseEinheitCode"
			style="height:20px" 
			labelname="dateigroesseEinheitDecode" 
			nullable="true"
			parameter="TBSH=dateigroesseeinheit"
			preload="dateigroesseeinheit"
			content="${content}"
			value="${value}"/>
	
	
	</tr>
	
	<tr>
		<tv2:fieldlabel>urlText</tv2:fieldlabel>
		<tv2:textfield name="urlText" obligation="true" maxlength="50" colspan="3"><s:property value="urlText"/></tv2:textfield>
	</tr>
	<tr>
		<tv2:fieldlabel>medienverwendungCode</tv2:fieldlabel>
		
		<tdl:var-set name="content"><s:property value="medienverwendungDecode"/></tdl:var-set>
		<tdl:var-set name="value"><s:property value="medienverwendungCode"/></tdl:var-set>
		<tv2:dropdown 
			serviceName="com.topdev.service.mediumverwendung.Client" 
			obligation="true" 
			name="medienverwendungCode"
			style="height:20px"  
			labelname="medienverwendungDecode" 
			colspan="3" 
			nullable="true"
			parameter="TBSH=verwendung"
			preload="verwendung"
			content="${content}"
			value="${value}"
			readonly="${id_entity=='0'?'false':'true'}"/>
	</tr>
</s:if>
<s:else>
<tr>
	<td colspan="4">
	 	Um die Datei <s:property value="dateiname"/> (<s:property value="format"/>) nun auf den Medienserver zu &uuml;bertragen, benutzen Sie bitte nachfolgenden Link:<br/><br/>
		<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Datei auf Medienserver hochladen" border="0"/>
		&nbsp;<a href="javascript:;" onclick="TopdevUtil.activateForm('${ns}','${ajaxId}'); window.open('/tis-online-portlet/medium_navigation/medium-upload.action?mid=<s:property value="mainObject.bobj.id"/>&did=1&name=<s:property value="dateiname"/>&usage=<s:property value="medienverwendungCode"/>&type=<s:property value="format"/>');" class="topdev_link">Datei auf Medienserver hochladen</a>
		<input type="hidden" name="status" value="2"/>
		<br/>
		Nach erfolgreichen Hochladeprozess best&auml;tigen Sie bitte mit [Ok].
		<br/><br/>
		
	</td>
</tr>
</s:else>

<tr>
	<td colspan="4" class="buttonbar" align="right">
		<tv2:button type="ok">goToTab(6, 'save');</tv2:button>
		<tv2:button type="abort">goToTab(6, 'list');</tv2:button>
	</td>
</tr>
</table>
</s:push>
</form>
