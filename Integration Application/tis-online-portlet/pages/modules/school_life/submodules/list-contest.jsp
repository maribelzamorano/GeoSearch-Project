<%@ include file="init.jsp" %>
<tdl:var-set name="requestParadigm">true</tdl:var-set>
<tdl:var-set name="actionURL">/school_life/contest-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>

<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>
	<s:iterator value="${listEntryObject}" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>

<%--______________________________________________________________________________________--%>
<c:if test="${mode!=2}">
	<td width="100%">
	<table width="100%" cellpadding="0" cellspacing="0">						
		<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
			<td colspan="2" class="first">
				<s:if test="deleted == 1"><strike></s:if>
					<s:property value="wett_bezeichnung"/>
				<s:if test="deleted == 1"></strike></s:if>
			</td>							
		</tr>
	</table>
	</td>
</c:if>
<c:if test="${mode==2}">
	<s:property value="wett_bezeichnung"/>
</c:if>
<%--______________________________________________________________________________________--%>		
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>

