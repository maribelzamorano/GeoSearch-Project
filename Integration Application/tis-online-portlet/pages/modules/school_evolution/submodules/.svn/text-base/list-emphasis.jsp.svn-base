<%@ include file="init.jsp" %>
<tdl:var-set name="requestParadigm">true</tdl:var-set>
<tdl:var-set name="actionURL">/school_evolution/emphasis-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %><s:push value="complexList"><%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>	<s:iterator value="complexEntryList" status="rowstatus"><%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %><td width="100%">	
<%--________________________________________________________________________--%>

	<table width="100%" cellpadding="0" cellspacing="0">
		<colgroup>
			<col width="80px"/>
			<col/>
		</colgroup>						
		<tr class="row_odd">
			<td colspan="2" class="first">
				<s:if test="deleted == 1"><strike></s:if>
					<b><s:property value="entwicklungsschritt"/></b>
				<s:if test="deleted == 1"></strike></s:if>
			</td>							
		</tr>
		<s:if test="deleted != 1">					
			<tr>
				<td class="first" valign="top" colspan="2">
					<tui:breaker><s:property value="schwerpunkt"/></tui:breaker>
				</td>
			</tr>
			<s:if test="beteiligte!=null">
				<tr>
					<td class="left"><tui:msg key="beteiligte" type="label"/></td>
					<td valign="top"><s:property value="beteiligte"/></td>
				</tr>
			</s:if>
			<s:if test="anlagen.size>0">
				<tr>
					<td valign="top"  class="left" colspan="2">
						<ul class="topdev_documents">
							<s:iterator value="anlagen" status="anlaStatus">
							<tdl:var-set name="downloadURL">/download/virtual/<s:property value="value"/></tdl:var-set>
								<li>
								<a
									class="topdev_link"
									target="_blank"
									href="<tui:url>${downloadURL}</tui:url>&ANLA_ID=<s:property value="key"/>">
									<s:property value="value"/>
								</a>
								</li>
								<%-- <s:if test="!#anlaStatus.last">,&nbsp;</s:if>--%>
							</s:iterator>
						</ul>
					</td>
				</tr>
			</s:if>
			<tr height="8px;"><td colspan="2"></td></tr>	
		</s:if>
	</table>
<%--______________________________________________________________________________________--%>
</td><%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %></s:iterator><%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %></s:push>
