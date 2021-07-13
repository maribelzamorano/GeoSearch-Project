<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<c:set var="inserted"><s:property value="id_entity==0"/></c:set>
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this" <c:if test="${inserted}">class="topdev_row_inserted"</c:if>>
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="beschreibung"/></span>
					</div>
					<tv2:textfield
						name="${sublistName}_beschreibung"
						sublistName="${sublistName}"
						notd="true"
						maxlength="255"
						visible="${deleted!=1}"><s:property value="beschreibung"/></tv2:textfield>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tv2:textfield name="${sublistName}_beschreibung" maxlength="255"></tv2:textfield>
		</tr>
	</table>
	</div>
</s:push>