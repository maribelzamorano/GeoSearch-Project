<%@ include file="init.jsp" %>
<s:push value="entry">
<tdl:var-set name="form_upload">true</tdl:var-set>
<tdl:var-set name="form_upload_url"><tui:url>/school_evolution/instrument-detail_save.action</tui:url></tdl:var-set>
<tdl:var-set name="form_forwardUrl"><tui:url>/school_evolution/instrument-list_edit.action</tui:url>&ajaxId=${ajaxId}</tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="400">
</colgroup>
<tr>
	<tui:fieldlabel key="instrument"/>
	<tdl:var-set name="content"><s:property value="instrument_art"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="instrument_art_code"/></tdl:var-set>
	<tui:dropedit name="instrument_art" value="${content}" obligation="true" notd="false">
		<tui:dropdown
			obligation="true"
			notd="true"
			onchange="document.getElementById('instrument_art').value = this.options[this.selectedIndex].text; document.getElementById('instrument_art').onchange();"
			name="instrument_art"
			labelname="instrument_art_decode"
			preload="SEIA"
			content="${content}"
			value="${content}"
			nullable="true"
			compareWithRow="DECODE"/>
	</tui:dropedit>
</tr>
<tr>
	<tui:fieldlabel key="beschreibung"/>
	<tui:textarea rows="2" name="beschreibung" obligation="true" maxlength="150"><s:property value="beschreibung"/></tui:textarea>
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">instrument_beteiligte_liste</tdl:var-set>
		<tdl:var-set name="tbsh">BTLG</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp" %>
	</td>
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">instrument_anla_liste</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template2.jsp" %>
	</td>
</tr>
<tr>
	<td colspan="2" class="buttonbar">
		<br/>
		<tui:button type="save" scope="tab" submit="true"></tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_evolution/instrument-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>

<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>