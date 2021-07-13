<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/neuter_resources/cabinet-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>
<s:iterator value="${listEntryObject}" status="rowstatus">

	<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
	
		<td>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
					<td class="first" >
						<s:if test="deleted == 1"><strike></s:if>
							<b><s:property value="nutzungsprofil"/> </b>( <s:property value="anzahl"/> )
						<s:if test="deleted == 1"></strike></s:if>
					</td>
				</tr>
			</table>
		</td>
		
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
			</tr>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>