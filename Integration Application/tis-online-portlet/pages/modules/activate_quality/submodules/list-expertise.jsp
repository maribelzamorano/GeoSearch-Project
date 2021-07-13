<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/activate_quality/expertise-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>

	<s:iterator value="${listEntryObject}" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
					<td class="normal" >
						<s:if test="deleted == 1"><strike></s:if>
							<s:property value="beschreibung"/> 
						<s:if test="deleted == 1"></strike></s:if>
					</td>
				</tr>			
			</table>
		</td>
		<s:if test="mode==1">
		<td>
			<table width="100%" cellpadding="0" cellspacing="0">
				<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
				
					<td class="normal" >
						<s:if test="deleted == 1"><strike></s:if>
							<s:property value="sortierung"/> 
						<s:if test="deleted == 1"></strike></s:if>
					</td>
				
				</tr>
			</table>
		</td>
		</s:if>
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
		
	</s:iterator>
		<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
					<td colspan="4" class="normal foot">
							<tui:msg key="fussnote_expertise" type="label"/>	
					</td>
				</tr>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>
