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
								<fo:table-cell padding-top="30pt">
									<fo:block font-size="16pt" font-weight="bold" color="#185888" text-align="left">
										<xsl:value-of select="/root/heading"/>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell>
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
				<fo:block font-size="10pt" padding-top="0.2cm" space-after="5mm">									
					<fo:table table-layout="fixed" width="100%" border-collapse="separate">
						<fo:table-column column-width="10cm"/>
						<fo:table-column/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding-bottom="0.2cm" space-after="5mm">
									<fo:block font-size="10pt" text-align="left">
										Ausdruckdatum: <xsl:value-of select="/root/date"/>								
									</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-bottom="0.2cm" space-after="5mm">
									<fo:block font-size="10pt" text-align="right">
										Seite <fo:page-number/>									
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				</fo:block>
			</fo:static-content>
			
			<fo:flow flow-name="xsl-region-body">
				<fo:block font-size="10pt" space-after="5mm">
					<xsl:apply-templates />
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</fo:root>
</xsl:template>

<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="heading"></xsl:template>
<xsl:template match="logo"></xsl:template>

<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="image">
	<fo:external-graphic content-width="15pt" >
		<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	</fo:external-graphic>
</xsl:template>

<xsl:template match="date"></xsl:template>
<xsl:template match="block"><fo:block><xsl:apply-templates/></fo:block></xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="h1">
	<fo:block font-size="13pt" font-weight="bold" keep-with-next.within-page="always">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="h3">
	<fo:block font-size="10pt" font-weight="bold" keep-with-next.within-page="always">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:if test="@space-before!=''"><xsl:attribute name="space-before"><xsl:value-of select="@space-before"/></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table">
	<fo:table table-layout="fixed" width="100%" border-collapse="separate">
		<xsl:if test="@margin-top!=''"><xsl:attribute name="margin-top"><xsl:value-of select="@margin-top"/></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</fo:table>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-column">
	<fo:table-column>
		<xsl:if test="@width != ''"><xsl:attribute name="column-width"><xsl:value-of select="@width"/></xsl:attribute></xsl:if>
	</fo:table-column>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-body">
	<fo:table-body>
		<xsl:apply-templates />
	</fo:table-body>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-head">
	<fo:table-header>
		<xsl:apply-templates />
	</fo:table-header>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-foot">
	<fo:table-footer>
		<xsl:apply-templates />
	</fo:table-footer>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-row">
	<fo:table-row keep-together.within-page="always">
		<xsl:if test="@height != ''"><xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</fo:table-row>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-row-small">
	<fo:table-row keep-together.within-page="always">
		<xsl:if test="@height != ''"><xsl:attribute name="height"><xsl:value-of select="@height"/></xsl:attribute></xsl:if>
		<xsl:apply-templates />
	</fo:table-row>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-cell">
	<fo:table-cell padding-bottom="5px" padding-right="5px" >		
		<xsl:if test="@colspan != ''">
			<xsl:attribute name="number-columns-spanned"><xsl:value-of select="@colspan"/></xsl:attribute>
		</xsl:if>		
		<xsl:if test="@colspan-space != ''">
			<xsl:attribute name="number-columns-spanned"><xsl:value-of select="@colspan-space"/></xsl:attribute>		
			<xsl:attribute name="padding-top">3mm</xsl:attribute>			
			<xsl:attribute name="padding-bottom">3mm</xsl:attribute>			
		</xsl:if>		
		<xsl:if test="@colspan-font-weight != ''">
			<xsl:attribute name="number-columns-spanned"><xsl:value-of select="@colspan-font-weight"/></xsl:attribute>
			<xsl:attribute name="font-weight">bold</xsl:attribute>
		</xsl:if>				
		<xsl:if test="@font-weight != ''"><xsl:attribute name="font-weight"><xsl:value-of select="@font-weight"/></xsl:attribute></xsl:if>
		<xsl:if test="@display-align != ''"><xsl:attribute name="display-align"><xsl:value-of select="@display-align"/></xsl:attribute></xsl:if>
		<fo:block >			
			<xsl:apply-templates />
		</fo:block>
	</fo:table-cell>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-cell-small">
	<fo:table-cell display-align="top" padding-bottom="3pt" height="20pt">
		<fo:block font-size="80%" color="#888888">
			<xsl:apply-templates/>
		</fo:block>
	</fo:table-cell>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="table-cell-header">
	<fo:table-cell   display-align="center" padding-bottom="3pt" height="20pt">
		<fo:block border-top="0.1pt #9EBED1 solid"   border-bottom="0.1pt #9EBED1 solid" padding="3pt" font-weight="bold"  >
			<xsl:apply-templates/>
		</fo:block>
	</fo:table-cell>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="small">
	<fo:block font-size="8pt">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:if test="@space-before!=''"><xsl:attribute name="space-before"><xsl:value-of select="@space-before"/></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="line">
	<fo:block font-size="10pt">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:if test="@space-before!=''"><xsl:attribute name="space-before"><xsl:value-of select="@space-before"/></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->
<xsl:template match="line-small">
	<fo:block font-size="80%" color="#888888">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:if test="@space-before!=''"><xsl:attribute name="space-before"><xsl:value-of select="@space-before"/></xsl:attribute></xsl:if>
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>
<!-- ___________________________________________________________________________________________________________________ -->

<xsl:template match="title">
	<fo:block font-size="10pt" font-style="italic" color="#666666" keep-with-next.within-page="always">
		<xsl:if test="@space-after!=''"><xsl:attribute name="space-after"><xsl:value-of select="@space-after"/></xsl:attribute></xsl:if>
		<xsl:if test="@space-before!=''"><xsl:attribute name="space-before"><xsl:value-of select="@space-before"/></xsl:attribute></xsl:if>
		<xsl:if test="@space!=''">
			<xsl:attribute name="space-after"><xsl:value-of select="@space"/></xsl:attribute>
			<xsl:attribute name="space-before"><xsl:value-of select="@space"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="@break!=''">
			<xsl:attribute name="break-before">page</xsl:attribute>
			<xsl:attribute name="space-after"><xsl:value-of select="@break"/></xsl:attribute>
			<xsl:attribute name="space-before"><xsl:value-of select="@break"/></xsl:attribute>
		</xsl:if>
		
		<xsl:apply-templates/>
	</fo:block>
</xsl:template>


<!-- ___________________________________________________________________________________________________________________ -->
</xsl:stylesheet>