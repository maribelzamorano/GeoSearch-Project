<script language="JavaScript">
function setSchulamt(b,c )
{
	TopdevUtil.updateDropdown("KREI_ID",b,c);
	document.getElementById('${ns}_form').submit();
}
function haber()
{
	alert(document.getElementById('search').value);
	}
function changeForm()
{
	if(document.getElementById('geosearch_check').checked==true)
	{
		document.getElementById('Postal_code').style.display = "block";
		document.getElementById('pctext').style.display = "block";
		document.getElementById('City').style.display = "block";
		document.getElementById('ctext').style.display = "block";
		document.getElementById('Street').style.display = "block";
		document.getElementById('stext').style.display = "block";
		document.getElementById('Radius').style.display = "block";
		document.getElementById('rtext').style.display = "block";
		document.getElementById('stypeText').style.display = "block";
		document.getElementById('SType').style.display = "block";
	/*	document.getElementById('Number_nearest').style.display = "block";
		document.getElementById('nntext').style.display = "block";*/
		document.getElementById('typeText').style.display = "block";
		document.getElementById('typeRadius').style.display = "inline";
                document.getElementById('typeNearest').style.display = "inline";
                document.getElementById('SCHU_ID').disabled=true;
                document.getElementById('suchbegriff').disabled=true;
                document.getElementById('GEPA_NAME').disabled=true;
                document.getElementById('DIEN_NR').disabled=true;
                document.getElementById('STRASSE').disabled=true;
                document.getElementById('PLZ').disabled=true;
                document.getElementById('ORT').disabled=true;
                document.getElementById('GEPA_ID_TRAEGER').disabled=true;
                document.getElementById('KREI_ID').disabled=true;
                document.getElementById('SORT_ID').disabled=true;
		}
	else if(document.getElementById('geosearch_check').checked==false)
	{
		document.getElementById('Postal_code').style.display = "none";
		document.getElementById('pctext').style.display = "none";
		document.getElementById('City').style.display = "none";
		document.getElementById('ctext').style.display = "none";
		document.getElementById('Street').style.display = "none";
		document.getElementById('stext').style.display = "none";
		document.getElementById('Radius').style.display = "none";
		document.getElementById('rtext').style.display = "none";
		document.getElementById('stypeText').style.display = "none";
		document.getElementById('SType').style.display = "none";
	/*	document.getElementById('Number_nearest').style.display = "none";
		document.getElementById('nntext').style.display = "none";*/
		document.getElementById('typeText').style.display = "none";
		document.getElementById('typeRadius').style.display = "none";
                document.getElementById('typeNearest').style.display = "none";
		}
	<% request.setAttribute("geosearch_check",request.getParameter("geosearch_check")); %>
}
function changeRadius()
{
	document.getElementById('rtext').style.display = "block";
	document.getElementById('Radius').style.display = "block";
	document.getElementById('Number_nearest').style.display = "none";
	document.getElementById('nntext').style.display = "none";
	}
function Nearest()
{
	document.getElementById('Number_nearest').style.display = "block";
	document.getElementById('nntext').style.display = "block";
	document.getElementById('rtext').style.display = "none";
	document.getElementById('Radius').style.display = "none";
	}
function clearLocalForm (id)
{
	try
	{
		if(!document.getElementById(id)) return false;
		var es = document.getElementById(id).elements;
		for(i=0; i<es.length; i++)
		{
			if(es[i].nodeName=="INPUT")
			{
				if(es[i].getAttribute("type")=="text")
					es[i].value = "";
			}
			else if(es[i].nodeName=="SELECT" && es[i].id=="SORT_ID")
			{
				if(es[i].options.length>0)
				{
					for (j=0;j<es[i].options.length;j++)
					{
						if(es[i].options[j].value=="10")
							es[i].selectedIndex = j;
					}
				}
				es[i].onchange();
			}
			else if(es[i].nodeName=="SELECT" && es[i].id!="SORT_ID")
			{
				if(es[i].options.length>0)
				{
					if(es[i].options[0].value=="")
						es[i].selectedIndex = 0;
					else
						es[i].options[0]=new Option("", "", true, true);
				}
				es[i].onchange();
			}
		}
	}
	catch(e) { TopdevUtil.log(e); }
}
</script>
<input type="hidden" name="anwf" value="${anwf}"/>


