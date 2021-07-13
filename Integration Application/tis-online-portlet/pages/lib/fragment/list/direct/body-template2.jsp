<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this">
				<%@ include file="/pages/lib/fragment/list/direct/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="dokumentart_decode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="dokumentart_code"/></tdl:var-set>
					<tdl:var-set name="t_style"><s:if test="kz_edit == 0">display:none</s:if></tdl:var-set>
					<div name="${sublistName}_readonly_div" <s:if test="kz_edit == 1">style="display:none"</s:if>>
						<span>
							<tdl:var-set name="downloadURL">/download/virtual/<s:property value="bezeichnung"/></tdl:var-set>
							<a target="_blank" href="<tui:url>${downloadURL}</tui:url>&ANLA_ID=<s:property value="id_entity"/>">
								<s:property value="bezeichnung"/>
							</a>
						</span>
					</div>
					<input
						type="file"
						name="${sublistName}_datei"
						value="<s:property value="bezeichnung"/>"
						<s:if test="kz_edit == 0">style="display:none"</s:if>/>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct/prepare-new.jsp" %>
			<tdl:var-set name="content"><s:property value="dokumentart_decode"/></tdl:var-set>
			<tdl:var-set name="value"><s:property value="dokumentart_code"/></tdl:var-set>
			<td>
				<input type="file" name="${sublistName}_datei" value=""/>
			</td>
		</tr>
	</table>
	</div>
</s:push>