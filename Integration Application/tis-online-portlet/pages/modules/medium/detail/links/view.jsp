<%@ include file="init.jsp" %>
<c:set var="text"><s:property value="linktext"/></c:set>
<c:set var="links"><tv2:parser textparsing="0">${text}</tv2:parser></c:set>

<s:if test="${empty text} || ${empty links}">
	<tv2:msg key="global.label-keine_daten"/>
</s:if>
<s:else>
${links}
</s:else>
