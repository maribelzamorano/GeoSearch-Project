<s:push value="${sublistName}">
	<div id="${ajaxId}_${sublistName}_div">
		<%@ include file="/pages/lib/fragment/list/direct-v2/body-init.jsp" %>
		<s:iterator value="entryList" status="s1">
			<c:set var="inserted"><s:property value="id_entity==0"/></c:set>
			<tr id="${ajaxId}_${sublistName}_tr<s:property value="#s1.index+1" />" onmouseover="currentTr=this" <c:if test="${inserted}">class="topdev_row_inserted"</c:if>>
				<%@ include file="/pages/lib/fragment/list/direct-v2/body-before.jsp" %>
					<tdl:var-set name="content"><s:property value="signaturartDecode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="signaturartCode"/></tdl:var-set>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="signaturartDecode"/></span>
					</div>
					<tv2:dropdown
						notd="true"
						serviceName="com.topdev.service.mediumsignaturart.Client"
						name="${sublistName}_signaturartCode"
						sublistName="${sublistName}"
						labelname="${sublistName}_signaturartDecode"
						content="${content}"
						value="${value}"
						style="display:${deleted!=1?'inline;height:20px;':'none'}"/>
				</td>
				<td>
					<tdl:var-set name="content"><s:property value="medienartDecode"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="medienartCode"/></tdl:var-set>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="medienartDecode"/></span>
					</div>
					<tv2:dropdown
						notd="true"
						serviceName="com.topdev.service.mediumart.Client"
						name="${sublistName}_medienartCode"
						sublistName="${sublistName}"
						labelname="${sublistName}_medienartDecode"
						content="${content}"
						value="${value}"
						style="display:${deleted!=1?'inline;height:20px;':'none'}"/>
				</td>
				<td>
					<div class="listrow_deleted_div" style="display:${deleted!=1?'none':'inline'}">
						<span><s:property value="laufendeNummer"/></span>
					</div>
					<tv2:textfield
						name="${sublistName}_laufendeNummer"
						sublistName="${sublistName}"
						maxlength="5"
						notd="true"
						visible="${deleted!=1}"><s:property value="laufendeNummer"/></tv2:textfield>
				</td>
			</tr>
		</s:iterator>
		<tr id="${ajaxId}_${sublistName}_tr0" style="display:none">
			<%@ include file="/pages/lib/fragment/list/direct-v2/prepare-new.jsp" %>
			<tdl:var-set name="content"></tdl:var-set>
			<tdl:var-set name="value"></tdl:var-set>
				<tv2:dropdown
					serviceName="com.topdev.service.mediumsignaturart.Client"
					style="height:20px"
					name="${sublistName}_signaturartCode"
					labelname="${sublistName}_signaturartDecode"
					content="${content}"
					value="${value}"/>
				<tv2:dropdown
					serviceName="com.topdev.service.mediumart.Client"
					style="height:20px"
					name="${sublistName}_medienartCode"
					labelname="${sublistName}_medienartDecode"
					content="${content}"
					value="${value}"/>
				<tv2:textfield name="${sublistName}_laufendeNummer" maxlength="5"></tv2:textfield>
		</tr>
	</table>
	</div>
</s:push>