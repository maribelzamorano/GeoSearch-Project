<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<tdl:var-set name="portletBackUrl">neuter_resources?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">

<form accept-charset="UTF-8" action="<tui:url action="true">detail_save</tui:url>" method="post" id="<s:property value="ns"/>_form">

	<tui:tabBox tabCount="4" activeTabId="1" name="tabbox1">
		<tui:tab id="1" active="true">
			<s:action name="schoolhouse-form" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="2">
			<s:action name="handicap-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="3">
			<s:action name="sport-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="4">
			<s:action name="cabinet-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>

	<tui:buttonbar>
		<tui:button type="save">
			AjaxUtil.update(
				'<tui:url>/neuter_resources/save.action</tui:url>'+ '&'+ Form.serialize(document.getElementById('<s:property value="ns"/>_form')),
				'${ns}_info');</tui:button>
		<tui:button type="abort">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>

</form>

</s:push>