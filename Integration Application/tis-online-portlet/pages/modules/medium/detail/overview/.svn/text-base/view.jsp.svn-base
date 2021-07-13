<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort-v2.jsp" %>
<c:set var="mediumId"><s:property value="viewObject.bobj.id"/></c:set>
<c:set var="vsid"><tdl:generate-vsid mode="1" name="MediumEditObj"/></c:set>
<c:set var="url_edit"><s:url action="edit" windowState="maximized"><s:param name="mode">1</s:param><s:param name="vsid">${vsid}</s:param><s:param name="tspi"><s:property value="tspi"/></s:param></s:url></c:set>	

<c:if test="${mediumId == 0}">
	wird geladen... <script> location.replace("${url_edit}"); </script>
</c:if>
<c:if test="${mediumId != 0}">
<s:if test="viewObject.streamingFile != null">
	<c:set var="streamingUrl"><s:push value="viewObject.streamingFile">${initParam.domain_url_nonssl}/tis-online-portlet/medium_navigation/medium-download.action?mid=<s:property value="viewObject.bobj.id"/>&did=1&name=<s:property value="dateiname"/>&usage=1&type=<s:property value="format"/></s:push></c:set>
</s:if>
<c:set var="hasStreaming">1</c:set>
<s:if test="viewObject.streamingFile != null">
	<s:if test="viewObject.streamingFile.id==null"><c:set var="hasStreaming">0</c:set></s:if>
</s:if>
<s:else>
	<c:set var="hasStreaming">0</c:set>
</s:else>

<%--<a href="${streamingUrl}">_${streamingUrl}_</a>--%>

