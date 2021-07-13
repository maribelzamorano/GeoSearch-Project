<%@ include file="init.jsp" %>
<s:push value="entry">
<tdl:var-set name="form_upload">true</tdl:var-set>
<tdl:var-set name="form_upload_url"><tui:url>/school_evolution/emphasis-detail_save.action</tui:url></tdl:var-set>
<tdl:var-set name="form_forwardUrl"><tui:url>/school_evolution/emphasis-list_edit.action</tui:url>&ajaxId=${ajaxId}</tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
<colgroup>
	<col >
	<col width="400px">
</colgroup>
<tr>
	<tui:fieldlabel key="bereich"/>
	<tdl:var-set name="content"><s:property value="entwicklungsschritt"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="entwicklungsschritt_code"/></tdl:var-set>
	<tui:dropdown name="entwicklungsschritt_code" nullable="true" obligation="true" labelname="entwicklungsschritt" parameter="TBSH=SESA" preload="SESA" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel key="beschreibung"/>
	<tui:textarea rows="2" name="schwerpunkt" obligation="true" maxlength="150"><s:property value="schwerpunkt"/></tui:textarea>
</tr>

<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">beteiligte_liste</tdl:var-set>
		<tdl:var-set name="tbsh">BTLG</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp"%>
	</td>
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">anla_liste</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template2.jsp" %>
	</td>
</tr>

<tr>
	<td colspan="2" class="buttonbar">
		<br/>
		<tui:button type="save" scope="tab">document.getElementById('<s:property value="ajaxId"/>_form').submit();</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_evolution/emphasis-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>

<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>