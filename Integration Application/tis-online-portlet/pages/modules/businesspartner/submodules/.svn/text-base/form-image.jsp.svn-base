</form>

<%@ include file="init.jsp" %>
<s:push value="entry">
<tdl:var-set name="form_upload">true</tdl:var-set>
<tdl:var-set name="form_upload_url"><tui:url>/businesspartner/image-detail_save.action</tui:url></tdl:var-set>
<tdl:var-set name="form_forwardUrl"><tui:url>/businesspartner/image-list_edit.action</tui:url>&ajaxId=${ajaxId}</tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<tdl:var-set name="ANLA_ID"><s:property value="id_entity"/></tdl:var-set>


<style>
td.topdev_upload_field input
{
	height: 20px;
}
</style>


<table class="topdev_form">
<colgroup>
	<col>
	<col width="300px">
</colgroup>

<tr>
	<td>
		Anzeigebereich:
	</td>
	<tui:dropdown
		name="tbshCode"
		labelname="tbshDecode"
		obligation="true"
		nullable="true"
		parameter="TBSH=AZBE"
		preload="AZBE"
		content="" value=""/>
</tr>
<tr>
	<td>
		Datei:
	</td>
	<td class="topdev_upload_field">
		<input type="file" name="image" value=""/>
	</td>
</tr>
<tr>
	<td colspan="2" class="buttonbar" style="padding-top:8px">
		<tui:button type="ok" value="upload" scope="tab" >
			document.getElementById('${ajaxId}_infoDiv').innerHTML='<br/><table><tr><td><img src=&quot;/tis-online-portlet/images/design/loading.gif&quot;/></td><td>Bitte haben Sie einen Moment Geduld.<br/>Die Datei wird nun &uuml;bertragen...</td></tr></table><br/>'
			document.getElementsByName('${ajaxId}_form')[0].submit();
		</tui:button>
		<%--
		<tui:button type="ok">
 			var url = '<tui:url>/businesspartner/address-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		--%>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/businesspartner/image-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>

Hinweise:<br/>
<i>
	<ul style="width:600px">
		<li style="padding-bottom:5px">
			Beachten Sie unbedingt die aktuell g&uuml;ltigen urheberrechtlichen Bestimmungen, 
			insbesondere hinsichtlich der Abtretung der Namensnennung durch den Fotografen f&uuml;r 
			alle von Ihnen verwendeten Bilder!
		</li>
		<li style="padding-bottom:5px">
			Bei der Anzeige werden die Bilder auf eine Breite von 190 Pixel skaliert. 
			F&uuml;r eine optimale Darstellung skalieren Sie bitte das Bild vor dem Hochladen auf dieselbe Gr&ouml;&szlig;e.
		</li>
	</ul>
</i>



<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>