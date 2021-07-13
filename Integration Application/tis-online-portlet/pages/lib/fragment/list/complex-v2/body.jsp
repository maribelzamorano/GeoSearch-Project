<% if(request.getAttribute("listObject")==null) request.setAttribute("listObject","complexList"); %>
<tdl:var-set name="mode"><s:property value="mode"/></tdl:var-set>
<div
	id="<tdl:var name="ns"/>_<tdl:var name="ajaxId"/>_info_delete"
	style="display:none">
		<i>Die gestrichenen Eintr&auml;ge werden durch [Speichern] aus dem Datenbestand gel&ouml;scht</i>
</div>
<tv2:js type="hideButtons">false</tv2:js>
<tv2:js type="listModified">false</tv2:js>
<tdl:var-set name="listEntryObject"><s:if test="complexEntryList == null">${listObject}.entryList</s:if><s:else>complexEntryList</s:else></tdl:var-set>

<s:push value="${listObject}">
	<table width="100%" class="topdev_hitlist" cellpadding="0" cellspacing="1">
		<colgroup>
			<c:if test="${mode!=2}">
				<col class="topdev_iconbar">
			</c:if>
			<col>
		</colgroup>
		<tr>
			<c:if test="${mode!=2}">
				<th class="topdev_iconbar">
					<s:if test="kz_insert==1">
						<tv2:icon type="new" js="true">goToTab('<s:property value="currentTab"/>', 'insert');</tv2:icon>
					</s:if>
				</th>
			</c:if>
			
			<s:iterator value="headingList" status="rowstatus">
				<th align="left">
					<tv2:msg>heading-<s:property value="value"/></tv2:msg>
				</th>
			</s:iterator>
		</tr>
</s:push>

		<s:iterator value="${listEntryObject}" status="rowstatus">
			<tdl:var-set name="id"><s:property value="id"/></tdl:var-set>
			<tdl:var-set name="modified"><s:property value="modified"/></tdl:var-set>
			<tdl:var-set name="deleted"><s:property value="deleted"/></tdl:var-set>
			<s:if test="deleted == 1">
				<script>
					document.getElementById("<tdl:var name="ns"/>_<tdl:var name="ajaxId"/>_info_delete").style.display="inline";
				</script>
			</s:if>
			<s:if test="#rowstatus.odd == true">
				<tr class="row_odd">
			</s:if>
			<s:else>
				<tr>
			</s:else>

				<c:if test="${mode==1}">
					<td class="topdev_iconbar"><nobr>
						<s:if test="kz_download == 1"><tv2:icon js="true" type="download">window.open('<tv2:url>/ajax/download.action</tv2:url>&ANLA_ID=<s:property value="id_entity"/>')</tv2:icon></s:if>
						<c:if test="${mode==1}">
							<s:if test="deleted == 1">
								<tv2:js type="listModified">true</tv2:js>
								<tv2:icon type="undo" js="true">goToTab('<s:property value="currentTab"/>', 'undo', '<s:property value="id"/>');</tv2:icon>
							</s:if>
							<s:else>
								<s:if test="modified == 1">
									<s:if test="kz_edit==1">
										<tv2:js type="listModified">true</tv2:js>
										<tv2:icon type="edit" js="true">goToTab('<s:property value="currentTab"/>', 'edit', '<s:property value="id"/>');</tv2:icon>
										<tv2:icon type="undo" js="true">goToTab('<s:property value="currentTab"/>', 'undo', '<s:property value="id"/>');</tv2:icon>
									</s:if>
								</s:if>
								<s:else>
									<s:if test="kz_edit==1">
										<tv2:icon type="edit" js="true">goToTab('<s:property value="currentTab"/>', 'edit', '<s:property value="id"/>');</tv2:icon>
									</s:if>
									<s:if test="kz_delete==1">
										<c:if test="${requestParadigm!='true'}">
											<tv2:icon type="delete" js="true">
												TopdevUtil.objs['<tdl:var name="ns"/>'].portletModified = true;
												TopdevUtil.calcSaveButton('<tdl:var name="ns"/>');
												TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tv2:url>${actionURL}_delete.action</tv2:url>&filter=<s:property value="filter"/>&id=<s:property value="id"/>');
											
											</tv2:icon>
										</c:if>
										<c:if test="${requestParadigm=='true'}">
											<tv2:icon type="delete" js="true">
												TopdevUtil.showRequestDialog('${ns}');
												TopdevUtil.tsp_dialog_request = function() { goToTab('<s:property value="currentTab"/>', 'delete', '<s:property value="id"/>'); };
												
											</tv2:icon>
										</c:if>
									</s:if>
								</s:else>
							</s:else>
						</c:if>
						</nobr>
					</td>
				</c:if>
				<c:if test="${mode!=1}">
				</c:if>
				<s:iterator value="entries" status="colstatus">
					<s:if test="type == 'checkbox'">
						<tv2:checkbox name="serienbrief" useMode="2"><s:property value="decode"/></tv2:checkbox>
					</s:if>
					<s:elseif test="type == 'link'">
						<td>
							<s:if test="deleted == 1"><strike><s:property value="decode"/></strike></s:if>
							<s:else><a href="#" onclick="<s:property value="code"/>"><s:property value="decode"/></a></s:else>
						</td>
					</s:elseif>
					<s:elseif test="type == 'anla'">
						<td>
							<s:if test="deleted == 1"><strike><s:property value="decode"/></strike></s:if>
							<s:else><a target="_blank" href="/tis-online-portlet/download/virtual/<s:property value="name"/>?ANLA_ID=<s:property value="code"/>"><s:property value="decode"/></a></s:else>
						</td>
					</s:elseif>
					<s:elseif test="type == 'encryptedTextfield'">
						<td class="topdev_column">
							<div id="${ns}_email_div<tdl:counter name="email_div" increase="true"/>" <s:if test="deleted == 1">style="text-decoration:line-through;"</s:if>>wird berechnet...</div>
							<script>
								try { document.getElementById('${ns}_email_div<tdl:counter name="email_div"/>').innerHTML = TopdevUtil.decryptZD('<tv2:encrypter><s:property value="decode"/></tv2:encrypter>'); } catch(e) {}
							</script>
						</td>
					</s:elseif>
					<s:else>
						<td class="topdev_column">
							<s:if test="deleted == 1"><strike><s:property value="decode"/></strike></s:if>
							<s:else><s:property value="decode"/></s:else>
						</td>
					</s:else>
				</s:iterator>
			</tr>				 	
		</s:iterator>	
	</table>