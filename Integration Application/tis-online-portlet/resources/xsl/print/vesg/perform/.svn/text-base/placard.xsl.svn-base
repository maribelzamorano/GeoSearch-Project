<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0.5cm" margin-left="2.5cm" margin-right="2cm">
		<fo:region-body margin-top="1cm" margin-bottom="1cm"/> 
		
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="simpleA4">
	
	<fo:flow flow-name="xsl-region-body" font-size="12pt">

	<fo:block padding-bottom="20pt">
		 <fo:table table-layout="fixed" text-align="center" >   
	            <fo:table-column column-width="16.5cm"/>
					<fo:table-body>
							
			            
						<fo:table-row>
							<fo:table-cell>
							<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="26pt" font-family="Helvetica" >         					
									VERANSTALTUNG
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										- <xsl:value-of select="Veranstaltungsart"/> -
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>					
		         				<fo:block font-size="18pt" font-family="Helvetica" >         					
									<xsl:value-of select="Thema1"/><xsl:value-of select="Thema2"/><xsl:value-of select="Thema3"/>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Veranstaltungs-Nr.: <xsl:value-of select="Veranstaltungsnummer"/>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Referent(en): <xsl:value-of select="Referent_Anrede"/>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-weight="bold"  font-family="Helvetica" >         					
									Termin: 	<xsl:if test="Beginn = Ende and Beginn != ''">am </xsl:if>
												<xsl:if test="Beginn != Ende">vom </xsl:if>
												<xsl:value-of select="Beginn"/>&#160;
												<xsl:if test="Beginn != Ende">bis </xsl:if>
												<xsl:if test="Beginn != Ende"><xsl:value-of select="Ende"/></xsl:if>
												<fo:inline font-size="9pt" font-style="italic" font-weight="normal"><xsl:if test="Beginn = Ende and Beginn = ''">nicht bekannt</xsl:if></fo:inline>
								</fo:block>
								
								<fo:block font-size="12pt" font-weight="bold" font-family="Helvetica" >         					
									Beginn: <xsl:value-of select="Beginn_Zeit"/> <fo:inline font-size="9pt" font-style="italic" font-weight="normal"><xsl:if test="Beginn_Zeit = ''">nicht bekannt</xsl:if></fo:inline><xsl:if test="Beginn_Zeit != ''">Uhr</xsl:if> Ende: <xsl:value-of select="Ende_Zeit"/> <fo:inline font-size="9pt" font-style="italic" font-weight="normal"><xsl:if test="Ende_Zeit = ''">nicht bekannt</xsl:if></fo:inline><xsl:if test="Ende_Zeit != ''">Uhr</xsl:if>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Veranstaltungsort: <xsl:value-of select="Veranstaltungsort"/><fo:inline font-size="9pt" font-style="italic"><xsl:if test="Veranstaltungsort = ''">nicht bekannt</xsl:if></fo:inline>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Lehrgangsobjekt: <xsl:value-of select="Lehrgangsobjekt"/><fo:inline font-size="9pt" font-style="italic"><xsl:if test="Lehrgangsobjekt = ''">nicht bekannt</xsl:if></fo:inline>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Telefon: <xsl:value-of select="TelefonLO"/><fo:inline font-size="9pt" font-style="italic"><xsl:if test="TelefonLO = ''">nicht bekannt</xsl:if></fo:inline>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									Leitung: <xsl:value-of select="Leitung"/><fo:inline font-size="9pt" font-style="italic"><xsl:if test="Leitung = ''">nicht bekannt</xsl:if></fo:inline>
								</fo:block>
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
								</fo:block>	
								<fo:block font-size="12pt" font-family="Helvetica" >         					
									<fo:inline font-weight="bold" >Anmeldeschluss: <xsl:value-of select="Anmeldeschluss"/></fo:inline><fo:inline font-size="9pt" font-style="italic"><xsl:if test="Anmeldeschluss=''">nicht festgelegt</xsl:if></fo:inline>
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