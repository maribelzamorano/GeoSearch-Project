<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<script> var backUrl = "<tui:url action="true" windowState="normal">view</tui:url>"; </script>

<s:push value="mainObject">
	<form action="<tui:url action="true">detail_save</tui:url>" method="post"></form>
	<tui:tabBox tabCount="1" activeTabId="1" name="instrument_tabbox">
		<tui:tab id="1" active="true">
			<s:action name="instrument-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>

	<tui:buttonbar>
		<tui:button type="save">AjaxUtil.update('<tui:url>/system/instrument-save.action</tui:url>','${ns}_info');</tui:button>
		<tui:button type="abort">location.href='<tui:url action="true" windowState="normal">view</tui:url>';</tui:button>
	</tui:buttonbar>
</s:push>