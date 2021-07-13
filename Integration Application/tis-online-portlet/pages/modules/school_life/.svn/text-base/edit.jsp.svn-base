<%@ include file="init.jsp" %>
<div id="tsp_portlet_div_main_${ns}">
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>

<tdl:var-set name="portletBackUrl">school_life?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>

<s:push value="mainObject">
	<%--<form action="<s:url action="detail_save"/>" id="${ns}_main_form" method="post"></form> --%>
	
	<tui:tabBox tabCount="4" activeTabId="1" name="tabbox1">
		<tui:tab id="1" active="true">
			<s:action name="offer-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="2">
			<s:action name="project-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="3">
			<s:action name="tradition-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
		<tui:tab id="4">
			<s:action name="contest-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>	

	<tui:buttonbar scope="none">
 <%-- 	<tui:button type="save">AjaxUtil.update('<s:url value="/school_life/save.action"/>','${ns}_info');</tui:button>--%>
		<tui:button type="back">location.href='${portletBackUrl}';</tui:button>
	</tui:buttonbar>
<%-- </form>--%>
</s:push>
