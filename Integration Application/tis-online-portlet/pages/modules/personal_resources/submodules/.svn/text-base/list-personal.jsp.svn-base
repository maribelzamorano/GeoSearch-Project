<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/personal_resources/personal-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
	<%@ include file="/pages/lib/fragment/list/complex/body-before.jsp" %>
</s:push>


	<s:iterator value="${listEntryObject}" status="rowstatus">
	
		<%@ include file="/pages/lib/fragment/list/complex/entry-before.jsp" %>
		<td width="100%">
	
<table class="topdev_list_head" width="100%" cellpadding="0" cellspacing="0">
	<colgroup>
		<col width="130"/>
		<col/>
	</colgroup>
		<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
		<td class="first" width="135px">
			<nobr><s:if test="deleted == 1"><strike></s:if>
				<b><s:property value="funktion"/>:</b>
			<s:if test="deleted == 1"></strike></s:if></nobr>
		</td>							
		<td >
			<s:if test="deleted == 1"><strike></s:if>
				<s:property value="titel"/> <s:property value="vorname"/> <s:property value="nachname"/>
			<s:if test="deleted == 1"></strike></s:if>
		</td>							
	</tr>
	<s:if test="deleted != 1">
		<s:if test="telefon !=''">
			<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>														
				<td class="left">
					Telefon:
				</td>
				<td>
					<s:property value="telefon"/>	 
				</td>
			</tr>
		</s:if>						
		<s:if test="email !=''">
			<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>													
				<td class="left">
					E-Mail:
				</td>
				<td>
					<a href="javascript:location.replace('mailto:'+TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'));">
						<div id="${ns}_email_div<tdl:counter name="email_div" increase="true"/>" <s:if test="deleted == 1">style="text-decoration:line-through;"</s:if>>wird berechnet...</div>
					</a>
					<script>
						try { document.getElementById('${ns}_email_div<tdl:counter name="email_div"/>').innerHTML = TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'); } catch(e) {}
					</script>
				</td>
			</tr>	
		</s:if>						
		<s:if test="sprechzeiten !=''">					
			<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>													
				<td valign="top" class="left">
					Sprechzeiten:
				</td>
				<td>
					<tui:breaker><s:property value="sprechzeiten"/>	 </tui:breaker>
				</td>
			</tr>						
		</s:if>						
		<s:if test="bemerkung !=''">	
			<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>														
				<td class="left" valign="top">
					Bemerkung:
				</td>
				<td>
					<tui:reviser>
						<tui:breaker><s:property value="bemerkung"/></tui:breaker>
					</tui:reviser>
				</td>
			</tr>						
		</s:if>	
		<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if> height="7px;"><td colspan="2"></td></tr>	
	</s:if>
</table>
<%--______________________________________________________________________________________--%>		
		</td>
		<%@ include file="/pages/lib/fragment/list/complex/entry-after.jsp" %>
	</s:iterator>
	<%@ include file="/pages/lib/fragment/list/complex/body-after.jsp" %>
