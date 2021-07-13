<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="root">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0.5cm" margin-left="2cm" margin-right="2cm">
		<fo:region-body margin-top="1cm" margin-bottom="1cm"/> 
   		<fo:region-after extent="1.0cm"/>
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		
	
<fo:page-sequence master-reference="simpleA4" >
		
		
<!-- =================== Fußbereich =======================  -->
	
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block  padding-top="5pt" text-align="center" font-size="8pt"> 
   		   		Seite <fo:page-number/> von <fo:page-number-citation ref-id="last_page"/>   		
   		</fo:block>
   </fo:static-content>
   

<fo:flow flow-name="xsl-region-body" font-size="11pt">	
<!-- =================== Adresse ========================= -->


	<fo:block padding-bottom="20pt">
		 <fo:table table-layout="fixed" >   
	            <fo:table-column column-width="8.5cm"/>
					<fo:table-body>
						<fo:table-row height="4cm">
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="Anrede"/><xsl:if test="Anrede='Herr'">n&#160;</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" > 
		         					<xsl:if test="PERS_TITEL!=''">        					
										<xsl:value-of select="PERS_TITEL"/>&#160;
									</xsl:if>
									<xsl:value-of select="GEPA_NAME_2"/>&#160;<xsl:value-of select="GEPA_NAME_1"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
			<!-- =================== Adresse dienstlich ========================= -->
					<xsl:choose>
				  <xsl:when test="privat='0'">
				  		<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="Dienststelle"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				  		<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="StrasseDienst"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="PLZdienst"/>&#160;<xsl:value-of select="Ortdienst"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
								
			<!-- =================== Adresse privat ========================= -->			
					</xsl:when>
					<xsl:otherwise>							
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="STRV"/>&#160;<xsl:value-of select="HAUSNR"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="PLZV"/>&#160;<xsl:value-of select="ORTV"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:otherwise>
				 </xsl:choose>		
				
					</fo:table-body>
			</fo:table>
	</fo:block>
	
	


<!-- =================== Anschreiben ========================= -->
	
	<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
					<fo:table-row>
							<fo:table-cell >						
		         				<fo:block font-size="11pt" font-family="Helvetica" text-align="right">         					
									<xsl:value-of select="Datum"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
			</fo:table> 	
						

	<fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>		 	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									Einladung - für Dozenten&#160;<xsl:value-of select="PGPK_THEMA_1"/><xsl:value-of select="PGPK_THEMA_2"/><xsl:value-of select="PGPK_THEMA_3"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Sehr geehrte<xsl:if test="Anrede='Herr'">r</xsl:if>&#160;<xsl:value-of select="Anrede"/>&#160;<xsl:value-of select="PERS_TITEL"/><xsl:if test="PERS_TITEL!=''">&#160;</xsl:if><xsl:value-of select="GEPA_NAME_1"/>,
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
												
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									hiermit lade ich Sie zur o.g. Veranstalung herzlich ein, die Zustimmung Ihres Schulleiters/ Schulamtsleiters vorausgesetzt.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
			</fo:table>		
	
	
		 <fo:table table-layout="fixed" margin-left="10pt" >   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
					<fo:table-row>
							<fo:table-cell padding-left="1.5cm" >						
		         				<fo:block >         					
									
								
	 	<fo:table table-layout="fixed" padding-top="10pt" padding-bottom="10pt"  padding-right="0pt" border-bottom="0pt #cccccc solid" border-top="0pt #aaaaaa solid" border-right="0pt #aaaaaa solid" border-left="0pt #aaaaaa solid">  
	 	   
	            <fo:table-column column-width="4.5cm"/>
				<fo:table-column column-width="9.5cm"/>
					<fo:table-body>			
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Termin:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="VESG_BEGINN"/>	
											<xsl:if test="VESG_BEGINN != VESG_ENDE"> bis <xsl:value-of select="VESG_ENDE"/>									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Beginn:&#160; <xsl:value-of select="VESG_BEGINN_ZEIT"/>&#160;Uhr&#160;&#160;&#160; 	Ende:&#160; <xsl:value-of select="VESG_ENDE_ZEIT"/>&#160;Uhr
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="8pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="8pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Ort:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="LGOB_NAME"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="LGOB_STRASSE"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="PLZ_LGOB"/>&#160;<xsl:value-of select="LGOB_ORT"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="LGOB_TELEFON"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="8pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="8pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Lehrgangsleitung:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="VESG_LEITUNG"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Referent:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="VESG_REFERENTEN"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<!--  <fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Programm/Ablauf:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="Programm"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>  -->
					</fo:table-body>
				</fo:table>
			
				</fo:block>
				</fo:table-cell>
			</fo:table-row>	
			</fo:table-body>
		</fo:table>
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									Reisekosten / Verpflegung / Unterkunft
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									1.Variante: mehrtägige Veranstaltung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Verpflegung und Unterkunft (in der Regel in Doppelzimmern) werden amtlich bereitgestellt. Fahrkosten werden nach den Bestimmungen des Thüringer Reisekostengesetzes erstattet.
							Teilnehmer, die in ihrer Anmeldung um Übernachtung gebeten haben, erhalten diese in der Regel in Doppelzimmern.

								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									2.Variante: eintägige Veranstaltung mit Mittagessen
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Amtliche Verpflegung wird bereitgestellt. Fahrkosten werden nach den Bestimmungen des Thüringer Reisekostengesetzes erstattet.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									3.Variante: eintägige Veranstaltung ohne Verpflegung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Reisekosten werden nach den Bestimmungen des Thüringer Reisekostengesetzes erstattet.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					<fo:table-row>
							<fo:table-cell >						
		         				<fo:block font-size="11pt" font-family="Helvetica" text-align="right">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
				</fo:table-body>
			</fo:table>
			
