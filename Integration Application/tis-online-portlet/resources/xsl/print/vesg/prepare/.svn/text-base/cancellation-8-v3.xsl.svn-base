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
   				<fo:table-column column-width="15.0cm"/>
   					<fo:table-body>
	   					<fo:table-row>
							<fo:table-cell border-left="0.1pt #000000 solid" padding-left="10pt">						
		         				<fo:block font-size="8pt"  font-family="Helvetica">   
								    Das Staatliche Schulamt Perleberg gehört zum Geschäftsbereich des Ministeriums für Bildung, Jugend
									und Sport und ist regional zuständig für die Landkreise Oberhavel, Ostprignitz-Ruppin und Prignitz.
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
	            <fo:table-column column-width="12.9cm"/>
	            <fo:table-column column-width="5.8cm"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell >
								
								 <fo:table table-layout="fixed">   
						            <fo:table-column column-width="1.8cm"/>
						            <fo:table-column column-width="11.1cm"/>
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
									Staatliches Schulamt Perleberg&#160;&#160;|&#160;&#160;Postfach 23&#160;&#160;|&#160;&#160;19341 Perleberg
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
	           							 <fo:table-column column-width="4.0cm"/>
											<fo:table-body>
												<fo:table-row>
													<fo:table-cell height="1.6cm" number-columns-spanned="2" border-left="0.1pt #000000 solid" padding-left="5pt" padding-bottom="0pt">		
														<fo:block font-size="12pt" font-family="Helvetica">         					
															&#160;
														</fo:block>						
								         				<fo:block font-size="12pt" font-weight="bold" font-family="Helvetica">         					
															Staatliches Schulamt
														</fo:block>															
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell number-columns-spanned="2" >	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															 &#160;
														</fo:block>				
								         				<fo:block font-size="9pt" font-family="Helvetica">         					
															Berliner Straße 49
														</fo:block>
														<fo:block font-size="9pt" font-family="Helvetica" >         					
															19348 Perleberg
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
															<fo:block width="1.0cm" font-size="9pt" font-family="Helvetica">         					
																Frau Kukacka
																
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
																15.11/Kuk
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
																(03876) 713-8121 
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
																(03876) 713-8185
															</fo:block>
														</fo:table-cell>
												</fo:table-row>	
												<fo:table-row>
														<fo:table-cell number-columns-spanned="2" >	
															<fo:block language="en" hyphenate="true" font-size="9pt" text-decoration="underline" font-family="Helvetica">         					
																&#160;
															</fo:block>
														</fo:table-cell>
													</fo:table-row>															
												<fo:table-row>
														
														<fo:table-cell number-columns-spanned="2">	
															<fo:block  language="en" hyphenate="true" font-size="9pt" font-family="Helvetica">         					
																<fo:inline language="en" hyphenate="true" font-size="8pt" text-decoration="underline">daniela.kukatschka@schulaemter.brandenburg.de</fo:inline>
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
	            <fo:table-column column-width="13.0cm"/>
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
									Perleberg, <xsl:value-of select="Datum"/>
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
									Sehr geehrte<xsl:if test="Anrede='Herr'">r</xsl:if>&#160;<xsl:value-of select="Anrede"/>&#160;<xsl:value-of select="PERS_TITEL"/><xsl:if test="PERS_TITEL!=''">&#160;</xsl:if><xsl:value-of select="GEPA_NAME_1"/>,
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
												
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									leider muss ich Ihnen mitteilen, dass die Fortbildungsveranstaltung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block margin-left="3.8cm" font-size="12pt" font-weight="bold" font-family="Helvetica">         					
									<xsl:value-of select="PGPK_THEMA_1"/>&#160;<xsl:value-of select="PGPK_THEMA_2"/>&#160;<xsl:value-of select="PGPK_THEMA_3"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Veranstaltungs-Nr.: &#160;<fo:inline font-weight="bold" ><xsl:value-of select="VESG_NR"/></fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									auf einen anderen Termin verlegt wird.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Leider ist aus technischen Gründen Ihrerseits eine Neuanmeldung erforderlich. Sobald Zeitpunkt und Ort der Veranstaltung feststehen, werden Sie durch mich informiert, damit Sie sich dann selbst im FortbildungsNetz unter <fo:inline text-decoration="underline">www.bildung-brandenburg/fortbildungsnetz</fo:inline> erneut anmelden können.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Über einen neuen Termin bei Wiederholung dieser Fortbildungsveranstaltung informieren Sie sich bitte im Veranstaltungskatalog im Internet (FortbildungsNetz). 
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Mit freundlichen Grüßen
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Im Auftrag
								</fo:block>
							</fo:table-cell>
						</fo:table-row>		
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica" >         					
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