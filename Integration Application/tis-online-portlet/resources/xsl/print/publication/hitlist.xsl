<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
<xsl:template match="list">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="normalPage"
				page-height="29.7cm"
		        page-width="21cm"
		        margin-left="1cm"
		        margin-right="1cm"
		        margin-top="1cm"
		        margin-bottom="1cm">
				<fo:region-before extent="3cm"/>
				<fo:region-after extent="1cm"/>
				<fo:region-body margin-top="2.5cm" margin-bottom="2cm" />
			</fo:simple-page-master>
			<fo:page-sequence-master master-name="contents">
				<fo:repeatable-page-master-alternatives>
					<fo:conditional-page-master-reference master-reference="normalPage"/>
				</fo:repeatable-page-master-alternatives>
			</fo:page-sequence-master>
		</fo:layout-master-set>

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
									<fo:block text-align="right">	<xsl:value-of select="repko_01r"/></fo:block>
									<fo:block text-align="right"><fo:inline color="white">|</fo:inline>
																	<xsl:value-of select="repko_02r"/></fo:block>
									<fo:block text-align="right">	<xsl:value-of select="datum"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>			
			</fo:static-content>	
				
<!-- ***** Tabelle PUBs Kopfbereich	-->		
			<fo:static-content flow-name="xsl-region-after">
			    <fo:block font-family="Helvetica" font-size="8pt" text-align="center">
					<xsl:value-of select="PRINT_PAGE"/><fo:page-number/>
				</fo:block>
			</fo:static-content>

			<fo:flow flow-name="xsl-region-body" >
				<fo:block>
					<fo:table>
						<fo:table-column column-width="6cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-column column-width="3cm"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.0pt #000000 solid">
									<fo:block font-weight="bold" font-size="8pt" text-decoration="underline">
										<xsl:value-of select="LABEL-PUKA_BEZEICHNUNG"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.0pt #000000 solid">
									<fo:block font-weight="bold" font-size="8pt" text-decoration="underline">
										<xsl:value-of select="LABEL-PUBL_TITEL"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-top="2pt" padding-right="4pt" table-layout="fixed" border="0.0pt #000000 solid">
									<fo:block font-weight="bold" font-size="8pt" text-align="right" text-decoration="underline">
										<xsl:value-of select="LABEL-PUBL_PREIS"/>
									</fo:block>
								</fo:table-cell>								
							</fo:table-row>
							
						</fo:table-body>
							<fo:table-body>
								<xsl:apply-templates select="publication_data"/>
							</fo:table-body>						
					</fo:table>
				</fo:block>	
			</fo:flow>			


		</fo:page-sequence>
	</fo:root>
</xsl:template>



<!-- Templates zu Tabelle PUBs Daten -->
<xsl:template match="publication_data">
	<fo:table-row>
		<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-size="8pt">
				<xsl:value-of select="PUKA_BEZEICHNUNG"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-size="8pt">
				<xsl:value-of select="PUBL_TITEL"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-top="2pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-size="8pt"  text-align="right">
				<xsl:value-of select="PUBL_PREIS"/> EUR
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>




    
    
</xsl:stylesheet>    