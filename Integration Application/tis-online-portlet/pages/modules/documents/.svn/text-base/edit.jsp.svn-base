<%@ include file="init.jsp" %>
<div id="tsp_portlet_div_main_${ns}">
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>

<tdl:var-set name="portletBackUrl">documents?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">
	<form action="<tui:url action="true">detail_save</tui:url>" method="post"></form>

	<tui:tabBox tabCount="2" activeTabId="1" name="tabbox1">		
		<tui:tab id="1" active="true">
			<s:action name="document-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="2">
			<s:action name="link-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>

	<tui:buttonbar>
		<tui:button type="back">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>
	
</s:push>
</div>