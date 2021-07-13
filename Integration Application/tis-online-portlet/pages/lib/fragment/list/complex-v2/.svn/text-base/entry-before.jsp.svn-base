			<tdl:var-set name="id"><s:property value="id"/></tdl:var-set>
			<tdl:var-set name="modified"><s:property value="modified"/></tdl:var-set>
			<tdl:var-set name="deleted"><s:property value="deleted"/></tdl:var-set>
			<s:if test="deleted == 1">
				<script>
					document.getElementById("<tdl:var name="ns"/>_<tdl:var name="ajaxId"/>_info_delete").style.display="inline";
				</script>
			</s:if>
			<c:if test="${topdev_ul_layout != 1}">
			<tr>
				<c:if test="${mode!=2}">
					<td class="topdev_iconbar"><nobr>
						<s:if test="mode == 1">
							<s:if test="deleted == 1">
								<tv2:js type="listModified">true</tv2:js>
								<tv2:icon type="undo"><tv2:url>${actionURL}_undo.action</tv2:url>&id=<s:property value="id"/></tv2:icon>
							</s:if>
							<s:else>
								<s:if test="modified == 1">
									<tv2:js type="listModified">true</tv2:js>
									<s:if test="kz_edit==1">
										<tv2:icon type="edit"><tv2:url>${actionURL}_edit.action</tv2:url>&id=<s:property value="id"/></tv2:icon>
										<tv2:icon type="undo"><tv2:url>${actionURL}_undo.action</tv2:url>&id=<s:property value="id"/></tv2:icon>
									</s:if>
								</s:if>
								<s:else>
									<s:if test="kz_edit==1">
										<tv2:icon type="edit"><tv2:url>${actionURL}_edit.action</tv2:url>&id=<s:property value="id"/></tv2:icon>
									</s:if>
									<s:if test="kz_delete==1">
										<c:if test="${requestParadigm!='true'}">
											<tv2:icon type="delete" js="true">
												TopdevUtil.objs['<tdl:var name="ns"/>'].portletModified = true;
												TopdevUtil.calcSaveButton('<tdl:var name="ns"/>');
												TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tv2:url>${actionURL}_delete.action</tv2:url>&id=<s:property value="id"/>');
											</tv2:icon>
										</c:if>
										<c:if test="${requestParadigm=='true'}">
											<tv2:icon type="delete" js="true">
												TopdevUtil.tsp_dialog_request = function() { var url = '<tv2:url>${actionURL}_delete.action</tv2:url>&id=<s:property value="id"/>&ajaxId=${ajaxId}'; TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url); };
												TopdevUtil.showRequestDialog('${ns}');
											</tv2:icon>
										</c:if>
									</s:if>
								</s:else>
							</s:else>
						</s:if></nobr>
					</td>
				</c:if>	
			</c:if>
			<c:if test="${topdev_ul_layout == 1}">
				<li> 
			</c:if>