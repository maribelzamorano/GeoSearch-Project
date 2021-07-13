<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<tdl:var-set name="portletBackUrl"><s:property value="friendlyUrlPrefix"/>/schools/overview?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">
	<form action="<tui:url action="true">detail_save</tui:url>" id="${ns}_main_form" method="post"></form>
	
	<tui:tabBox tabCount="4" activeTabId="1" name="tabbox1">
		<tui:tab id="1" active="true">
			<s:action name="intention-list_edit_filter" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
				<s:param name="filter">VORH</s:param>
			</s:action>
		</tui:tab>
		<tui:tab id="2">
			<s:action name="intention-list_edit_filter" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
				<s:param name="filter">VERS</s:param>
			</s:action>
		</tui:tab>
		<tui:tab id="3">
			<s:action name="intention-list_edit_filter" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
				<s:param name="filter">PROJ</s:param>
			</s:action>
		</tui:tab>
		<tui:tab id="4">
			<s:action name="foreignlanguage-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>	

	<tui:buttonbar>
	 	<tui:button type="save">AjaxUtil.update('<tui:url>/school_intention/save.action</tui:url>','${ns}_info');</tui:button>
		<tui:button type="abort">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>
</form>
</s:push>