<table cellspacing="0" cellpadding="0" >
	<tr>

		<td valign="top" class="search" >
			<table class="topdev_form" cellspacing="0" cellpadding="0" >
			<colgroup>
				<col>
				<col width="60">
				<col width="100">
				<col width="205">
			</colgroup>
			<tr>
				<tui:fieldlabel>Freitextsuche:</tui:fieldlabel>
				<tui:textfield colspan="3" name="suchbegriff" maxlength="100"><s:property value="suchbegriff"/></tui:textfield>
			</tr>
			<tr>
				<tui:fieldlabel>${(anwf eq 'media')?'Medienzentrum':'Schulname'}:</tui:fieldlabel>
				<tui:textfield colspan="3" name="GEPA_NAME" maxlength="100"><s:property value="GEPA_NAME"/></tui:textfield>
			</tr>
			<c:choose>
			<c:when test="${anwf ne 'media'}">
				<tr>
					<tui:fieldlabel>${(anwf eq 'media')?'Nummer':'Schulnummer'}:</tui:fieldlabel>
					<tui:textfield  name="DIEN_NR" maxlength="6"><s:property value="DIEN_NR"/></tui:textfield>

					<tui:fieldlabel>Stra&szlig;e:</tui:fieldlabel>
					<tui:textfield  name="STRASSE" maxlength="60"><s:property value="STRASSE"/></tui:textfield>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<tui:fieldlabel>Stra&szlig;e:</tui:fieldlabel>
					<tui:textfield colspan="3"  name="STRASSE" maxlength="60"><s:property value="STRASSE"/></tui:textfield>
				</tr>
			</c:otherwise>
			</c:choose>
			<tr>
				<tui:fieldlabel>PLZ:</tui:fieldlabel>
				<tui:textfield name="PLZ" maxlength="20"><s:property value="PLZ"/></tui:textfield>

				<tui:fieldlabel>Ort:</tui:fieldlabel>
				<tui:textfield name="ORT" maxlength="40"><s:property value="ORT"/></tui:textfield>
			</tr>
			<c:if test="${anwf ne 'media'}">
				<tr>
					<tui:fieldlabel>Schulart:</tui:fieldlabel>
					<tdl:var-set name="content"><s:property value="SCHU_BEZEICHNUNG"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="SCHU_ID"/></tdl:var-set>
					<tui:dropdown name="SCHU_ID" labelname="SCHU_BEZEICHNUNG" parameter="TBSH=SCHU" preload="SCHU" colspan="3" content="${content}" value="${value}"/>
				</tr>
			</c:if>
			<tr>
				<tui:fieldlabel>Schulamt:</tui:fieldlabel>
				<tdl:var-set name="content"><s:property value="KREI_BEZEICHNUNG"/></tdl:var-set>
				<tdl:var-set name="value"><s:property value="KREI_ID"/></tdl:var-set>
				<tui:dropdown name="KREI_ID" labelname="KREI_BEZEICHNUNG" parameter="TBSH=KREI" preload="KREI" colspan="3" content="${content}" value="${value}"/>
			</tr>
			<c:if test="${anwf ne 'media'}">
				<tr>
					<tui:fieldlabel>Schultr&auml;ger:</tui:fieldlabel>
					<tdl:var-set name="content"><s:property value="SCHULTRAEGER"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="GEPA_ID_TRAEGER"/></tdl:var-set>
					<tui:dropdown name="GEPA_ID_TRAEGER" labelname="SCHULTRAEGER" parameter="TBSH=DITR" preload="DITR" colspan="3" content="${content}" value="${value}"/>
				</tr>
				<tr>
					<tui:fieldlabel>Sortierung:</tui:fieldlabel>
					<tdl:var-set name="content"><s:property value="SORT_BEZEICHNUNG"/></tdl:var-set>
					<tdl:var-set name="value"><s:property value="SORT_ID"/></tdl:var-set>
					<c:if test="${value eq ''}">
						<tdl:var-set name="value"><s:property value="10"/></tdl:var-set>
					</c:if>
					<tui:dropdown name="SORT_ID" labelname="SORT_BEZEICHNUNG" parameter="TBSH=SPSS" preload="SPSS" colspan="3" content="${content}" value="${value}" nullable="false"/>
				</tr>
				<tr>
					<td><br> Geo Search </td>
					<td class="checkbox" align="left"><br>
						<input type="checkbox" id="geosearch_check" name="geosearch_check" onclick="changeForm()"/>
					</td>
				</tr>
				<tr>
					<td  id="pctext" style="display:none">Postal Code: </td>
					<td colspan=3><input style="display:none" type="textbox" id="Postal_code" name="Postal_code"/></td>
				</tr>
				<tr>
					<td  id="ctext" style="display:none">City: </td>
					<td colspan=3><input style="display:none" type="textbox" id="City" name="City"/></td>
				</tr>
				<tr>
					<td  id="stext" style="display:none">Street: </td>
					<td colspan=3><input style="display:none" type="textbox" id="Street" name="Street"/></td>
				</tr>
				<tr>
				<td id="stypeText" style="display:none">SchoolType:</td>
				<td colspan=3>
					<SELECT name="SType" id="SType" style="display:none">
					<option></option>
					<option value="3">BBS(berufsbildende Schule)</option>
					<option value="4">F?S(F?rderschule)</option>
					<option value="5">GS(Grundschule)</option>
					<option value="6">GY(Gymnasium)</option>
					<option value="9">IGS(Integrierte Gesamtschule)</option>
					<option value="11">KGS(Kooperative Gesamtschule)</option>
					<option value="12">KO(Kolleg)</option>
					<option value="13">RS(Regelschule)</option>
					<option value="14">SFTBBS(Berufsbildende Schule in freier Tr?gerschaft)</option>
					<option value="15">SFTF?S(F?rderschule in freier Tr?gerschaft)</option>
					<option value="16">SFTGS(Grundschule in freier Tr?gerschaft)</option>
					<option value="17">SFTGY(Gymnasium in freier Tr?gerschaft)</option>
					<option value="18">SFTRS(Regelschule in freier Tr?gerschaft)</option>
					</SELECT>
				</td>
				</tr>
				<tr>
					<td id="typeText" style="display:none"  width="80%"><br>Search Type:</td>
                              
                                </tr>
                                <tr>
                                    <td></td>
                                          <td id="typeRadius" style="display:none" align="left">
                                            Radius <input type=radio name="search" onclick="changeRadius()" checked>
                                          </td>
                                          <td id="typeNearest" style="display:none" align="left">
                                            Nearest<input type=radio name="search" onclick="Nearest()">
                                          </td>
 
				</tr>
				<tr>
					<td  id="rtext" style="display:none">Radius(kms): </td>
					<td colspan=3><input style="display:none" type="textbox" id="Radius" name="Radius"/></td>
				</tr>
				<tr>
					<td  id="nntext" style="display:none">Number of Schools: </td>
					<td colspan=3><input style="display:none" type="textbox" id="Number_nearest" name="Number_nearest"/></td>
				</tr>
			</c:if>
				<tr>
				<td></td>
				<td class="button" align="left">
					<s:if test="RowCounter>0">
						<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/school_search/print.action</tui:url>&anwf=${anwf}')"/>
					</s:if>
					<s:else>
						<input type="button"	class="topdev_button_print" value="Drucken" disabled="true"/>
					</s:else>
				</td>
				<td class="button" colspan="4" align="right">
					<input type="hidden"	value="1"		name="page"/>
					<input type="hidden"	value=""		name="clear"/>
					<input type="button"	onclick="clearLocalForm('${ns}_form')"		value="Leeren"	class="portlet-form-button-line"/>
					<input type="submit"	value="Suchen" 	class="portlet-form-button"/>
				</td>
			</tr>
			</table>
		</td>
		<td class="map">

	<img src="<s:url value="/images/ci/karte_thueringen.gif" />" title="Thueringen-Karte"  border="0" usemap="#map" />
	<map name="map">

