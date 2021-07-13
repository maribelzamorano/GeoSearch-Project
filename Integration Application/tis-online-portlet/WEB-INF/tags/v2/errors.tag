<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>

<s:if test="${mainObject != null}">
	<c:if test="${not empty mainObject.errors and empty errors_tag_already_shown}">
	<% request.setAttribute("errors_tag_already_shown","true"); %>
		<ul>
		<font color="black">
			<b>Bei der Verarbeitung der Daten wurden folgende Probleme erkannt:</b>
		</font>
	
		<c:set var="i" value="1"/>
		<c:forEach items="${mainObject.errors}" var="myErrors">
			<li>
				<font color="red">
					<c:if test="${myErrors.key!='DATASERVICE'}">
						<sup>F<c:out value="${i}"/></sup>
					</c:if>
					${myErrors.value}
				</font>
			</li>
			<c:set var="i" value="${i+1}"/>
		</c:forEach>
		</ul>
	</c:if>
</s:if>

<%
try
{
	if(bas.getErrors()!=null && bas.getErrors().size()>0)
	{
		%>
		<ul>
			<s:iterator value="errors">
				<li>
					<font color="red">
						<s:property/>
					</font>
				</li>
			</s:iterator>
		</ul>
		<%
	}
} catch (Exception ex)
{
	
}
%>