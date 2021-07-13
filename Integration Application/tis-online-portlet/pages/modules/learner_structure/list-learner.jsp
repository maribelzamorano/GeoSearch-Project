<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/neuter_resources/learner-list</tdl:var-set>

<tdl:var-set name="mode"><s:property value="mode"/></tdl:var-set>
<% if(request.getAttribute("listObject")==null) request.setAttribute("listObject","simpleList"); %>
<div
	id="<tdl:var name="ns"/>_<tdl:var name="ajaxId"/>_info_delete"
	style="display:none">
		<i>Die gestrichenen Eintr&auml;ge werden durch [Speichern] aus dem Datenbestand gel&ouml;scht</i>
</div>
<s:push value="${listObject}">
	<table width="100%" class="topdev_hitlist" cellpadding="0" cellspacing="1">
		<colgroup>
			<c:if test="${mode!=2}">
				<col class="topdev_cursorbar">
				<col class="topdev_iconbar">
			</c:if>
			<col>
		</colgroup>
		<tr>
			<th >
			</th>
			<th >
			</th>
			<th colspan="3" align="center">
				Anzahl der Sch&uuml;ler
			</th>
		</tr>
		<tr>
			
			<s:iterator value="headingList" status="rowstatus">
				<th align="left">
					<s:property value="value"/>
				</th>
			</s:iterator>
		</tr>
		<s:iterator value="entryList" status="rowstatus">
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
				<c:if test="${mode!=2}">
					<td class="topdev_cursorbar">
					</td>
					<td class="topdev_iconbar">
						<s:if test="modified == 1 || deleted == 1">
							<tui:icon type="undo"><tui:url>${actionURL}_undo.action</tui:url>&id=<s:property value="id"/></tui:icon>
						</s:if>
						<s:else>
							<s:if test="mode == 1">
								<tui:icon type="edit"><tui:url>${actionURL}_edit.action</tui:url>&id=<s:property value="id"/></tui:icon>
								<tui:icon type="delete"><tui:url>${actionURL}_delete.action</tui:url>&id=<s:property value="id"/></tui:icon>
							</s:if>
						</s:else>
					</td>
				</c:if>	
				<s:iterator value="entries" status="colstatus">
					<td >
						<c:if test="${modified}">
							<form
								action=""
								method="post"
								id="${ajaxId}_form${id}"
								name="${ajaxId}_form${id}">
								<select 
									onchange="var url = '<tui:url>${actionURL}_save.action</tui:url>' + '&ajaxId=${ajaxId}&id=${id}&' + Form.serialize(document.getElementById('${ajaxId}_form${id}')); AjaxUtil.request(url);" 
									name="entry_code_0"><option><s:property value="decode"/></option>
									<option>Rollstuhlgerecht</option><option>Lift</option></select>
							</form>
						</c:if> 
						<c:if test="${!modified}">
							<c:if test="${deleted=='1'}"><strike></c:if>
								<s:property value="decode"/>
							<c:if test="${deleted=='1'}"></strike></c:if>
						</c:if>
					</td>
				</s:iterator>
			</tr>				 	
		</s:iterator>	
			
	</table>
</s:push>
