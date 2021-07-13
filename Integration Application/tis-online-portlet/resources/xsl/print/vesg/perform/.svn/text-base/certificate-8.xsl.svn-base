<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1.3cm" margin-left="1.8cm" margin-right="2cm">
		<fo:region-body margin-top="0.5cm" margin-bottom="3.0cm"/> 
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
	<fo:block padding-bottom="100pt">
		<xsl:for-each select="Teilnehmer">
		 <fo:table table-layout="fixed" >   
	            <fo:table-column column-width="12.7cm"/>
	            <fo:table-column column-width="6.0cm"/>
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
									<xsl:value-of select="Titel"/><xsl:if test="Titel != ''">&#160;</xsl:if><xsl:value-of select="Vorname"/>&#160;<xsl:value-of select="Name"/>
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
																<fo:inline language="en" hyphenate="true" font-size="9pt" text-decoration="underline">daniela.kukatschka@schulaemter.brandenburg.de</fo:inline>
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
	
	
<!-- =================== Teilnahmebestaetigung ========================= -->
	
		 <fo:table table-layout="fixed" height="15.0cm">   
		 	
	            <fo:table-column column-width="5.0cm"/>
	            <fo:table-column column-width="9.5cm"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2" >						
		         				<fo:block font-size="12pt" font-family="Helvetica" text-align="right">         					
									Perleberg, <xsl:value-of select="Datum"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="16pt" text-align="center" font-family="Helvetica" font-weight="bold">         					
									TEILNAHMEBESTÄTIGUNG
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="Anrede"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="Titel"/><xsl:if test="Titel != ''">&#160;</xsl:if><xsl:value-of select="Vorname"/>&#160;<xsl:value-of select="Name"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell >
							<fo:block font-size="12pt" font-family="Helvetica" >         					
									Einrichtung:
								</fo:block>						     																											
							</fo:table-cell>
							<fo:table-cell>	
							<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="DIEN_NAME"/>
								</fo:block>						     																		
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									hat <xsl:if test="Beginn = Ende">am: </xsl:if>
									<xsl:if test="Beginn != Ende">vom: </xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="Beginn"/> <xsl:if test="Beginn != Ende">&#160;bis: </xsl:if> <xsl:if test="Beginn != Ende"><xsl:value-of select="Ende"/></xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									im Umfang von:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:if test="VESG_DAUER != '0'"><xsl:value-of select="VESG_DAUER"/>&#160;</xsl:if>Fortbildungsstunden
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									an der Veranstaltung:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-weight="bold">         					
									<xsl:value-of select="Thema"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-weight="bold">         					
									<xsl:value-of select="Veranstalungsnummer"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									teilgenommen.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:if test="REFE_ANREDE = 'Frau'">Dozentin:</xsl:if>
									<xsl:if test="REFE_ANREDE = 'Herr'">Dozent:</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="REFERENT"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									Veranstaltungsort:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="VGPO_GEPA_NAME_1"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									Im Auftrag
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>	
			</fo:table>		
		</xsl:for-each>
	</fo:block>
</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>
</xsl:stylesheet>