<area shape="poly" coords="89,1,122,4,129,36,76,46,47,73,38,80,7,55,13,35" 																																	alt="Worbis" 				title="Worbis" 				href="javascript:setSchulamt('Worbis', 24);" />
<area shape="poly" coords="129,37,168,46,170,94,143,95,143,109,133,106,131,100,122,100,111,113,107,107,115,80,106,72,96,76,69,54" 																			alt="Artern" 				title="Artern" 				href="javascript:setSchulamt('Artern', 2);" />
<area shape="poly" coords="37,84,59,94,80,104,59,132,82,158,95,158,117,129,110,114,103,107,109,78,89,77,69,59" 																								alt="Langensalza" 			title="Langensalza" 		href="javascript:setSchulamt('Bad Langensalza', 3);"  />
<area shape="poly" coords="37,87,72,104,51,147,31,160,37,173,13,167,8,172,2,175,10,116" 																													alt="Eisenach" 				title="Eisenach" 			href="javascript:setSchulamt('Eisenach', 4);" />
<area shape="poly" coords="59,139,84,165,93,163,101,186,72,182,69,205,52,214,10,189,13,174,40,176,39,162"																									alt="Schmalkalden" 			title="Schmalkalden" 		href="javascript:setSchulamt('Schmalkalden', 15);" />
<area shape="poly" coords="114,114,125,103,142,115,138,131,118,132" 																																		alt="Erfurt" 				title="Erfurt" 				href="javascript:setSchulamt('Erfurt', 5);" />
<area shape="poly" coords="142,146,162,147,177,153,171,161,177,178,187,184,175,190,169,210,161,205,164,193,157,193,146,198,133,189,120,190,107,178,104,180,95,164,98,149,104,149,112,132,134,128,143,147" 	alt="Rudolstadt"			title="Rudolstadt" 			href="javascript:setSchulamt('Rudolstadt', 14);" />
<area shape="poly" coords="77,185,110,191,146,204,161,211,148,240,119,232,106,224,104,244,89,247,67,228,60,218,76,205" 																						alt="Neuhaus" 				title="Neuhaus" 			href="javascript:setSchulamt('Neuhaus', 10);" />
<area shape="poly" coords="176,95,200,101,181,117,167,145,141,132,145,110,150,102" 																															alt="Weimar" 				title="Weimar" 				href="javascript:setSchulamt('Weimar', 22);"  />
<area shape="poly" coords="199,104,225,112,212,138,210,173,217,191,232,204,206,229,176,229,170,219,177,197,192,186,188,180,178,174,176,161,188,160,188,151,172,147,176,128,179,118,195,114" 				alt="Jena/ Stadtroda" 		title="Jena/ Stadtroda" 	href="javascript:setSchulamt('Jena/ Stadtroda', 27);" />
<area shape="poly" coords="231,115,216,133,216,150,213,172,220,186,268,190,282,155,297,132,294,87,252,81,250,105" 																							alt="Gera/Schm&ouml;lln"	title="Gera/Schm&ouml;lln" 	href="javascript:setSchulamt('Gera/Schm&ouml;lln', 28);" />
</map>

		</td>

	</tr>
</table>
