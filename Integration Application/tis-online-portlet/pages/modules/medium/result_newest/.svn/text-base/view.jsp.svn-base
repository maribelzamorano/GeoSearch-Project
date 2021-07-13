<%@ include file="/pages/lib/init/init.jsp" %>
<%@ include file="init_ns.jsp" %>
<script>
function ${ns}_changeSearchPage(page)
{
	var url="${pageContext.request.contextPath}/medium_result_newest/detail.action"
		+"?tspi=<s:property value="tspi"/>"
		+"&tspm=<s:property value="tspm"/>"
		+"&vsid=<s:property value="vsid"/>"
		+"&mode=<s:property value="mode"/>"
		+"&page="+page;
	TopdevUtil.updateDiv("topdev_${ns}_portlet", url);
}
</script>
<div id="topdev_${ns}_portlet">
	<s:action name="detail" executeResult="true">
		<s:param name="tspi" value="tspi"/>
		<s:param name="tspm" value="tspm"/>
		<s:param name="vsid" value="vsid"/>
		<s:param name="mode" value="mode"/>
	</s:action>
</div>