<s:push value="viewObject">
<s:push value="bobj">
	<table style="margin-left:2px;" width="100%">
	<colgroup><col width="200px"/><col/></colgroup>
	<tr>
		<td colspan="2">
			
		</td>
	</tr>
	<tr><td valign="top" colspan="2">
	<div id="${ns}_streaming">
	
	</div>
	</td></tr>
	<tr>
		<td colspan="2">
			<table width="100%" cellspacing="0" cellpadding="0">
			<tr>
			<td>
				<div class="title_bigger"><s:property value="einzeltitel"/></div>
				<div class="schoolnumber"><s:property value="einzeluntertitel"/></div><br/>
			</td>
			<td align="right" valign="top">
				<div class="back" style="float:right">
					<div style="float:right">
						<nobr>
						<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
						<c:if test="${sessionScope['lastMediResultList'] eq 'result'}">
							<a class="topdev_link" href="/web/guest/media/search">Zur&uuml;ck</a>
						</c:if>
						<c:if test="${sessionScope['lastMediResultList'] ne 'result'}">
							<a class="topdev_link" href="/web/guest/media">Zur&uuml;ck</a>
						</c:if>
						</nobr>
					</div>
				</div>
			</td>
			</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td valign="top" align="left">
		
		<div style="width:360px; height:310px" id="preview_div_complete">
	                  <div style="position:absolute;">
	                        <div id="topdev_preview_div" style="position:absolute; top:0px; left:0px">
	                             <img
	                                   width="340"
	                                   height="255"
	                                   src="<s:property value="previewImageUrl"/>"
	                                   title="Vorschau"
	                                   border="0"/>
	                             <div style="position:absolute; top:210px; left:0px">
	                             <c:if test="${hasStreaming=='1'}">
		                             <img
		                                   style="position:absolute; top:44px; left:0px"
		                                   src="/tis-online-portlet/images/design/controlbar_disabled.png"
		                                   title="Vorschau"
		                                   border="0"/>
	                             </c:if>
	                             </div>
	                        </div>
	                        <div style="position:absolute; top:35px; left:70px">
								<script>
									function initPreview(t_o)
	                                {
	                                	if(document.all)
	                                	{
		                                	document.getElementById('topdev_preview_div').innerHTML = 
												'<object ID="NSPlay" WIDTH="340" HEIGHT="299" classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" '+
												'standby="Loading components..." type="application/x-oleobject">'+
												'<param name="Filename" value="${streamingUrl}">'+
												'</object>';
										}
										else
										{
											document.getElementById('topdev_preview_div').innerHTML = 
												'<embed src="${streamingUrl}"  WIDTH="340" HEIGHT="299">';
										}
										t_o.style.display="none";
									}
	                             </script>
	                             <c:if test="${hasStreaming=='1'}">
		                             <a href="javascript:;" onclick="initPreview(this);">
		                                   <img
		                                         style="position:absolute; top:25px; left:30px"
		                                         src="/tis-online-portlet/images/icons/portlet/play.png"
		                                         title="Vorschau"
		                                         border="0"/>
		                             </a>
	                             </c:if>
	                        </div>
	                  </div>
	            </div>
		<%-- 
			<center>
				<a href="#" onclick="document.getElementById('${ns}_streaming').style.display='inline'; this.style.display='none'; return false;"><img src="<s:url value="/images/icons/portlet"/>/play.jpg"/><br/>
				Vorschau</a>
				<br/><br/>
			</center>
			--%>
		</td>
		<td valign="top">
			<table style="margin-left:10px; ">
			<colgroup>
			<col>
			<col>
			</colgroup>				
			<s:if test="mediumArtDecode != '' && mediumArtDecode != Null">
			<tr>
				<td valign="top">
					<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-mediumArtCode"/></font>
					<br/><s:property value="mediumArtDecode"/>
					<br/><br/>
				</td>
			</tr>
			</s:if>
			<s:if test="sprachenDesMediums.size > 0">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-sprachenDesMediums"/></font>
				<br/>
					<s:iterator value="sprachenDesMediums" status="tIt">
						<s:property value="decode"/> <s:if test="sprachergaenzungDeCode!='' && sprachergaenzungDeCode!=null">(<s:property value="sprachergaenzungDeCode"/>)</s:if><s:if test="!#tIt.last">, </s:if>
					</s:iterator>
					<br/><br/>
				</td>
			</tr>
			</s:if>
			<s:if test="produktionsjahr != '' && produktionsjahr != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-produktionsjahr"/></font>
				<br/><s:property value="produktionsjahr"/><br/><br/></td>
			</tr>
			</s:if>
			<s:if test="fskVermerkDecode != '' && fskVermerkDecode != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-fskVermerkCode"/></font>
				<br/><s:property value="fskVermerkDecode"/><br/><br/></td>
			</tr>
			</s:if>
			<s:if test="mediumNummer != '' && mediumNummer != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-mediumNummer"/></font>
				<br/><s:property value="mediumNummer"/></td>
			</tr>
			</s:if>
			</table>
		</td>
	
	</tr>
	<tr>
		<td colspan="2">
			<table width="100%">
			<colgroup>
				<col width="130px">
				<col >		
			</colgroup>
			<s:if test="produktionslaenderDesMediums.size > 0">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-pruduktionslaenderDesMediums"/></font></td>
				<td>
					<s:iterator value="produktionslaenderDesMediums" status="tIt">			
							 <s:property value="decode"/><s:if test="!#tIt.last">, </s:if>
					</s:iterator>
				</td>
			</tr>
			</s:if>
			<s:if test="serientitel != '' && serientitel != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-serientitel"/></font></td>
				<td><s:property value="serientitel"/></td>
			</tr>
			</s:if>
			<s:if test="serienuntertitel != '' && serienuntertitel != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-serienuntertitel"/></font></td>
				<td><s:property value="serienuntertitel"/></td>
			</tr>
			</s:if>
			<s:if test="kurzinhalt != '' && kurzinhalt != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-kurzinhalt"/></font></td>
				<td><tv2:breaker><tv2:parser textparsing="1"><s:property value="kurzinhalt"/></tv2:parser></tv2:breaker></td>
			</tr>
			</s:if>
			<s:if test="anzahlLaufzeitFarben != '' && anzahlLaufzeitFarben != NULL">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-anzahlLaufzeitFarben"/></font></td>
				<td><s:property value="anzahlLaufzeitFarben"/></td>
			</tr>
			</s:if>
			<s:if test="adressatenDesMediums.size > 0">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-adressatenDesMediums"/></font></td>
				<td>
					<s:iterator value="adressatenDesMediums" status="tIt">
						<s:property value="decode"/> <s:if test="altersstufe != ''">(<s:property value="altersstufe"/>)</s:if><s:if test="!#tIt.last">, </s:if>
					</s:iterator>
				</td>
			</tr>
			</s:if>
			<s:if test="klassifikationenDesMediums.size > 0">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-klassifikationenDesMediums"/></font></td>
				<td>
					<s:iterator value="klassifikationenDesMediums" status="tIt">
						<s:property value="decode"/><s:if test="!#tIt.last">, </s:if>
					</s:iterator>
				</td>
			</tr>
			</s:if>
			<s:if test="sachgebieteDesMediums.size > 0">
				<tr>
					<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-sachgebieteDesMediums"/></font></td>
					<td>
						<s:iterator value="sachgebieteDesMediums" status="tIt">
							- <s:property value="hierarchy"/><s:if test="!#tIt.last"><br/> </s:if>
						</s:iterator>
					</td>
				</tr>
			</s:if>
			<s:set name="empty" value="0"/>
			<s:if test="freieSchlagworteDesMediums.size > 0 || kontrollierteSchlagworteDesMediums.size>0">
			<tr>
				<td valign="top"><font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-SchlagworteDesMediums"/></font></td>
				<td>
					<s:iterator value="freieSchlagworteDesMediums" status="tIt">
							<s:property value="bezeichnung"/><s:if test="!#tIt.last">,</s:if>
					</s:iterator>
					<s:if test="freieSchlagworteDesMediums.size>0 && kontrollierteSchlagworteDesMediums.size>0">, </s:if>
					<s:iterator value="kontrollierteSchlagworteDesMediums" status="tIt">
							<s:property value="decode"/><s:if test="!#tIt.last">, </s:if>
					</s:iterator>
				</td>
			</tr>
			</s:if>
			</table>
		</td>
	</tr>
	</table>
	
	<script>
		function ${ns}_showMoreInformations(obj)
		{
			document.getElementById('${ns}_ext').style.display='inline';
			document.getElementById('linkpic').style.display='none';
			obj.style.display='none';
			if(document.all) document.getElementById('preview_div_complete').innerHTML = document.getElementById('preview_div_complete').innerHTML;
			return false;
		}
	</script>
	<br/>
	<img id="linkpic" src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Weitere Informationen anzeigen..." border="0"/>
	&nbsp;<a class="topdev_link" onclick="${ns}_showMoreInformations(this);" href="javascript:;">Weitere Informationen anzeigen...</a>
	
	<div id="${ns}_ext" style="display:none">
	<script>
	
	</script>
	<s:if test="(inhalt != '' && inhalt != NULL) || (serienbeschreibung != '' && serienbeschreibung != NULL)" >
	<h5>Titel/Inhalt</h5>
	<s:if test="inhalt != '' && inhalt != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-inhalt"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="inhalt"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="serienbeschreibung != '' && serienbeschreibung != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-serienbeschreibung"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="serienbeschreibung"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	</s:if>
	
	<s:if test="(anmerkungDidaktik != '' && anmerkungDidaktik != NULL) || (anmerkungHandhabung != '' && anmerkungHandhabung != NULL) || (lernziele != '' && lernziele != NULL) || (vorkenntnisse != '' && vorkenntnisse != NULL)">
	<h5>Anmerkungen</h5>
	<s:if test="anmerkungDidaktik != '' && anmerkungDidaktik != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-anmerkungDidaktik"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="anmerkungDidaktik"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="anmerkungHandhabung != '' && anmerkungHandhabung != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-anmerkungHandhabung"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="anmerkungHandhabung"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="lernziele != '' && lernziele != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-lernziele"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="lernziele"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="vorkenntnisse != '' && vorkenntnisse != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-vorkenntnisse"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="vorkenntnisse"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	</s:if>

	<s:if test="(begleitmaterial != '' && begleitmaterial != NULL) || (kontextmedien != '' && kontextmedien != NULL) || (kontextmedien != '' && kontextmedien != NULL) || (ausstrahlungsdatenSchulfernsehen != NULL && ausstrahlungsdatenSchulfernsehen != '')">
	<h5>Dokumentation und Kontext</h5>
	<s:if test="begleitmaterial != '' && begleitmaterial != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-begleitmaterial"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="begleitmaterial"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="kontextmedien != '' && kontextmedien != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-kontextmedien"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="kontextmedien"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="erfahrungsbericht != '' && erfahrungsbericht != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-erfahrungsbericht"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="erfahrungsbericht"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="ausstrahlungsdatenSchulfernsehen != NULL && ausstrahlungsdatenSchulfernsehen != ''">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-ausstrahlungsdatenSchulfernsehen"/></font><br/>
				<s:property value="ausstrahlungsdatenSchulfernsehen"/>
	<br/><br/>
	</s:if>
	</s:if>
	
	<c:set var="urheberDesMediumsContent"><s:iterator value="urheberDesMediums"><s:if test="urheberFunktionCode == 7"><s:property value="bezeichnung"/><br/></s:if></s:iterator></c:set>
	<s:if test="(produktionsartDecode != '' && produktionsartDecode != NULL) || (produzent != '' && produzent != NULL) || ${not empty urheberDesMediumsContent} || (herausgeber != '' && herausgeber != NULL) || (endabnahmejahr != '' && endabnahmejahr != NULL) || (lizenzenDesMediums.size > 0)">
	<h5>Urheber, Produktion, Rechte</h5>
	<s:if test="produktionsartDecode != '' && produktionsartDecode != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-produktionsartCode"/></font><br/>
				<s:property value="produktionsartDecode"/>
	<br/><br/>
	</s:if>
	<s:if test="produzent != '' && produzent != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-produzent"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="produzent"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>

	<s:if test="urheberDesMediums.size > 0">
		<s:if test="${not empty urheberDesMediumsContent}">
			<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-urheberDesMediums"/></font><br/>
		</s:if>
		${urheberDesMediumsContent}<br/><br/>
	</s:if>
	<s:if test="herausgeber != '' && herausgeber != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-herausgeber"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="herausgeber"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="endabnahmejahr != '' && endabnahmejahr != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-endabnahmejahr"/></font><br/>
				<s:property value="endabnahmejahr"/>
	<br/><br/>
	</s:if>
	<s:if test="lizenzenDesMediums.size > 0">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-lizenzenDesMediums"/></font><br/>
				<s:iterator value="lizenzenDesMediums" status="tIt">
					<s:property value="bezeichnung"/> <s:if test="webseite != '' && webseite != NULL">(<s:property value="webseite"/>)</s:if><s:if test="!#tIt.last">; </s:if>
				</s:iterator>
	<br/><br/>
	</s:if>
	</s:if>
	
	<s:if test="(auszeichnungen != '' && auszeichnungen != NULL) || (systemvoraussetzungen != '' && systemvoraussetzungen != NULL) || (verfuegbarkeitEnde != '' && verfuegbarkeitEnde != NULL) || (isbnDesMediums.size > 0)">
	<h5>Sonstiges</h5>
	<s:if test="auszeichnungen != '' && auszeichnungen != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-auszeichnungen"/></font><br/>
				<tv2:breaker><tv2:parser textparsing="1"><s:property value="auszeichnungen"/></tv2:parser></tv2:breaker>
	<br/><br/>
	</s:if>
	<s:if test="systemvoraussetzungen != '' && systemvoraussetzungen != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-systemvoraussetzungen"/></font><br/>
				<s:property value="systemvoraussetzungen"/>
	<br/><br/>
	</s:if>
	<s:if test="verfuegbarkeitEnde != '' && verfuegbarkeitEnde != NULL">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-verfuegbarkeitEnde"/></font><br/>
				<s:property value="verfuegbarkeitEnde"/>
	<br/><br/>
	</s:if>
	<s:if test="isbnDesMediums.size > 0">
	<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-isbnDesMediums"/></font><br/>
				<s:iterator value="isbnDesMediums" status="tIt">
					<s:property value="bezeichnung"/><s:if test="!#tIt.last">, </s:if>
				</s:iterator>
	<br/><br/>
	</s:if>
	<%-- 
		<s:if test="mediumStatusDecode != '' && mediumStatusDecode != NULL">	
		<font class="topdev_zusatzinfo"><tv2:msg key="viewlabel-mediumStatusCode"/></font><br/>
					<s:property value="mediumStatusDecode"/>
		<br/><br/>
		</s:if>
	--%>
	</s:if>

	</div>
	
	<br/><br/>
		<table>
		<colgroup><col width="22px"/></colgroup>
		<tv2:permission object="button_edit" action="edit">
			<tr>
				<td><a href="${url_edit}"><img src="/tis-online-portlet/images/icons/portlet/edit.png" title="Medium bearbeiten" border="0"/></a></td>
				<td><a href="${url_edit}">Medium bearbeiten</a></td>
			</tr>
		</tv2:permission>
		<tv2:permission object="button_delete" action="delete">
			<tr>
				<td style="padding-top:5px">
					<a href="javascript:;" onclick="TopdevUtil.showRequestDialog('${ns}'); TopdevUtil.tsp_dialog_request = function() { TopdevUtil.updateDiv('${ns}_delete_div', '/tis-online-portlet/medium_detail_overview/delete.action?id=<s:property value="id"/>&pts=<s:property value="pts"/>&orgUser=<s:property value="orgUser"/>'); };">
						<img src="/tis-online-portlet/images/icons/portlet/delete.gif" title="Medium l&ouml;schen" border="0"/>
					</a>
				</td>
				<td style="padding-top:5px">
					<a href="javascript:;" onclick="TopdevUtil.showRequestDialog('${ns}'); TopdevUtil.tsp_dialog_request = function() { TopdevUtil.updateDiv('${ns}_delete_div', '/tis-online-portlet/medium_detail_overview/delete.action?id=<s:property value="id"/>&pts=<s:property value="pts"/>&orgUser=<s:property value="orgUser"/>'); };">
						Medium l&ouml;schen
					</a>
				</td>
			</tr>
		</tv2:permission>
		</table>
		<div id="${ns}_delete_div"></div>
	
	
	<div class="back">
		<div>
			<br/><br/>&nbsp;
			<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
			<c:if test="${sessionScope['lastMediResultList'] eq 'result'}">
				<a class="topdev_link" href="/web/guest/media/search">Zur&uuml;ck</a>
			</c:if>
			<c:if test="${sessionScope['lastMediResultList'] ne 'result'}">
				<a class="topdev_link" href="/web/guest/media">Zur&uuml;ck</a>
			</c:if>
	</div>
	
</s:push>
</s:push>
</c:if>

