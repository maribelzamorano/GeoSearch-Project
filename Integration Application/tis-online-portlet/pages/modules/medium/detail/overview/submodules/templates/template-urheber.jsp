<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<c:set var="inserted"><s:property value="id_entity==0"/></c:set>
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this" <c:if test="${inserted}">class="topdev_row_inserted"</c:if>>
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="urheberFunktionDecode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="urheberFunktionCode"/></tdl:var-set>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="urheberFunktionDecode"/></span>
					</div>
					<tv2:dropdown
						notd="true"
						serviceName="com.topdev.service.mediumurheberfunktion.Client"
						name="${sublistName}_urheberFunktionCode"
						sublistName="${sublistName}"
						labelname="${sublistName}_urheberFunktionDecode"
						content="${content}"
						value="${value}"
						style="display:${deleted!=1?'inline;height:20px;':'none'}"/>
				</td>
				<td>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="bezeichnung"/></span>
					</div>
					<tv2:textfield
						notd="true"
						name="${sublistName}_bezeichnung"
						sublistName="${sublistName}"
						maxlength="255"
						visible="${deleted!=1}"><s:property value="bezeichnung"/></tv2:textfield>
				</td>
				<td>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="urheberFunktionZusatz"/></span>
					</div>
					<tv2:textfield
						name="${sublistName}_urheberFunktionZusatz"
						sublistName="${sublistName}"
						notd="true"
						maxlength="50"
						visible="${deleted!=1}"><s:property value="urheberFunktionZusatz"/></tv2:textfield>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tv2:dropdown
				serviceName="com.topdev.service.mediumurheberfunktion.Client"
				style="height:20px"
				name="${sublistName}_urheberFunktionCode"
				labelname="${sublistName}_urheberFunktionDecode"
				content=""
				value=""/>
			<tv2:textfield name="${sublistName}_bezeichnung" maxlength="255"></tv2:textfield>
			<tv2:textfield name="${sublistName}_urheberFunktionZusatz" maxlength="50"></tv2:textfield>
		</tr>
	</table>
	</div>
</s:push>