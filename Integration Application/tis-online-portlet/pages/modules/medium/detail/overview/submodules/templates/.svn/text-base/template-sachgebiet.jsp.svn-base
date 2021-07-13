<s:push value="${sublistName}">
	<input type="hidden" id="${ajaxId}_${sublistName}_select_box_loaded" value="0"/>
	<div id="${ajaxId}_${sublistName}_select_box" style="display:none"><%@ include file="/pages/lib/fragment/dialog/loading.jsp" %></div>
	
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
					<tv2:textfield
						readonly="true"
						notd="true"
						name="${sublistName}_decode"
						sublistName="${sublistName}"
						visible="${deleted!=1}">${content}</tv2:textfield>
				</td>
				<td width="20px">
					<input type="hidden" name="${sublistName}_code" value="${value}" />
					<a href="javascript:;" onclick="selectEntrySachgebiete('${ajaxId}','${sublistName}','${ns}'); return false;">
						<img style="top:18px" src="/tis-online-portlet/images/design/dropdown.gif" border="0"/>
					</a>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tdl:var-set name="content"></tdl:var-set>
			<tdl:var-set name="value"></tdl:var-set>
			<td>
				<tv2:textfield
					readonly="true"
					notd="true"
					name="${sublistName}_decode">${content}</tv2:textfield>
			</td>
			<td width="20px">
				<input type="hidden" name="${sublistName}_code" value="${value}" />
				<a href="javascript:;" onclick="selectEntrySachgebiete('${ajaxId}','${sublistName}','${ns}'); return false;">
					<img style="top:18px" src="/tis-online-portlet/images/design/dropdown.gif" border="0"/>
				</a>
			</td>

				<%-- 
					<tv2:dropdown
						serviceName="com.topdev.service.mediumkonschlagwort.Client"
						name="${sublistName}_code"
						labelname="${sublistName}_decode"
						content="${content}"
						value="${value}"/>
				--%>
		</tr>
	</table>
	</div>
</s:push>