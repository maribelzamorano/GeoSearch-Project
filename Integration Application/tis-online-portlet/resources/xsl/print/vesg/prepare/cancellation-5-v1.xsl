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
		
<!-- =================== Fu� ========================= -->
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block > 
   			<fo:table>
   				<fo:table-column column-width="13.0cm"/>
   					<fo:table-body>
	   					<fo:table-row>
							<fo:table-cell border-left="0.1pt #000000 solid" padding-left="10pt">						
		         				<fo:block font-size="8pt"  font-family="Helvetica">   
								    Das Staatliche Schulamt Brandenburg an der Havel geh�rt zum Gesch�ftsbereich des Ministeriums f�r Bildung, Jugend
									und Sport und ist regional zust�ndig f�r die Landkreise Havelland, Potsdam-Mittelmark und die kreisfreien St�dte Brandenburg an der Havel und Potsdam.

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
									<fo:block font-size="12pt" font-family="Helvetica">         					
										 &#160;
									</fo:block>	
									<fo:block font-size="7pt" font-family="Helvetica" >         					
									Staatliches Schulamt Brandenburg an der Havel&#160;|&#160;Magdeburger Stra�e 45 &#160;|&#160;14770 Brandenburg a.d.H
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
															Brandenburg an der Havel
														</fo:block>														
													</fo:table-cell>
												</fo:table-row>
												<fo:table-row>
													<fo:table-cell number-columns-spanned="2" >	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															&#160;
														</fo:block>	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															&#160;
														</fo:block>															
								         				<fo:block font-size="9pt" font-family="Helvetica">         					
															Magdeburger Stra�e 45
														</fo:block>
														<fo:block font-size="9pt" font-family="Helvetica" >         					
														14770 Brandenburg an der Havel
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
																Frau Jasch
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
																Telefon: 
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																(03381)&#160;7930&#160;124
															</fo:block>
														</fo:table-cell>
												</fo:table-row>	
												<fo:table-row>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																Telefax: 
															</fo:block>
														</fo:table-cell>
														<fo:table-cell>	
															<fo:block font-size="9pt" font-family="Helvetica">         					
																(03381)&#160;3974&#160;44
															</fo:block>
														</fo:table-cell>
												</fo:table-row>																
												<fo:table-row>				
														<fo:table-cell number-columns-spanned="2" >	
														<fo:block font-size="12pt" font-family="Helvetica">         					
															 &#160;
														</fo:block>	
															<fo:block language="en" hyphenate="true" hyphenation-remain-character-count="5" font-size="9pt" text-decoration="underline" font-family="Helvetica">         					
																www.brandenburg.de
															</fo:block>
															<fo:block language="en" hyphenate="true" hyphenation-remain-character-count="5" font-size="8pt" text-decoration="underline" font-family="Helvetica">         					
																kerstin.jasch@schulaemter.brandenburg.de
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
									Brandenburg an der Havel, <xsl:value-of select="Datum"/>
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
									leider muss ich Ihnen mitteilen, dass die Fortbildung
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
									nicht stattfindet.
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
									Bez�glich eines neuen Termins oder �hnlicher Angebote informieren Sie sich bitte im Veranstaltungskatalog im Internet (FortbildungsNetz).
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
									Mit freundlichen Gr��en
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
										Dieses Schreiben wurde elektronisch erstellt und ist auch ohne Unterschrift g�ltig.										
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