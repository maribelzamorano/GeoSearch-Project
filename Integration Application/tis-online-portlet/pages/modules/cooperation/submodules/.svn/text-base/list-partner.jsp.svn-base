<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/cooperation/partner-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>


	<s:iterator value="${listEntryObject}" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td width="100%">
			<table class="topdev_list_head" width="100%" cellpadding="0" cellspacing="0">
				<colgroup>
					<col width="120px"/>
					<col>
				</colgroup>
				<tr class="row_odd">
					<td class="first" colspan="2">
					<s:if test="deleted == 1"><strike></s:if>
					<b> <s:property value="Name"/></b>&nbsp;&nbsp;(<s:property value="Partnerart"/>)
					<s:if test="deleted == 1"></strike></s:if>
					</td>
				</tr>
				<s:if test="deleted != 1">
				<tr>						
					<td class="left space_top" valign="top">
						Schwerpunkt:
					</td>
					<td class="space_top">
						<tui:breaker><s:property value="schwerpunkt"/></tui:breaker>
					</td>
				</tr>
				<s:if test="beginn!=''">
					<tr>
						<td class="left">
							Partner seit:
						</td>
						<td>
							<s:property value="beginn"/>
						</td>
					</tr>
				</s:if>
				<s:if test="Land!=''">
					<tr>
						<td class="left">
							Land:
						</td>
						<td >
						<s:property value="Land"/>	
						</td>
					</tr>
				</s:if>
				<s:if test="Ort!=''">
					<tr>
						<td class="left">
							<nobr>Adresse:</nobr>
						</td>
						<td >
							<s:if test="Strasse!=''"><s:property value="Strasse"/> <s:property value="hausnummer"/>, </s:if><s:property value="plz"/> <s:property value="Ort"/>
						</td>
					</tr>
				</s:if>
				<s:if test="homepage!=''">
					<tr>
						<td class="left">
							Homepage:
						</td>
						<td >
							<a href="http://<s:property value="homepage"/>" target="_blank">
								<s:property value="homepage"/>
							</a>
						</td>
					</tr>
				</s:if>
				<tr><td class="left last_row"><br/></td><td class="last_row"><br/></td></tr>
				</s:if>
			</table>
		</td>
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>
