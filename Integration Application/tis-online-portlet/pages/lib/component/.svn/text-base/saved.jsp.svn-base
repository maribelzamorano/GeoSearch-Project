<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
if(request.getAttribute("ns")==null) request.setAttribute("ns","defaultNamespace");
%>
<tui:errors/>
<s:if test="rtErrors.size<1">
	<ul>
		<li>
			<font color="green">
				Die Daten wurden erfolgreich gespeichert.<br/>
				<%-- <a href="javascript:location.replace(backUrl)"/>
					Zur&uuml;ck zur Ansicht
				</a>--%>
				<script>
					<c:choose>
						<c:when test="${param['apply'] eq 'true'}">
							location.replace(location.href.replace(/#top/g, ""));
						</c:when>
						<c:otherwise>
							location.replace(backUrl)
						</c:otherwise>
					</c:choose>
				</script>
			</font>
		</li>
	</ul>
</font>
</s:if>