			<c:set var="deleted"><s:if test="deleted">1</s:if><s:else>0</s:else></c:set>
			<c:set var="inserted"><s:property value="id_entity==0"/></c:set>

			<tdl:var-set name="index"><s:property value="#s1.index+1" /></tdl:var-set>
			<tdl:var-set name="id"><s:property value="id"/></tdl:var-set>
			<tdl:var-set name="modified"><s:property value="modified"/></tdl:var-set>
			<tdl:var-set name="deleted"><s:property value="deleted"/></tdl:var-set>
				<td class="topdev_cursorbar">
				</td>
				<td class="topdev_iconbar">
					<s:if test="kz_delete==1">
						<tv2:icon type="delete" js="true" visible="${deleted!=1}">TopdevUtil.deleteEntry('${ajaxId}','${sublistName}','<s:property value="kz_edit"/>','${ns}'); return false;</tv2:icon>
					</s:if>
					<span style="display:${deleted!=1?'none':'inline'}" name="undo" align="center"><tv2:icon type="undo" js="true">TopdevUtil.undoEntry('${ajaxId}','${sublistName}','<s:property value="kz_edit"/>'); return false;</tv2:icon></span>
				</td>
				<td>
					<input type="hidden" name="${sublistName}_id" value="<s:property value="id"/>"/>
					<input type="hidden" name="${sublistName}_id_entity" value="<s:property value="id_entity"/>"/>
					<input type="hidden" name="${sublistName}_KZ_IS_DELETED" value="<s:if test="deleted">1</s:if><s:else>0</s:else>"/>
					<input type="hidden" name="${sublistName}_KZ_IS_MODIFIED" value="<s:if test="modified">1</s:if><s:else>0</s:else>"/>
					<input type="hidden" name="${sublistName}_user" value="<s:property value="user"/>"/>
					<input type="hidden" name="${sublistName}_orgUser" value="<s:property value="orgUser"/>"/>
					<input type="hidden" name="${sublistName}_xpts" value="<s:property value="xpts"/>"/>
				