<!-- Teilnehmer angemeldet oder einzuladen -->			
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
										
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									<xsl:if test="Angemeldet='1'"> Mit der Zustimmung Ihres Schulleiters/Schulamtsleiters zur Teilnahme o. a. Fortbildung sind Sie für die Veranstaltung abgeordnet.</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
			</fo:table> 	
			
<!-- ENDE Teilnehmer angemeldet oder einzuladen -->			
	<fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
										
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Auf Grundlage des Thüringer Reisekostengesetzes/Thüringer Trennungsgeldverordnung erhalten Sie auf Antrag die Ihnen entstandenen Mehraufwendungen erstattet. Bitte bringen Sie die notwendigen Angaben (Konto-Nr., BLZ) mit, um vollständig abrechnen zu können.
Sollte aus zwingenden Gründen eine Teilnahme bzw. die Nutzung der vorgesehenen Unterkunft nicht möglich sein, ist eine <fo:inline text-decoration="underline">rechtzeitige </fo:inline>schriftliche Mitteilung erforderlich, damit eventuell notwendige Stornierungen vorgenommen werden können.
Bei unentschuldigtem Fernbleiben werden Sie an den Lehrgangskosten, insbesondere den Storno¬gebühren des Hotels beteiligt. Ich bitte um Verständnis dafür, da Haushaltsmittel verantwortungsvoll und sparsam verwendet werden müssen.
									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Für Teilnehmer, die keine Landesbedienstete sind, wird die vom ThILLM bereitgestellte Unterkunft und Verpflegung in der Regel gegenüber der Beschäftigungsstelle in Rechnung gestellt. Fahrtkosten werden vom ThILLM nicht erstattet.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Ich wünsche Ihnen eine angenehme Anreise* und einen erfolgreichen Verlauf der Veranstaltung.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Mit freundlichen Grüßen
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Im Auftrag
								</fo:block>
							</fo:table-cell>
						</fo:table-row>		
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="REFERENT"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="10pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  text-align="center" font-family="Helvetica">         					
									<!-- <fo:external-graphic content-width="30mm" content-height="11mm">
										<xsl:attribute name="src"><xsl:value-of select="./img_anfahrt"/></xsl:attribute>
									</fo:external-graphic> -->
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
			</fo:table> 			
			<fo:table table-layout="fixed">   
	            <fo:table-column column-width="17cm"/>
					<fo:table-body>
					
										
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									*Anmerkung: Bitte reisen Sie möglichst mit öffentlichen Verkehrsmittel an, da auf dem ThILLM-Gelände keine Parkmöglichkeit besteht.
						<fo:block id="last_page"></fo:block>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						
				</fo:table-body>
			</fo:table> 	
	</fo:block>
</fo:flow>


	


			
		</fo:page-sequence>
	</fo:root>
</xsl:template>

</xsl:stylesheet>