<%@ include file="init.jsp" %>


<s:push value="mainObject">
<script>
var detailUrl = "<tui:url action="true">detail</tui:url>";
</script>
<tui:errors/>
<table class="topdev_view" width="100%" border="0">
	<colgroup>
		<col/>
		<col/>
	</colgroup>
<tr>
	<td class="space_left" colspan="2">
		<div class="title_big"><s:property value="schulname"/></div>
	</td>
</tr>
<tr>
	<td class="space_left" colspan="2">
	<s:if test="gepa_rolle=='20'">
		<div class="schoolnumber"><tui:msg key="schulamt" type="label"/></div>
	</s:if>
		<s:if test="gepa_rolle=='30'">
			<div class="schoolnumber"><tui:msg key="schultraeger" type="label"/> </div>
		</s:if>
	</td>
</tr>
<tr>
	<td colspan="2" class="space">
		<s:property value="cc_strasse"/><br/>  
		<s:property value="cc_plz_ort"/>
	</td>
	<%--<td>
		 <img src="<s:url value="/images/icons/portlet/forward.gif"/>" title="zur&uuml;ck" border="0"/>
		&nbsp;<a href="<s:url action="directions" windowState="maximized" ></s:url>"/>Wegbeschreibung</a>
	</td>--%>
</tr>
<tr>
	<td colspan="2" class="space_left">
		<s:if test="wegbeschreibung!=''">
			<img src="<s:url value="/images/icons/portlet/link_intern.gif"/>" title="link" border="0"/> <a class="topdev_link" href="#wegbeschreibung">Wegbeschreibung</a>
		</s:if>
		<s:else>
			<img src="<s:url value="/images/icons/portlet/link_extern.gif"/>" title="link" border="0"/> <a class="topdev_link" href="http://maps.google.de/maps?f=q&hl=de&q=<s:property value="cc_strasse"/>+<s:property value="cc_plz_ort"/>+" target="_blank">Adresse mit Google Maps</a>
		</s:else>	
		<br/><br/>
	</td>
