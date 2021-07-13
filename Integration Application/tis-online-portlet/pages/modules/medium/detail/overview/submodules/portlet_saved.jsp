<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/init/init.jsp" %>
<s:if test="tspi==0">
	<tdl:var-set name="portletBackUrl">detail?tspi=<s:property value="id"/></tdl:var-set>
</s:if>
<s:else>
	<tdl:var-set name="portletBackUrl">detail?tspi=<s:property value="tspi"/></tdl:var-set>
</s:else>

<script> var backUrl = "${portletBackUrl}"; </script>

<font color="green">Die Daten wurden erfolgreich gespeichert</font>
<script>
	location.href='${portletBackUrl}';
</script>

