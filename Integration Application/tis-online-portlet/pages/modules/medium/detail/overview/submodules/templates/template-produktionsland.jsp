<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<c:set var="inserted"><s:property value="id_entity==0"/></c:set>
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this" <c:if test="${inserted}">class="topdev_row_inserted"</c:if>>
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="decode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="code"/></tdl:var-set>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="decode"/></span>
					</div>
					<tv2:dropdown
						notd="true"
						serviceName="com.topdev.service.mediumproland.Client"
						name="${sublistName}_code"
						sublistName="${sublistName}"
						labelname="${sublistName}_decode"
						content="${content}"
						value="${value}"
						style="display:${deleted!=1?'inline;height:20px;':'none'}"/>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tdl:var-set name="content"></tdl:var-set>
			<tdl:var-set name="value"></tdl:var-set>
				<tv2:dropdown
					serviceName="com.topdev.service.mediumproland.Client"
					style="height:20px"
					name="${sublistName}_code"
					labelname="${sublistName}_decode"
					content="${content}"
					value="${value}"/>
		</tr>
	</table>
	</div>
</s:push>