</tr>
<tr>
	<td colspan="2">
		<table class="topdev_space_left" cellpadding="0" cellspacing="0" >
			<col width="70px"/>
			<col/>
				<s:if test="telefon!=''">
					<tr>
						<td valign="top">
							<tui:msg key="telefon" type="label"/>
						</td><td class="right"><s:property value="telefon"/></td>
					</tr>
				</s:if>
				<s:if test="telefon_hort!=''">
					<tr>
						<td valign="top">
							<nobr><tui:msg key="telefon_hort" type="label"/></nobr>
						</td><td class="right"><s:property value="telefon_hort"/></td>
					</tr>
				</s:if>
				<s:if test="telefax!=''">
					<tr>
						<td valign="top">
							<tui:msg key="telefax" type="label"/> </td><td class="right"><s:property value="telefax"/></td>
					</tr>
				</s:if>
				<s:if test="email!=''">
					<tr>
						<td valign="top">
							<tui:msg key="email" type="label"/> </td>
						<td class="right">
							<a href="javascript:location.replace('mailto:'+TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'));">
								<div id="${ns}_email_div">wird berechnet...</div>
							</a>
							<script>
								try { document.getElementById('${ns}_email_div').innerHTML = TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'); } catch(e) {}
							</script>
						</td>
					</tr>
				</s:if>
				<s:if test="url!=''">
					<tr>
						<td valign="top">
							<tui:msg key="internet" type="label"/> </td><td class="right"><a href="<s:property value="url"/>" target="_blank"><s:property value="url"/></a></td>
					</tr>
				</s:if>


				<tr><td colspan="2">&nbsp;</td></tr>

				<s:if test="leiter!=''">
					 <tr><td valign="top"><tui:msg key="leiter" type="label"/>:</td><td class="right"> <s:property value="leiter"/> </td></tr>
				</s:if>
				<s:if test="ansprechpartner!=''">
					 <tr><td valign="top"><tui:msg key="ansprechpartner" type="label"/>:</td><td class="right"> <s:property value="ansprechpartner"/> </td></tr>
				</s:if>

				<s:if test="schultraeger!=''">
					 <tr >
						<td valign="top">
							<tui:msg key="schultraeger" type="label"/>:
						</td>
						<td class="right">
							<s:if test="gepa_rolle=='10'">
								<a href="overview/hierarch?tspi=<s:property value="gepa_id_traeger"/>&tspm=hierarch1">
							</s:if>
								<s:property value="schultraeger"/>
							<s:if test="gepa_rolle=='10'">
								</a>
							</s:if>
						</td>
					</tr>
				</s:if>
				<s:if test="schulamt!=''">
					<tr>
						<td valign="top">
							<tui:msg key="schulamt" type="label"/>: </td><td class="right">
								<s:if test="gepa_rolle=='10'">
								<a href="overview/hierarch?tspi=<s:property value="gepa_id_schulamt"/>&tspm=hierarch2">
							</s:if>
								<s:property value="schulamt"/>
							<s:if test="gepa_rolle=='10'">
								</a>		
							</s:if>	
						</td>
					</tr>
				</s:if>

				<tr><td colspan="2">&nbsp;</td></tr>

				<%--_________________________ Schulteile _________________________ --%>			
				<s:if test="schooltractList.entryList.size > 0">
					<tr>
						<td class="topdev_title_gray space_top" colspan="2">
							Nebenstellen
						</td>
					</tr>

					 <tr >
						<td valign="top" colspan="2">
							<table>
							<colgroup><col width="78px"/><col width="400px"/></colgroup>
								<c:set var="i">0</c:set>
								<s:iterator value="schooltractList.entryList" status="rowstatus">
									<c:set var="i">${i+1}</c:set>
									<tr>
										<td colspan="2" align="left" style="padding-top:6px; color: #185888"><b><s:property value="bezeichnung"/></b></td>
									</tr>
									<s:if test="strasse!=null or plzOrt!=null">
										<tr>
											<td valign="top" colspan="2" width="400px"><s:property value="strasse"/><br/><s:property value="plzOrt"/></td>
										</tr>
									</s:if>
									<s:if test="telefon!=null">
										<tr>
											<td valign="top"><tui:msg key="telefon" type="label"/></td>
											<td class="right"><s:property value="telefon"/></td>
										</tr>
									</s:if>
									<s:if test="telefax!=null">
										<tr>
											<td valign="top"><tui:msg key="telefax" type="label"/></td>
											<td class="right"><s:property value="telefax"/></td>
										</tr>
									</s:if>	
									<s:if test="email!=null">
										<tr>
											<td valign="top"><tui:msg key="email" type="label"/></td>
											<td class="right">
												<a href="javascript:location.replace('mailto:'+TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'));">
													<div id="${ns}_email_div_${i}">wird berechnet...</div>
												</a>
												<script>
													try { document.getElementById('${ns}_email_div_${i}').innerHTML = TopdevUtil.decryptZD('<tui:encrypter><s:property value="email"/></tui:encrypter>'); } catch(e) {}
												</script>
											</td>
										</tr>
									</s:if>
								</s:iterator>
							</table>
						</td>
					</tr>
				</s:if>
				
				
				
		</table>
	</td>
</tr>
	<s:set name="aufgaben" value="aufgaben" scope="page"/>
	<c:if test="${not empty aufgaben}">
		<tr>
			<td class="topdev_title_gray space_top" colspan="2">
				Aufgaben / Angebote
			</td>
		</tr>
		<tr>
			<td class="space_left block" colspan="2">
				<tui:reviser styling="true">
					<tui:breaker><s:property value="aufgaben"/></tui:breaker>
				</tui:reviser>
			</td>
		</tr>
	</c:if>
	<s:set name="oeffnungszeiten" value="oeffnungszeiten" scope="page"/>
	<c:if test="${not empty oeffnungszeiten}">
		<tr>
			<td class="topdev_title_gray space_top" colspan="2">
				&Ouml;ffnungszeiten
			</td>
		</tr>
		<tr>
			<td class="space_left block" colspan="2">
				<tui:reviser styling="true">
					<tui:breaker><s:property value="oeffnungszeiten"/></tui:breaker>
				</tui:reviser>
			</td>
		</tr>
	</c:if>
	<s:set name="wegbeschreibung" value="wegbeschreibung" scope="page"/>
	<c:if test="${not empty wegbeschreibung}">
		<tr>
			<td class="topdev_title_gray space_top" colspan="2">
				<a name="wegbeschreibung"></a><tui:msg key="wegbeschreibung" type="label"/> 				
			</td>
		</tr>
		<tr>
			<td class="space_left block" colspan="2">
				<tui:reviser>
					<tui:breaker><s:property value="wegbeschreibung"/></tui:breaker>
				</tui:reviser>
			</td>
		</tr>
		<tr>
			<td class="space_left" colspan="2">
				<img src="<s:url value="/images/icons/portlet/link_extern.gif"/>" title="link" border="0"/> <a class="topdev_link" href="http://maps.google.de/maps?f=q&hl=de&q=<s:property value="cc_strasse"/>+<s:property value="cc_plz_ort"/>+" target="_blank">Adresse mit Google Maps</a><br/>
			</td>
		</tr>
	</c:if>
<tr height="50px" valign="bottom"> 
	<td class="space_left" >
	</td>
	<td class="button" align="right">
		<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/businesspartner/print.action</tui:url>&anwf=media')"/>
	</td>
</tr>
<s:if test="gepa_rolle=='40'">
	<tr>
		<td>
			<tui:icon type="editViewAction"/>
		</td>
		<td width="100%" class="change">
			<tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/>
		</td>
	</tr>
</s:if>

</table>
</s:push>
	