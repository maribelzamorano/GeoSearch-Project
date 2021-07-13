<%@ include file="init.jsp" %>
<div id="tsp_portlet_div_main_${ns}">
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<tdl:var-set name="portletBackUrl"><s:property value="friendlyUrlPrefix"/>/schools/school_evolution?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">
	
	<tui:tabBox tabCount="3" activeTabId="1" name="tabbox1">
		<tui:tab id="1" active="true">
			<s:action name="intention-detail_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="2">
			<s:action name="emphasis-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>	
		<tui:tab id="3">
			<s:action name="instrument-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>	
	</tui:tabBox>	

	<tui:buttonbar scope="none">
		<tui:button type="back">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>
</s:push>
</div>