<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/working_goup/working_group-detail</tdl:var-set>
<%@ include file="/pages/lib/fragment/list/complex/body-init.jsp" %>
<s:push value="complexList">
			<table class="topdev_hitlist" cellpadding="0" cellspacing="1" width="100%">
				<colgroup>
					<col />
					<col />
					<col />
					<col />
					<col />
				</colgroup>
				<tr>
					<th rowspan="2" >
					</th>
					
					<th colspan="2" align="center">
						<nobr>Anzahl Sch&#252;ler</nobr>
					</th>
					<th colspan="2">
					</th>
				</tr>
				<tr>
			
				
				<th>
					Gesamt
				</th>
				<th>
					Weiblich
				</th>
				<th>
				<nobr> Gruppe(n)</nobr>
				</th>
					<th>
				 <nobr>Wochenstunde(n)</nobr>
				</th>
			</tr>
					<s:iterator value="complexEntryList" status="rowstatus">	
						<tr <s:if test="#rowstatus.odd">class="row_odd"</s:if>>
							<td class="first" width="135px">
								<s:if test="deleted == 1"><strike></s:if>
									<b><nobr><s:property value="inhalt"/></nobr></b>
								<s:if test="deleted == 1"></strike></s:if>
							</td>													
						<s:if test="deleted != 1">													
							
							
							<td valign="top" >
								<s:property value="anzahl_schueler"/>
							</td>
							<td valign="top" >
								<s:property value="anzahl_weiblich"/>
							</td>
							<td >
								<s:property value="anzahl_gruppen"/>
							</td>
							<td >
								<s:property value="anzahl_wochenstunden"/>
							</td>
						</s:if>
					</tr>
					</s:iterator>
			</table>
</s:push>
