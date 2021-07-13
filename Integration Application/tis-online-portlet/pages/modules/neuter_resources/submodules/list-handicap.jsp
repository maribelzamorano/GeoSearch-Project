<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/neuter_resources/handicap-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>
<s:iterator value="${listEntryObject}" status="rowstatus">
	<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td <s:if test="mode!=2"><s:if test="#rowstatus.odd == true">class="col_odd"</s:if><s:else>class="col_no_odd"</s:else></s:if>  valign="middle" class="handicap" style=" padding:2px; padding-right:5px;">
			<nobr><img src="<s:url value="/images/ci/list/handicap_"/><s:property value="auar_code"/>.gif" align="middle"/>
		
				<s:if test="mode==2">
					<s:property value="auar_decode"/>
				</s:if>
				<s:else>
					<s:if test="deleted == 1"><strike><s:property value="auar_decode"/></strike></s:if>
					<s:else><s:property value="auar_decode"/></s:else>
				</s:else>
			</nobr>
		</td>
		
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
			</tr>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>