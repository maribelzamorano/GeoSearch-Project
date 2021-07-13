<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="detail">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body" font-size="10pt">
        
        
        
<!-- ################ HEADER #################################-->

<fo:table table-layout="fixed" border="0.1pt #000000 solid" font-size="8pt">
			<fo:table-column column-width="5cm"/>
			<fo:table-column column-width="9cm"/>
			<fo:table-column column-width="5cm"/>
			<fo:table-body>
				<fo:table-row>
					<fo:table-cell padding-left="3pt" padding-top="3pt" padding-bottom="3pt">
						<fo:block text-align="left"><xsl:value-of select="repko_01l"/></fo:block>
						<fo:block text-align="left"><xsl:value-of select="repko_02l"/></fo:block>
						<fo:block text-align="left"><xsl:value-of select="repko_03l"/></fo:block>
					</fo:table-cell>
					<fo:table-cell>
						<fo:block  border-left="0.1pt #000000 solid"  border-right="0.1pt #000000 solid"  padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="center" font-size="10pt" font-weight="bold">Katalog - Detailansicht</fo:block>
							<fo:block color="white" font-size="6pt">|</fo:block>
							<fo:block color="white" font-size="6pt">|</fo:block>
						</fo:block>
					</fo:table-cell>
					<fo:table-cell padding-right="3pt" padding-top="3pt" padding-bottom="3pt">
						<fo:block text-align="right"><xsl:value-of select="repko_01r"/></fo:block>
						<fo:block text-align="right"><fo:inline color="white">|</fo:inline><xsl:value-of select="repko_02r"/></fo:block>
						<fo:block text-align="right"><xsl:value-of select="datum"/></fo:block>
					</fo:table-cell>
				</fo:table-row>
			</fo:table-body>
		</fo:table>
        
        
<!-- ################ BODY #################################-->

				<fo:block padding-top="10pt" text-align="left" font-size="14pt" font-weight="bold">
					<xsl:value-of select="vesg_thema_anzeige"/>
				</fo:block>
				<fo:block padding-top="10pt"><xsl:value-of select="pgpk_beschreibung"/></fo:block>
				
				<fo:block padding-top="15pt" font-size="12pt">Details zur Veranstaltung</fo:block>

<!-- ################ Tabelle 1 #################################-->
			
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-body>
								<xsl:apply-templates select="hinweis"/>
								<xsl:apply-templates select="teilnehmer"/>
								<xsl:apply-templates select="schulart"/>
								<xsl:apply-templates select="anbieter"/>
								<xsl:apply-templates select="anmelden"/>
								<xsl:apply-templates select="dozent"/>	
						</fo:table-body>
					</fo:table>
				</fo:block>
				
<!-- ################  Tabelle 2 #################################-->

				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed" border="0.1pt #000000 solid">
						<fo:table-column column-width="18cm"/>
						<fo:table-column column-width="1cm"/>
						<fo:table-body>
								<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt">
											<fo:block>
												<fo:inline>
													<xsl:value-of select="pgpk_thema_1"/>
													<xsl:value-of select="pgpk_thema_2"/>
													<xsl:value-of select="pgpk_thema_3"/>
												</fo:inline>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt">
											<fo:block>
												&#160;
											</fo:block>
										</fo:table-cell>
								</fo:table-row>
								
						</fo:table-body>
					</fo:table>
				</fo:block>

<!-- ################  Tabelle 3 #################################-->

				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed" border="0.1pt #000000 solid">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="8cm"/>
						<fo:table-column column-width="7cm"/>
						<fo:table-body>
								<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>Veranstaltungs-Nr.:
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
												<xsl:value-of select="vesg_nr"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
												<xsl:value-of select="VESG_KZ_DIENST_AAO_DECODE"/>
											</fo:block>
										</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>Termin:
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
													<xsl:value-of select="vesg_termin"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>
													<xsl:value-of select="vesg__beginn_zeit"/>
											</fo:block>
										</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>Ort:
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
												<xsl:value-of select="vesg_ort"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt #000000 solid">
										</fo:table-cell>
								</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>Leitung:
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
												<xsl:value-of select="vesg_leitung"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt #000000 solid">
										</fo:table-cell>
								</fo:table-row>
									<fo:table-row>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block>Anmeldeschluß:
											</fo:block>
										</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
											<fo:block >
												<xsl:value-of select="vesg_anmeldeschluss"/>
											</fo:block>
										</fo:table-cell>
										<fo:table-cell border="0.1pt #000000 solid">
										</fo:table-cell>
								</fo:table-row>
									
								<xsl:apply-templates select="URL_TEXT"/>
									
								
						</fo:table-body>
					</fo:table>
				</fo:block>
				
