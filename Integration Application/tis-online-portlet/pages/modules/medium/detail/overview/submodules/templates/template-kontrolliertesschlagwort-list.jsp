<%@ include file="/pages/lib/init/init.jsp" %>
<%@ include file="../../init_ns.jsp" %>
<c:set var="ajaxId"><s:property value="ajaxId"/></c:set>
<c:set var="sublistName"><s:property value="sublistName"/></c:set>
<div id="${ajaxId}_select_box_content">
	<div style="height:450px; overflow:scroll;">
		<s:iterator value="results"><a href="javascript:;" onclick="kontrolliertesschlagwort_liste_tf7('<s:property value="code"/>', this)"><s:property value="decode"/></a><br/></s:iterator>
	</div>
	<script>

	</script>
</div>
<script>
	document.getElementById('${ajaxId}_select_box').innerHTML = document.getElementById('${ajaxId}_select_box_content').innerHTML;
</script>