<%@ include file="/pages/lib/init/init.jsp" %>
<%@ include file="init_ns.jsp" %>
<c:set var="ajaxId"><s:property value="ajaxId"/></c:set>
<c:set var="sublistName"><s:property value="sublistName"/></c:set>
<div id="${ajaxId}_select_box_content">
	<div style="height:450px; overflow:scroll;">
		<ul>
			<s:iterator value="results">
				<a href="javascript:;" onclick="popupSelect(this, '${ajaxId}', '<s:property value="decode"/>')">
					<li><s:property value="decode"/></li>
				</a>
			</s:iterator>
		</ul>
	</div>
	<script>

	</script>
</div>
<script>
	document.getElementById('${ajaxId}').innerHTML = document.getElementById('${ajaxId}_select_box_content').innerHTML;
</script>