<%@ include file="init.jsp" %>
<tdl:var-set name="requestParadigm">true</tdl:var-set>
<tdl:var-set name="actionURL">/school_life/project-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>

<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
	<s:iterator value="entryList" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td width="100%">
<%--______________________________________________________________________________________--%>
<table width="100%" cellpadding="0" cellspacing="0">						
	<tr class="row_odd">
		<td colspan="2" class="first">
			<s:if test="deleted == 1"><strike></s:if>
				<b><s:property value="eipr_bezeichnung"/></b>
			<s:if test="deleted == 1"></strike></s:if>
		</td>							
	</tr>
	<s:if test="deleted != 1">
		<tr >
			<td class="left space_top" colspan="2">
			<tui:breaker><s:property value="eipr_beschreibung"/></tui:breaker>
			</td>
		</tr>	
	<s:if test="faecher !=''">
			<tr >
			<td class="left" valign="top">
			F&#228;cher:
			</td>
			<td valign="top" width="79%">
			<s:property value="faecher"/>
			
			</td>
		</tr>
	</s:if>
	<s:if test="klassenstufen !=''">
		<tr >
			<td class="left">
			Klassenstufen:<br/>
			</td>
			<td width="79%">
			<s:property value="klassenstufen"/>
			</td>
		</tr>
	</s:if>

<s:if test="weitere_informationen!=''">
		<tr >
			<td class="first"  colspan="2"  valign="top" height="30px">
			Weitere Informationen:&nbsp;<a href="http://<s:property value="weitere_informationen"/>" target="_blank">
								<s:property value="weitere_informationen"/></a>
			</td>
		</tr>	
</s:if>	
<s:else>
		<tr height="9px;"><td colspan="2"></td></tr>	
</s:else>

	</s:if>
</table>
<%--______________________________________________________________________________________--%>		
		</td>
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>
</s:push>
