<%@ include file="init.jsp" %>
<s:push value="entry">

<tdl:var-set name="form_upload">true</tdl:var-set>
<tdl:var-set name="form_upload_url"><tui:url>/school_evolution/intention-detail_save.action</tui:url>&ajaxId=${ajaxId}&leave=true</tdl:var-set>
<tdl:var-set name="form_forwardUrl"><tui:url>/school_evolution/intention-list_edit.action</tui:url></tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>

<table class="topdev_form">
	<colgroup>
		<col>
		<col width="100px">
	</colgroup>
	<tr>
		<td/>
		<tui:checkbox name="teilnahme"><s:property value="teilnahme"/></tui:checkbox>
	</tr>
	<tr>
		<tui:fieldlabel key="beschluss"/>
		<tui:textfield name="beschluss" maxlength="10"><s:property value="beschluss"/></tui:textfield>
	</tr>
	<tr>
		<tui:fieldlabel key="expertenbesuch"/>
		<tui:textfield name="expertenbesuch" maxlength="10"><s:property value="expertenbesuch"/></tui:textfield>
	</tr>
	<tr>
		<tui:fieldlabel key="wiederholungsbesuch"/>
		<tui:textfield name="wiederholungsbesuch" maxlength="10"><s:property value="wiederholungsbesuch"/></tui:textfield>
	</tr>
	<tr>
		<tui:fieldlabel key="abschluss"/>
		<tui:textfield name="abschluss" maxlength="10"><s:property value="abschluss"/></tui:textfield>
	</tr>
	<%--auskommentiert wie in erster Stufe verlang...
	<tr>
		<td colspan="2">
			<tdl:var-set name="sublistName">intention_anla_liste</tdl:var-set>
			<%@ include file="/pages/lib/fragment/list/direct/body-template2.jsp" %>
			<br/><br/>
		</td>
	</tr>
	--%>
	<tr>
		<td colspan="6" class="buttonbar">
		<tui:button type="save" scope="tab">document.getElementById('<s:property value="ajaxId"/>_form').submit();</tui:button>
		<tui:button type="abort">location.replace(backUrl);</tui:button>
		</td>
	</tr>
</table>

<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>
