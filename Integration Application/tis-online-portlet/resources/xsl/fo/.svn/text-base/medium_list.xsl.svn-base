<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
	<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
	<xsl:param name="versionParam" select="'1.0'"/> 

<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="root">
	<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
		<fo:layout-master-set>
			<fo:simple-page-master
				master-name="simpleA4"
				page-height="29.7cm"
				page-width="21cm"
				margin-top="1.5cm"
				margin-bottom="2cm"
				margin-left="1.8cm"
				margin-right="1.8cm">
				<fo:region-body margin-top="1.8cm"/>
				<fo:region-before extent="3.0cm"/>
				<fo:region-after/>
			</fo:simple-page-master>
		</fo:layout-master-set>
		
		<fo:page-sequence master-reference="simpleA4">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block>
					<fo:table table-layout="fixed" width="100%" border-collapse="separate">
						<fo:table-column column-width="10cm"/>
						<fo:table-column/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-bottom="3pt" padding-top="30pt">
									<fo:block font-size="16pt" font-weight="bold" color="#185888" text-align="left">
										Mediothek
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-bottom="3pt">
									<fo:block font-size="14pt" font-weight="bold" color="#185888" text-align="right">
										<fo:external-graphic content-width="80pt" >
											<xsl:attribute name="src"><xsl:value-of select="/root/logo"/></xsl:attribute>
										</fo:external-graphic>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
					
				</fo:block>
			</fo:static-content>
			<fo:static-content flow-name="xsl-region-after">
				<fo:block font-size="10pt"  padding-bottom="0.2cm" space-after="5mm">
					Ausdruckdatum: <xsl:value-of select="/root/date"/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="10pt"  padding-bottom="0.2cm" space-after="5mm">
					<xsl:apply-templates />
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="logo"></xsl:template>
<xsl:template match="date"></xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="list">
	<fo:table table-layout="fixed" width="100%" border-collapse="separate"  >
		<xsl:apply-templates select="column"/>
		<fo:table-body>
			<xsl:apply-templates select="row"/>
		</fo:table-body>
	</fo:table>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="column">
	<fo:table-column>
		<xsl:if test="@width!=''">
			<xsl:attribute name="column-width"><xsl:value-of select="@width"/></xsl:attribute>
		</xsl:if>
	</fo:table-column>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="row">
	<fo:table-row >
		<xsl:apply-templates/>
	</fo:table-row>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="list-headercell">
	<fo:table-cell   display-align="center" padding-bottom="3pt" height="20pt">
		<fo:block border-top="0.1pt #9EBED1 solid"   border-bottom="0.1pt #9EBED1 solid" padding="3pt" font-weight="bold"  >
			<xsl:apply-templates/>
		</fo:block>
	</fo:table-cell>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="list-cell">
	<fo:table-cell >
		<fo:block language="en" hyphenate="true" padding="2pt">
			<xsl:apply-templates/>
		</fo:block>
	</fo:table-cell>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
</xsl:stylesheet>