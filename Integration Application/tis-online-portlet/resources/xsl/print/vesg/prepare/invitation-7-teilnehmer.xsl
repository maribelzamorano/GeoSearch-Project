<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="root">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1.3cm" margin-left="1.8cm" margin-right="2cm">
		<fo:region-body margin-top="0.5cm" margin-bottom="1cm"/> 
		<fo:region-after extent="2.0cm"/>
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="simpleA4">
		
<!-- =================== Fuß ========================= -->
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block > 
   			<fo:table>
   				<fo:table-column column-width="13.0cm"/>
   					<fo:table-body>
	   					<fo:table-row>
							<fo:table-cell border-left="0.1pt #000000 solid" padding-left="10pt">						
		         				<fo:block font-size="8pt"  font-family="Helvetica">   
								    Das Staatliche Schulamt Frankfurt (Oder) gehört zum Geschäftsbereich des Ministeriums für Bildung, Jugend
									und Sport und ist regional zuständig für die Landkreise Märkisch-Oderland, Oder-Spree und die kreisfreie Stadt 
									Frankfurt (Oder).
							 </fo:block>
							</fo:table-cell>
						</fo:table-row>
   					</fo:table-body>
   			</fo:table> 		   		   		
   		</fo:block>
   </fo:static-content>
   
	<fo:flow flow-name="xsl-region-body" font-size="12pt">
	
<!-- =================== Kopf ========================= -->
	<fo:block padding-bottom="20pt">
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="12.6cm"/>
	            <fo:table-column column-width="6.0cm"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell >
								
								 <fo:table table-layout="fixed">   
						            <fo:table-column column-width="1.8cm"/>
						            <fo:table-column column-width="10.5cm"/>
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell >
														<fo:block >  
															<fo:external-graphic width="1.5cm">
																<xsl:attribute name="src"><xsl:value-of select="img_bb"/></xsl:attribute>
															</fo:external-graphic> 															
														</fo:block>
													</fo:table-cell>
													<fo:table-cell padding-top="15pt" >
														<fo:block font-size="16pt" font-weight="bold" font-family="Helvetica">  
															LAND BRANDENBURG
														</fo:block>
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell number-columns-spanned="2">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										 &#160;
									</fo:block>	
									<fo:block font-size="12pt" font-family="Helvetica">         					
										 &#160;
									</fo:block>	
									<fo:block font-size="8pt" font-family="Helvetica" >         					
									Staatliches Schulamt Frankfurt(Oder)&#160;&#160;|&#160;&#160;Ringstraße 1028&#160;&#160;|&#160;&#160;15236 Frankfurt (Oder)
									</fo:block>
									<fo:block font-size="6pt" font-family="Helvetica">         					
										 &#160;
									</fo:block>								         						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="Anrede"/><xsl:if test="Anrede='Herr'">n&#160;</xsl:if>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="PERS_TITEL"/><xsl:if test="Titel!=''">&#160;</xsl:if><xsl:value-of select="GEPA_NAME_2"/>&#160;<xsl:value-of select="GEPA_NAME_1"/>
									</fo:block>
									<xsl:if test="DIEN_NAME!=''">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="DIEN_NAME"/>
									</fo:block>
									</xsl:if>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="STRV"/>&#160;<xsl:value-of select="HAUSNR"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										 &#160;
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="PLZV"/>&#160;<xsl:value-of select="ORTV"/>
									</fo:block>
									</fo:table-cell>
									</fo:table-row>
								
								</fo:table-body>
							</fo:table>
						</fo:table-cell>
							
								<fo:table-cell>	
								<fo:block>
									<fo:table table-layout="fixed">     							
	           							 <fo:table-column column-width="1.6cm"/>
	           							 <fo:table-column column-width="4.1cm"/>
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell number-columns-spanned="2" border-left="0.1pt #000000 solid" padding-left="5pt" padding-bottom="0pt">		
														<fo:block font-size="12pt" font-family="Helvetica">         					
															&#160;
														</fo:block>						
								         				<fo:block font-size="12pt" font-weight="bold" font-family="Helvetica">         					
															Staatliches Schulamt
														</fo:block>	
														<fo:block font-size="12pt" font-weight="bold" font-family="Helvetica">         					
															Frankfurt (Oder)
														</fo:block>														
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell number-columns-spanned="2" >	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															 &#160;
														</fo:block>				
								         				<fo:block font-size="9pt" font-family="Helvetica">         					
															Ringstraße 1028
														</fo:block>
														<fo:block font-size="9pt" font-family="Helvetica" >         					
														15236 Frankfurt (Oder)
														</fo:block>
														<fo:block font-size="12pt" font-family="Helvetica">         					
															 &#160;
														</fo:block>	
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Bearb.:
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Frau Rückert-Foth
															</fo:block>	
														</fo:table-cell>
												</fo:table-row>	
												<fo:table-row>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Gesch-Z.: 
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																
															</fo:block>
														</fo:table-cell>
												</fo:table-row>	
												<fo:table-row>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Hausruf: 
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																0335/5210-510
															</fo:block>
														</fo:table-cell>
												</fo:table-row>	
												<fo:table-row>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Fax: 
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																0335/5210-411
															</fo:block>
														</fo:table-cell>
												</fo:table-row>																
												<fo:table-row>				
														<fo:table-cell number-columns-spanned="2" >	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															 &#160;
														</fo:block>	
															<fo:block language="en" hyphenate="true" hyphenation-remain-character-count="5" font-size="7pt" text-decoration="underline" font-family="Helvetica">         					
																bianka.rueckert@schulaemter.brandenburg.de
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell number-columns-spanned="2" >	
															<fo:block language="en" hyphenate="true" hyphenation-remain-character-count="5" font-size="8pt" font-family="Helvetica">         					
																Tram 3 und 4
															</fo:block>
														</fo:table-cell>
													</fo:table-row>
											</fo:table-body>
										</fo:table>
									</fo:block>
								</fo:table-cell>
						</fo:table-row>	
					</fo:table-body>
			</fo:table>
	</fo:block>
	
	
