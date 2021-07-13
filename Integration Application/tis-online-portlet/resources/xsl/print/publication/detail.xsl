<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  	<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
	<xsl:template match="publication_detail">
		<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
			<fo:layout-master-set>
				<fo:simple-page-master 	master-name="normalPage"
										page-height="29.7cm"
	        							page-width="21cm"
	        							margin-left="1cm"
	        							margin-right="1cm"
	        							margin-top="1cm"
	        							margin-bottom="1cm">
					<fo:region-before extent="3cm"/>
					<fo:region-after extent="1cm"/>
					<fo:region-body margin-top="1.5cm" margin-bottom="2cm" />
				</fo:simple-page-master>
				<fo:page-sequence-master master-name="contents">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="normalPage"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
			</fo:layout-master-set>
        
        
        
<!-- ################ HEADER #################################-->
			<fo:page-sequence master-reference="contents" initial-page-number="1">
				<fo:static-content flow-name="xsl-region-before">
					<fo:block font-family="Helvetica" font-size="10pt" text-align="center"  padding-bottom="10pt">
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
											<fo:block text-align="center" font-size="10pt" font-weight="bold"><xsl:value-of select="TITEL"/></fo:block>
											<fo:block color="white" font-size="8pt">|</fo:block>
											<fo:block color="white" font-size="6.5pt">|</fo:block>
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
					</fo:block>
				</fo:static-content>	

				<fo:static-content flow-name="xsl-region-after">
				    <fo:block font-family="Helvetica" font-size="10pt" text-align="center">
						<xsl:value-of select="PRINT_PAGE"/><fo:page-number/>
					</fo:block>
				</fo:static-content>

				<fo:flow flow-name="xsl-region-body">
					
					<fo:block>
						<fo:table table-layout="fixed" font-size="10pt">
							<fo:table-column column-width="14.5cm"/>
							<fo:table-body>
								<fo:table-row>										
									<fo:table-cell padding-bottom="10pt">
										<fo:block font-weight="bold" font-size="14pt">
											<xsl:value-of select="titel"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-bottom="10pt">
										<fo:block>
											<xsl:value-of select="untertitel"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-bottom="10pt" >
										<fo:block>
											<xsl:value-of select="PUBL_ANNOTATION"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
				
					<fo:block>
						<fo:table table-layout="fixed" font-size="10pt" border="0.1pt #000000 solid">
							<fo:table-column column-width="4cm"/>
							<fo:table-column column-width="10.5cm"/>
							<fo:table-body>
								<fo:table-row >										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUKA_BEZEICHNUNG"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUKA_BEZEICHNUNG"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_XSTICHWORT"/>
										</fo:block>
									</fo:table-cell>
										<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_XSTICHWORT"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_XSCHULART"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell  padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_XSCHULART"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-ATOR_NAME_1"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="ATOR_NAME_1"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-GEPA_XNAME_12"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="GEPA_XNAME_12"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-HRSG_NAME_1"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="HRSG_NAME_1"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_DT_HERAUSGABE"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" >
										<fo:block>
											<xsl:value-of select="PUBL_DT_HERAUSGABE"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block>
						<fo:table table-layout="fixed" font-size="10pt">
							<fo:table-column column-width="4cm"/>
							<fo:table-column column-width="4cm"/>
							<fo:table-column column-width="3.5cm"/>
							<fo:table-column column-width="3cm"/>
							<fo:table-body>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border-left="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_AUFLAGENSTAERKE"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border-left="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_AUFLAGENSTAERKE"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border-left="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_AUFLAGENNUMMER"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border-left="0.01pt #000000 solid" border-right="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_AUFLAGENNUMMER"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_HEFTNUMMER"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_HEFTNUMMER"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_SEITENZAHL"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_SEITENZAHL"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_ISBN"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_ISBN"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_ISSN"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_ISSN"/>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>										
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_BESTELLNUMMER"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_BESTELLNUMMER"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="LABEL-PUBL_PREIS"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding-top="2pt" padding-left="5pt" border="0.01pt #000000 solid">
										<fo:block>
											<xsl:value-of select="PUBL_PREIS"/> 
											<fo:inline font-weight="normal"> EUR</fo:inline>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
					
					<fo:block padding-top="15pt" font-size="8pt">
						<xsl:value-of select="KZ_LIEFERBAR"/>
					</fo:block>					
 					<xsl:apply-templates select="anlagen"/> 
				</fo:flow>
			</fo:page-sequence>	
		</fo:root>
	</xsl:template>
	
	
    <xsl:template match="anlagen">
	  	<fo:block padding-top="15pt" font-size="12pt">Anlagen</fo:block>
	  	
	  	<fo:block padding-top="10pt">
			<fo:table table-layout="fixed" font-size="10pt">
				<fo:table-column column-width="2cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="7cm"/>
				<fo:table-column column-width="3cm"/>
				<fo:table-body>
						<fo:table-row>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
									<fo:block font-size="10pt">
										Typ
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
									<fo:block font-size="10pt">
										Gruppe
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
									<fo:block>
										Titel
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
									<fo:block>
										Beschreibung
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
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
			<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
				<fo:block language="en" hyphenate="true">
					<xsl:value-of select="typ"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
				<fo:block language="en" hyphenate="true">
					<xsl:value-of select="gruppe"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="5pt"  table-layout="fixed" border="0.01pt #000000 solid">
				<fo:block language="en" hyphenate="true">
					<xsl:value-of select="titel"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="5pt" table-layout="fixed" border="0.01pt #000000 solid">
				<fo:block language="en" hyphenate="true">
					<xsl:value-of select="beschreibung"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-right="4pt" padding-left="5pt" table-layout="fixed" border="0.01pt #000000 solid">
				<fo:block language="en" hyphenate="true" text-align="right">
					<xsl:value-of select="groesse"/>
				</fo:block>
			</fo:table-cell>
	</fo:table-row>
  </xsl:template>  
	
	
	
</xsl:stylesheet>



