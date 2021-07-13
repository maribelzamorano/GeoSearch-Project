<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  	<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
	<xsl:template match="detail">
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
					<fo:region-body margin-top="2.5cm" margin-bottom="2cm" />
				</fo:simple-page-master>
				<fo:page-sequence-master master-name="contents">
					<fo:repeatable-page-master-alternatives>
						<fo:conditional-page-master-reference master-reference="normalPage"/>
					</fo:repeatable-page-master-alternatives>
				</fo:page-sequence-master>
			</fo:layout-master-set>
        
        
        
<!-- ################ HEADER #################################-->
			<fo:page-sequence master-reference="contents" initial-page-number="1">
<!--  KOPFBEREICH -->			
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
											<fo:block text-align="center" font-size="10pt" font-weight="bold">
												<xsl:value-of select="TITEL"/>
											</fo:block>
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

<!-- FUSSBEREICH -->
				<fo:static-content flow-name="xsl-region-after">
				    <fo:block font-family="Helvetica" font-size="10pt" text-align="center">
						Seite <fo:page-number/>
					</fo:block>
				</fo:static-content>

<!-- DETAILS -->
		        <fo:flow flow-name="xsl-region-body">
<!--					
					<fo:block font-size="11pt">
						<xsl:value-of select="BLOCK_HEADER_0"/>
					</fo:block>
-->					
					<fo:block padding-top="15pt">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="3cm"/>
							<fo:table-column column-width="15cm"/>
							<fo:table-body>					
								<xsl:apply-templates select="mitt_nachricht"/>
								<xsl:apply-templates select="mitt_dt_nachricht_vom"/>
								<xsl:apply-templates select="mitt_dt_gueltig_ab"/>
								<xsl:apply-templates select="mitt_dt_gueltig_bis"/>
							</fo:table-body>
						</fo:table>
					</fo:block>
					
					<fo:block padding-top="15pt">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="19cm"/>
							<fo:table-body>					
								<xsl:apply-templates select="miea_anzeige"/>
							</fo:table-body>
						</fo:table>
					</fo:block>
				</fo:flow>	
			</fo:page-sequence>	
		</fo:root>
</xsl:template>
	

<!--TEMPLATES -->
<xsl:template match="miea_anzeige">
	<fo:table-row>
		<fo:table-cell padding-top="2pt" padding-left="2pt"  border="0.01pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="bold">
				<xsl:value-of select="LABEL-MIEA_ANZEIGE"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
	<xsl:apply-templates select="miea_anzeige_daten"/>
</xsl:template>	
	
<xsl:template match="miea_anzeige_daten">	
	<fo:table-row>
		<fo:table-cell padding-top="2pt" padding-left="2pt"  border="0.01pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="normal">
				<xsl:value-of select="MIEA_ANZEIGE"/>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>

<xsl:template match="mitt_nachricht">
	<fo:table-row>
		<fo:table-cell padding-left="5pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block font-weight="bold" font-size="10pt">
				<xsl:value-of select="LABEL-MITT_NACHRICHT"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-left="2pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="normal">
				<xsl:value-of select="MITT_NACHRICHT"/>
			</fo:block>
		</fo:table-cell>			
	</fo:table-row>
</xsl:template>	

<xsl:template match="mitt_dt_nachricht_vom">
	<fo:table-row>
		<fo:table-cell padding-left="5pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block font-weight="bold" font-size="10pt">
				<xsl:value-of select="LABEL-MITT_DT_NACHRICHT_VOM"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-left="2pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="normal">
				<xsl:value-of select="MITT_DT_NACHRICHT_VOM"/>
			</fo:block>
		</fo:table-cell>			
	</fo:table-row>
</xsl:template>	

<xsl:template match="mitt_dt_gueltig_ab">
	<fo:table-row>
		<fo:table-cell padding-left="5pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block font-weight="bold" font-size="10pt">
				<xsl:value-of select="LABEL-MITT_DT_GUELTIG_AB"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-left="2pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="normal">
				<xsl:value-of select="MITT_DT_GUELTIG_AB"/>
			</fo:block>
		</fo:table-cell>			
	</fo:table-row>
</xsl:template>	
<xsl:template match="mitt_dt_gueltig_bis">
	<fo:table-row>
		<fo:table-cell padding-left="5pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block font-weight="bold" font-size="10pt">
				<xsl:value-of select="LABEL-MITT_DT_GUELTIG_BIS"/>
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-left="2pt" padding-top="2pt" border="0.00pt #000000 solid">
			<fo:block language="en" hyphenate="true" font-size="10pt" font-weight="normal">
				<xsl:value-of select="MITT_DT_GUELTIG_BIS"/>
			</fo:block>
		</fo:table-cell>			
	</fo:table-row>
</xsl:template>		

	
</xsl:stylesheet>
