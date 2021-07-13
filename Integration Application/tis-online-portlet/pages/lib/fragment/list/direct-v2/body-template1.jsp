<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this">
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="bezeichnung"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="bezeichnung"/></tdl:var-set>
					<tdl:var-set name="t_style"><s:if test="kz_edit == 0">display:none</s:if></tdl:var-set>
					<tv2:dropedit name="${sublistName}_bezeichnung" value="${content}">
						<tv2:dropdown
							notd="true"
							onchange="TopdevUtil.updateEntryValue('${ajaxId}', '${sublistName}', '${sublistName}_bezeichnung', this.options[this.selectedIndex].text); TopdevUtil.ogCheck(this, '${ns}', '${ajaxId}', true)"
							name="bezeichnung_code"
							labelname="bezeichnung_decode"
							parameter="TBSH=${tbsh}"
							preload="${tbsh}"
							content="${content}"
							value="${value}"
							style="${t_style}"
							nullable="true"
							compareWithRow="DECODE"
							/>
					</tv2:dropedit>
					<div name="${sublistName}_bezeichnung_readonly" style="<s:if test="kz_edit == 1">visibility:hidden</s:if>">
						<s:property value="bezeichnung"/>
					</div>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tdl:var-set name="content"></tdl:var-set>
			<tdl:var-set name="value"></tdl:var-set>
			<td style="border-right-color: #FFFFFF">
				<tv2:dropedit name="${sublistName}_bezeichnung" value="">
					<tv2:dropdown
						onchange="TopdevUtil.updateEntryValue('${ajaxId}', '${sublistName}', '${sublistName}_bezeichnung', this.options[this.selectedIndex].text); TopdevUtil.ogCheck(this, '${ns}', '${ajaxId}', true)"
						name="bezeichnung_code"
						labelname="bezeichnung_decode"
						parameter="TBSH=${tbsh}"
						preload="${tbsh}"
						content="${content}"
						value="${value}"
						notd="true"
						nullable="true"/>
				</tv2:dropedit>
			</td>
		</tr>
	</table>
	</div>
</s:push>