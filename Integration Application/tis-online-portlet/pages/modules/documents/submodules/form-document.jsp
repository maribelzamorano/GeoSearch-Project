<%@ include file="init.jsp" %>
<s:push value="entry">
<tdl:var-set name="form_upload">true</tdl:var-set>
<tdl:var-set name="form_upload_url"><tui:url>/documents/document-detail_save.action</tui:url></tdl:var-set>
<tdl:var-set name="form_forwardUrl"><tui:url>/documents/document-list_edit.action</tui:url>&ajaxId=${ajaxId}</tdl:var-set>
<c:set var="doOnlySubmitIfThereAreNoObligations">true</c:set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form" width="500">
<colgroup>
	<col >
	<col width="80">
	<col width="140">
	<col width="130">
</colgroup>
<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>	
	<tui:fieldlabel>Dokumentart:</tui:fieldlabel>	
	<tdl:var-set name="content"><s:property value="dokumentart_decode"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="dokumentart_code"/></tdl:var-set>
	<tui:dropdown name="dokumentart_code" labelname="dokumentart_decode" preload="DAGR" parameter="TBSH=DAGR" colspan="3" obligation="true" content="${content}" value="${value}"/>
</tr>
<%-- 
<tr>
	<tui:fieldlabel>Dateiname:</tui:fieldlabel>	
	<tui:textfield colspan="2" name="name" obligation="true"><s:property value="name"/></tui:textfield>
	<td style="padding-left:2px"><tui:button type="upload"></tui:button></td>	
</tr>
--%>
<tr>
	<tui:fieldlabel>Dateiname:</tui:fieldlabel>
	<s:if test="name!=null && name!=''">
		<td colspan="3">
				<tdl:var-set name="downloadURL">/download/virtual/<s:property value="name"/></tdl:var-set>
				<a
					class="topdev_link"
					target="_blank"
					href="<tui:url>${downloadURL}</tui:url>&ANLA_ID=<s:property value="id_entity"/>">
					<s:property value="name"/>
				</a>
		</td>
	</s:if>
	<s:else>
		<tui:filefield colspan="3" name="dokument" obligation="true" width="300px"/>
	</s:else>
</tr>
<s:if test="!(name!=null && name!='')">
	<tr>
		<td></td>
		<td colspan="3">
			<i>
				Hinweis: Nachdem das Dokument erfolgreich hochgeladen wurde,
				steht es erst nach einem Virenscan zur Anzeige und zum Download zur Verf&uuml;gung.
				<br/>Dies kann bis zu 30 Minuten dauern.
			</i>
		</td>
	</tr>
</s:if>
<tr>	
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>		
	<tui:textarea colspan="3" name="beschreibung" obligation="true"><s:property value="beschreibung"/></tui:textarea>	
</tr>

<s:if test="groesse != null">
<tr>
	<tui:fieldlabel>Gr&ouml;&szlig;e:</tui:fieldlabel>		
	<td><s:property value="groesse"/></td>
	<tui:fieldlabel>Letzte Aktualisierung:</tui:fieldlabel>		
	<td><s:property value="datum"/></td>
</tr>
</s:if>

<tr>
	<td colspan="4">
		<tdl:var-set name="sublistName">gruppen_liste</tdl:var-set>
		<tdl:var-set name="tbsh">ANVW</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template3.jsp" %>
	</td>
</tr>
<tr>
	<tui:fieldlabel> </tui:fieldlabel>		
	<td> </td>
	<tui:fieldlabel> </tui:fieldlabel>		
	<td> </td>
</tr>
<tr>
	<td colspan="4" class="buttonbar">
		<br/>
		<tui:button type="save">
			document.getElementById('<s:property value="ajaxId"/>_form').submit();
		</tui:button>
		<script>
		</script>
		<tui:button type="abort">
			TopdevUtil.updateTab(
				'<tdl:var name="ns"/>',
				'<tdl:var name="ajaxId"/>',
				'<tui:url>/documents/document-list_edit.action</tui:url>');
		</tui:button>
	</td>
</tr>


</table>
</form>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>