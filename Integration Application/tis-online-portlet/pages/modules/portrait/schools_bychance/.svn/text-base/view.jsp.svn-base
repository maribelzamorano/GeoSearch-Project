<%@ include file="init.jsp" %>

<%@page import="com.topdev.tsp.action.modules.portrait.schools_bychance.RandomSchoolAction"%>
<script>
function ${ns}_reload_preview()
{
	TopdevUtil.updateDiv("${ns}_div","/tis-online-portlet/${ns}/school-preview.action?1=1");
}
window.setInterval("${ns}_reload_preview()",<%= RandomSchoolAction.refreshDelay %>*1000)
</script>
<div class="topdev_portlet" id="${ns}_div">
	<s:action name="school-preview" executeResult="true"/>
</div>
