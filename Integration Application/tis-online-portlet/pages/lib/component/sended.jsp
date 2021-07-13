<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
if(request.getAttribute("ns")==null) request.setAttribute("ns","defaultNamespace");
%>
<tui:errors/>
<s:if test="rtErrors.size<1">
	<ul>
		<li>
			<font color="green">
				Die Nachricht wurde erfolgreich abgeschickt.<br/>
			</font>
		</li>
	</ul>
</font>
</s:if>