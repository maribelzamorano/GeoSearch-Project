<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<tdl:var-set name="portletBackUrl">cooperation?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">
	<form action="<tui:url action="true">detail_save</tui:url>" method="post"></form>

	<tui:tabBox tabCount="1" activeTabId="1" name="tabbox1">		
		<tui:tab id="1" active="true">
			<s:action name="partner-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>		
	</tui:tabBox>

	<tui:buttonbar>
		<tui:button type="save">AjaxUtil.update('<tui:url>/cooperation/save.action</tui:url>','${ns}_info');</tui:button>
		<tui:button type="abort">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>
	
</s:push>