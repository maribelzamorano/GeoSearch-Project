<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/neuter_resources/sport-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>

<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>
<s:iterator value="${listEntryObject}" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td width="100%">
			<table cellpadding="0" cellspacing="0" width="100%">
				<colgroup>
					<col width="150"/>
					<col/>
				</colgroup>
				<tr class="row_odd">
					<td class="first" colspan="2">
					<s:if test="deleted == 1"><strike></s:if>
					<b><s:property value="sportstaettenart"/></b>
					<s:if test="deleted == 1"></strike></s:if>
					</td>
				</tr>
				<s:if test="deleted != 1">
				<s:if test="beschreibung != ''">
					<tr >						
						<td class="first" colspan="2">
							<tui:reviser>
								<tui:breaker><s:property value="beschreibung"/></tui:breaker>
							</tui:reviser>
						</td>
					</tr>
				</s:if>
				<s:if test="entfernung != ''">
					<tr>
						<td class="left" valign="top">
						<nobr><tui:msg key="entfernung_von_schule" type="label"/></nobr>
						</td>
						<td valign="top">
						<s:property value="entfernung"/> m	
						</td>
					</tr>
				</s:if>
				<s:if test="Groesse != ''">
					<tr>
						<td class="left" valign="top">
							<tui:msg key="groesse" type="label"/>
						</td>
						<td valign="top">
							<s:property value="Groesse"/> m&sup2;	
						</td>
					</tr>
				</s:if>
				<s:if test="ausstattung != ''">
					<tr>
						<td class="left" valign="top">
							<tui:msg key="ausstattung" type="label"/>
						</td>
						<td valign="top">
						<tui:breaker><s:property value="Ausstattung"/></tui:breaker>
						</td>
					</tr>
				</s:if>
				<s:if test="erreichbarkeit != ''">
					<tr>
						<td class="left" valign="top">
							<tui:msg key="erreichbarkeit" type="label"/>
						</td>
						<td valign="top">
							<tui:breaker><s:property value="Erreichbarkeit"/></tui:breaker>
							<br/><br/>
						</td>
					</tr>
				</s:if>
				<s:else>
					<tr>
						<td colspan="2">
							<br/>
						</td>
					</tr>
				</s:else>
				</s:if>
			
			</table>
		</td>
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>
