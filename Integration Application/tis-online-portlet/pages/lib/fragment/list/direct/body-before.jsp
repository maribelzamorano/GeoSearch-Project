			<tdl:var-set name="index"><s:property value="#s1.index+1" /></tdl:var-set>
			<tdl:var-set name="id"><s:property value="id"/></tdl:var-set>
			<tdl:var-set name="modified"><s:property value="modified"/></tdl:var-set>
			<tdl:var-set name="deleted"><s:property value="deleted"/></tdl:var-set>
				<td class="topdev_cursorbar">
				</td>
				<td class="topdev_iconbar">
					<s:if test="kz_delete==1">
						<tui:icon type="delete" js="true">TopdevUtil.deleteEntry('${ajaxId}','${sublistName}','<s:property value="kz_edit"/>','${ns}'); return false;</tui:icon>
					</s:if>
					<span style="display:none" name="undo" align="center"><tui:icon type="undo" js="true">TopdevUtil.undoEntry('${ajaxId}','${sublistName}','<s:property value="kz_edit"/>'); return false;</tui:icon></span>
				</td>
				<td>
					<input type="hidden" name="${sublistName}_id" value="<s:property value="id"/>"/>
					<input type="hidden" name="${sublistName}_id_entity" value="<s:property value="id_entity"/>"/>
					<input type="hidden" name="${sublistName}_KZ_IS_DELETED" value="0"/>
					<input type="hidden" name="${sublistName}_KZ_IS_MODIFIED" value="0"/>
					<input type="hidden" name="${sublistName}_user" value="<s:property value="user"/>"/>
					<input type="hidden" name="${sublistName}_xpts" value="<s:property value="xpts"/>"/>
				