<!-- =================== Anschreiben ========================= -->
	
	<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="15.5cm"/>
					<fo:table-body>
					<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					<fo:table-row>
							<fo:table-cell >						
		         				<fo:block font-size="12pt" font-family="Helvetica" text-align="right">         					
									Frankfurt (Oder), <xsl:value-of select="Datum"/>
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
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-weight="bold" font-family="Helvetica">         					
									Bestätigung der Anmeldung/Einladung zur Veranstaltung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
			</fo:table>		
		</fo:block>				
		<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="3.7cm"/>
	            <fo:table-column column-width="11.5cm"/>
					<fo:table-body>									
						<fo:table-row>
						<fo:table-cell>						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Thema:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									<xsl:value-of select="PGPK_THEMA_1"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
						<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt" font-family="Helvetica">         					
									Veranstaltungs-Nr: 
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt" font-weight="bold" font-family="Helvetica">         					
									<xsl:value-of select="VESG_NR"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
						<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Termin:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="VESG_BEGINN"/>	
											<xsl:if test="VESG_BEGINN != VESG_ENDE"> bis <xsl:value-of select="VESG_ENDE"/>	</xsl:if>
											&#160;Beginn:&#160; <xsl:value-of select="VESG_BEGINN_ZEIT"/>&#160;Uhr&#160;&#160;&#160; 	Ende:&#160; <xsl:value-of select="VESG_ENDE_ZEIT"/>&#160;Uhr
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
						<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Ort:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="LGOB_NAME"/>, <xsl:value-of select="LGOB_STRASSE"/>, <xsl:value-of select="PLZ_LGOB"/>&#160;<xsl:value-of select="LGOB_ORT"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
						<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Referent/in:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										<xsl:value-of select="VESG_REFERENTEN"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
			</fo:table>		
		</fo:block>	
		<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="15.0cm"/>
					<fo:table-body>							
						<fo:table-row>
							<fo:table-cell padding-top="10pt">						
		         				<fo:block font-size="11pt" text-decoration="underline" font-family="Helvetica">         					
									Verfahrensweg:
								</fo:block>
							</fo:table-cell>
						</fo:table-row>						
					</fo:table-body>
				</fo:table>
		</fo:block>	
		<fo:block>
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="2.0cm"/>
	            <fo:table-column column-width="13.5cm"/>
					<fo:table-body>			
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" padding-left="0.6cm" padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										1.&#160;&#160;&#160;Fortbildungsantrag stellen:									
								</fo:block>
								</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-left="0.5cm" padding-top="1pt">
								<fo:block margin-left="1.3cm" font-size="11pt"  font-family="Helvetica">         					
											-									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="0.3cm" padding-top="1pt">
								<fo:block  font-size="11pt"  font-family="Helvetica">         					
											über Schulleitung an das staatliche Schulamt. 									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" padding-left="0.6cm">							
								<fo:block font-size="11pt"  font-family="Helvetica">         					
											Mit Bestätigung des Antrags gilt diese Einladung als verbindlich. 										
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" padding-left="0.6cm" padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										2.&#160;&#160;&#160;Die Antragsstellung erübrigt sich wenn:									
								</fo:block>
								</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-left="0.5cm" padding-top="1pt">
								<fo:block margin-left="1.3cm" font-size="11pt"  font-family="Helvetica">         					
											-									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="0.3cm" padding-top="1pt">
								<fo:block  font-size="11pt"  font-family="Helvetica">         					
											auf Kostenerstattung verzichtet wird oder kein Erstattungsanspruch besteht.  									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-left="0.5cm" padding-top="1pt">
								<fo:block margin-left="1.3cm" font-size="11pt"  font-family="Helvetica">         					
											-									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="0.3cm" padding-top="1pt">
								<fo:block  font-size="11pt"  font-family="Helvetica">         					
											dienstliche Interessen der Teilnahme nicht entgegen stehen.	 									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" padding-left="0.6cm" padding-top="1pt">							
								<fo:block font-size="11pt"  font-family="Helvetica">         					
											In diesen Fällen gilt diese Bestätigung  als verbindliche Einladung.										
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" padding-left="0.6cm" padding-top="10pt">						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										3.&#160;&#160;&#160;Mitteilungspflicht:								
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell padding-left="0.5cm" padding-top="1pt">	
								<fo:block margin-left="1.3cm" font-size="11pt"  font-family="Helvetica">         					
											-
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="0.3cm" padding-top="1pt">	
								<fo:block language="en" hyphenate="true" font-size="11pt"  font-family="Helvetica">         					
											Bei Nichtteilnahme, bitte bis spätestens 4 Werktage vor Veranstaltungsbeginn abmelden!
								</fo:block>
							</fo:table-cell>
						</fo:table-row>								
					</fo:table-body>
			</fo:table>
		</fo:block>			
		<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="15.0cm"/>
					<fo:table-body>	
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
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="11pt"  font-family="Helvetica">         					
										Dieses Schreiben wurde elektronisch erstellt und ist auch ohne Unterschrift gültig.
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