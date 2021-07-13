<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this">
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="decode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="code"/></tdl:var-set>
					<tdl:var-set name="t_style"><s:if test="kz_edit == 0">display:none</s:if></tdl:var-set>
					<tv2:dropdown
						notd="true"
						name="${sublistName}_code"
						labelname="${sublistName}_decode"
						parameter="TBSH=${tbsh}"
						preload="${tbsh}"
						content="${content}"
						value="${value}"
						style="${t_style}"/>
					<div name="${sublistName}_readonly_div" <s:if test="kz_edit == 1">style="display:none"</s:if>>
						<span><s:property value="decode"/></span>
					</div>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tdl:var-set name="content"></tdl:var-set>
			<tdl:var-set name="value"></tdl:var-set>
				<tv2:dropdown
					name="${sublistName}_code"
					labelname="${sublistName}_decode"
					parameter="TBSH=${tbsh}"
					preload="${tbsh}"
					content="${content}"
					value="${value}"/>
		</tr>
	</table>
	</div>
</s:push>