<!-- ################  Tabelle 4 #################################-->
<xsl:apply-templates select="weitere_vesg"/>					
<xsl:apply-templates select="anlagen"/>					
<!-- ################ / BODY #################################-->				
	</fo:flow>
   </fo:page-sequence>
  </fo:root>
 </xsl:template>
 
<!-- ################ / TEMPLATES #################################-->

 <xsl:template match="URL_TEXT">
 			<fo:table-row>
				<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
					<fo:block>URL:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.1pt #000000 solid">
					<fo:block >
						<xsl:value-of select="PGPK_URL_TEXT"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0.1pt #000000 solid">
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>

 
 <xsl:template match="hinweis">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Hinweis:</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt" white-space-collapse='false'>
						<xsl:value-of select="pgpk_hinweis"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>
  
  <xsl:template match="teilnehmer">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Teilnehmer:</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt">
						<xsl:value-of select="pgpk_teilnehmerkreis"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>

  <xsl:template match="schulart">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Schulart(en):</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt">
						<xsl:value-of select="PGPK_SCHULARTEN"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>

  <xsl:template match="anbieter">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Anbieter:</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt">
						<xsl:value-of select="MAND_BESCHREIBUNG"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>
  
  <xsl:template match="anmelden">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Anmeldung an:</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt">
						<xsl:value-of select="pgpk_anmeldung_an"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>

  <xsl:template match="dozent">
 			<fo:table-row>
				<fo:table-cell padding-bottom="10pt">
					<fo:block font-style="italic">Dozenten:</fo:block>
				</fo:table-cell>
				<fo:table-cell padding-bottom="10pt">
					<fo:block padding-left="50pt">
						<xsl:value-of select="vesg_referenten"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
  </xsl:template>
  
  
  
  
  
  
    <xsl:template match="weitere_vesg">
	  	<fo:block padding-top="15pt" font-size="12pt">Weitere Veranstaltungen zu dieser Maßnahme </fo:block>
	  	<fo:block padding-top="10pt">
			<fo:table>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="7cm"/>
				<fo:table-column column-width="8cm"/>
				<fo:table-body>
						<fo:table-row>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block >
										Veranstaltungs-Nr.
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block>
										Termin
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block>
										Ort
									</fo:block>
								</fo:table-cell>
						</fo:table-row>
							<xsl:apply-templates select="weitere"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
   </xsl:template>
 
  
  
  
  
  
  <xsl:template match="weitere">

					<fo:table-row>
							<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="weitere_nr"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="weitere_termin"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="5pt" table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="weitere_ort"/>
								</fo:block>
							</fo:table-cell>
					</fo:table-row>
  </xsl:template>
  
  
  
    <xsl:template match="anlagen">
	  	<fo:block padding-top="15pt" font-size="12pt">Anlagen</fo:block>
	  	<fo:block padding-top="10pt">
			<fo:table>
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="7cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-body>
						<fo:table-row>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block>
										Typ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block >
										Gruppe
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block>
										Titel
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block>
										Beschreibung
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
									<fo:block text-align="right">
										Größe (Byte)
									</fo:block>
								</fo:table-cell>
						</fo:table-row>
							<xsl:apply-templates select="anlage"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
   </xsl:template>
  
  <xsl:template match="anlage">
					<fo:table-row>
							<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="typ"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="gruppe"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="titel"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="5pt" table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block>
									<xsl:value-of select="beschreibung"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-right="4pt" padding-left="5pt" table-layout="fixed" border="0.1pt #000000 solid">
								<fo:block text-align="right">
									<xsl:value-of select="groesse"/>
								</fo:block>
							</fo:table-cell>
					</fo:table-row>
  </xsl:template>  
  
  
 
</xsl:stylesheet>
