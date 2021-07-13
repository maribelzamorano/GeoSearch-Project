<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
<xsl:template match="list">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<fo:simple-page-master master-name="normalPage"
				page-height="29.7cm"
		        page-width="21cm"
		        margin-left="0.2cm"
		        margin-right="0cm"
		        margin-top="1cm"
		        margin-bottom="1cm">
				<fo:region-before extent="3cm"/>
				<fo:region-after extent="1cm"/>
				<fo:region-body margin-top="0.5cm" margin-bottom="2cm" />
			</fo:simple-page-master>
			<fo:page-sequence-master master-name="contents">
				<fo:repeatable-page-master-alternatives>
					<fo:conditional-page-master-reference master-reference="normalPage"/>
				</fo:repeatable-page-master-alternatives>
			</fo:page-sequence-master>
		</fo:layout-master-set>

		<fo:page-sequence master-reference="contents" initial-page-number="1">
		
			<fo:static-content flow-name="xsl-region-before">
		   		<fo:block  text-align="left" font-size="8pt"> 
		   		<fo:table>
		   			<fo:table-column column-width="18cm"/>
		   				<fo:table-body>
			   				<fo:table-row>
				   				<fo:table-cell border-bottom="0.1pt #000000 solid" padding-top="2pt">
					   				<fo:block font-family="Courier" generic-family="Monospaced" font-size="8pt" font-weight="bold" >
					   					Schnellansicht Veranstaltungs-Nr.: <xsl:value-of select="VESG_NR"/> (Stand vom <xsl:value-of select="datum"/>)
					   				</fo:block>
				   				</fo:table-cell>
			   				</fo:table-row>
		   				</fo:table-body>
		   			</fo:table>		   		   		
   				</fo:block>
   		</fo:static-content>


<!-- ***** Tabelle Kopfbereich	-->		
			<fo:static-content flow-name="xsl-region-after">
			    <fo:block font-size="9pt" text-align="center">
					Seite <fo:page-number/>
				</fo:block>
			</fo:static-content>

			<fo:flow flow-name="xsl-region-body" >
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed"  >
					<fo:table-column column-width="0.5cm"/>
	            	<fo:table-column column-width="17.5cm"/>
	            	<fo:table-body>
 						<xsl:for-each select="quickview" >
						<fo:table-row >
							<fo:table-cell padding-top="2pt" padding-left="2pt" padding-right="2pt" border="0.0pt #000000 solid">
								<fo:block font-size="8pt" font-color="gray" font-weight="normal">									
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="2pt" padding-left="2pt" padding-right="2pt" border="0.0pt #000000 solid">
								<fo:block language="en" hyphenate="true" font-size="8pt" font-weight="normal">			
									<xsl:if test="PRINTOPTION = '5'">
										<fo:inline font-weight="bold" font-family="Courier" generic-family="Monospaced" text-decoration="underline"  white-space-collapse='false' ><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									<xsl:if test="PRINTOPTION = '4'">
										<fo:inline font-weight="normal" font-family="Courier" generic-family="Monospaced" white-space-collapse='false'><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									<xsl:if test="PRINTOPTION = '3'">
										<fo:inline font-weight="normal" font-family="Courier" generic-family="Monospaced" white-space-collapse='false'><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									<xsl:if test="PRINTOPTION = '2'">
										<fo:inline font-weight="normal" font-family="Courier" generic-family="Monospaced" white-space-collapse='false'><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									<xsl:if test="PRINTOPTION = '1'">
										<fo:inline font-weight="normal" font-family="Courier" generic-family="Monospaced" white-space-collapse='false'><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									<xsl:if test="PRINTOPTION = '0'"  >
										<fo:inline font-weight="normal" font-family="Courier" generic-family="Monospaced" white-space-collapse='false'><xsl:value-of select="VEQV_TEXT"/></fo:inline>
									</xsl:if>
									
								</fo:block>
							</fo:table-cell>			
						</fo:table-row>
					</xsl:for-each>
						</fo:table-body>
					</fo:table>				
				</fo:block>	
			</fo:flow>			
	</fo:page-sequence>
	</fo:root>
</xsl:template>



</xsl:stylesheet>   