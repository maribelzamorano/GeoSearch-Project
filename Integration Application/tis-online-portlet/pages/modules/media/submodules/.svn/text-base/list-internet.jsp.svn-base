<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/media/internet-detail</tdl:var-set>
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
						<nobr><s:if test="deleted == 1"><strike></s:if>
							 <s:property value="anzahl"/>&nbsp;x&nbsp;&nbsp;<b><s:property value="anschlussart"/> </b>
						<s:if test="deleted == 1"></strike></s:if></nobr>
					</td>
				</tr>
			</table>
		</td>
		
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
			</tr>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>