<%@ include file="init.jsp" %>

<c:set var="furl">${LIFERAY_SHARED_friendlyURL}</c:set>
<c:set var="tbshCode">
	<c:choose>
		<c:when test="${furl eq '/web/guest/home'}">GEBI</c:when>
		<c:when test="${furl eq '/web/guest/schools/overview'}">GEBI</c:when>
		<c:when test="${furl eq '/web/guest/media/mediacenter/overview'}">GEBI</c:when>
		<c:when test="${furl eq '/web/guest/schools/personal_resources'}">AB01</c:when>
		<c:when test="${furl eq '/web/guest/schools/neuter_resources'}">AB02</c:when>
		<c:when test="${furl eq '/web/guest/schools/school_evolution'}">AB03</c:when>
		<c:when test="${furl eq '/web/guest/schools/contributer'}">AB04</c:when>
		<c:when test="${furl eq '/web/guest/schools/school_life'}">AB05</c:when>
		<c:when test="${furl eq '/web/guest/schools/learner_structure'}">AB06</c:when>
		<c:when test="${furl eq '/web/guest/schools/cooperation'}">AB07</c:when>
		<c:when test="${furl eq '/web/guest/schools/documents'}">AB08</c:when>
		<c:otherwise>NONE</c:otherwise>
	</c:choose>
</c:set>

<script>
function ${ns}_reload_preview()
{
	TopdevUtil.updateDiv("${ns}_div","/tis-online-portlet/${ns}/ajax-view.action?tbshCode=${tbshCode}&tspi=<s:property value="tspi"/>");
}
window.setInterval("${ns}_reload_preview()",20000)
</script>
<div class="topdev_portlet" id="${ns}_div">
	<s:action name="ajax-view" executeResult="true">
		<s:param name="tbshCode">${tbshCode}</s:param>
	</s:action>
</div>
