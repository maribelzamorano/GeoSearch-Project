<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0cm" margin-left="1.5cm" margin-right="1.2cm">
		<fo:region-body margin-top="1.6cm" margin-bottom="1.7cm"/> 
		<fo:region-before extent="2.0cm"/>
		<fo:region-after extent="1.0cm"/>
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="simpleA4">
		
	<!-- =================== Fuß =======================  -->
	
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block  text-align="right" font-size="8pt"> 
   		<fo:table>
   			<fo:table-column column-width="18.3cm"/>
   				<fo:table-body>
	   				<fo:table-row>
		   				<fo:table-cell border-top="0.1pt #000000 solid" padding-top="2pt">
			   				<fo:block>
			   					Seite <fo:page-number/> von <fo:page-number-citation ref-id="last_page"/>
			   				</fo:block>
		   				</fo:table-cell>
	   				</fo:table-row>
   				</fo:table-body>
   		</fo:table>
   		   		   		
   		</fo:block>
   </fo:static-content>
			
	<!-- =================== Kopf ========================= -->
	<fo:static-content flow-name="xsl-region-before">
	<fo:block padding-bottom="0pt">
		 <fo:table table-layout="fixed" border="0.1pt #000000 solid" font-size="8pt">  
	            <fo:table-column column-width="4.7cm"/>
	            <fo:table-column column-width="*"/>
	            <fo:table-column column-width="4.7cm"/>
					<fo:table-body>
					<fo:table-row>
						<!-- Linker Kopfbereich -->
						<fo:table-cell padding-left="3pt" padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="left"><xsl:value-of select="repko_01l"/></fo:block>
							<fo:block text-align="left"><xsl:value-of select="repko_02l"/></fo:block>
							<fo:block text-align="left"><xsl:value-of select="repko_03l"/></fo:block>
						</fo:table-cell>
						<!-- Mittlerer Kopfbereich -->
						<fo:table-cell>
							<fo:block  border-left="0.1pt #000000 solid"  border-right="0.1pt #000000 solid"  padding-top="3pt" padding-bottom="3pt">
								<fo:block text-align="center" font-size="10pt" font-weight="bold">
									<xsl:value-of select="TITEL"/>
								</fo:block>
								<fo:block color="white" font-size="6pt">|</fo:block>
								<fo:block color="white" font-size="8pt">|</fo:block>
							</fo:block>
						</fo:table-cell>
						<!-- Rechter Kopfbereich -->
						<fo:table-cell padding-right="3pt" padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="right"><xsl:value-of select="repko_01r"/></fo:block>
							<fo:block text-align="right"><fo:inline color="white">|</fo:inline><xsl:value-of select="repko_02r"/></fo:block>
							<fo:block text-align="right"><xsl:value-of select="Datum"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
	</fo:block>
   </fo:static-content>	
   	
		
<fo:flow flow-name="xsl-region-body" font-size="9pt">

<!-- =================== Liste ========================= -->	
<fo:block >
		<fo:table table-layout="fixed" >  
				 <fo:table-column column-width="0.5cm"/> 
	            <fo:table-column column-width="3.5cm"/>
	            <fo:table-column column-width="3.0cm"/>
	            <fo:table-column column-width="5.0cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
							
			          <xsl:for-each select="Veranstaltung">
						 <fo:table-row >
							<fo:table-cell padding-top="5pt">						
		         				<fo:block number-columns-spanned="2" text-decoration="underline" font-weight="bold" font-size="9pt" font-family="Helvetica">         					
									Veranstaltungsnummer:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="5pt">						
		         				<fo:block font-size="9pt" font-weight="bold" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="5pt">						
		         				<fo:block font-size="9pt" font-weight="bold" font-family="Helvetica">         					
									<xsl:value-of select="Veranstaltungsnummer"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="5pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">  
		         				Beginn: <xsl:value-of select="Beginn"/>       						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-top="5pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">  
		         				Ende: <xsl:value-of select="Ende"/>       					
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
						<fo:table-row  >
							<fo:table-cell >						
		         				<fo:block > 
		         				&#160;        					
								</fo:block>
							</fo:table-cell>
							<fo:table-cell >
							<fo:block padding-top="2pt"  font-size="9pt" font-family="Helvetica">  					       					
									Thema (1.Zeile):
							</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="3"  >						  					
									<fo:block padding-top="2pt">
									<fo:inline
									font-size="9pt" font-family="Helvetica" keep-together.within-line="yes">
									<xsl:value-of select="Thema"/>
									</fo:inline>
									</fo:block>
							</fo:table-cell>		
						</fo:table-row>
						<fo:table-row >
							<fo:table-cell>						
		         				<fo:block> 
		         				&#160;        						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Teilnehmer geplant: 
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="TeilnehmerGeplant"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block> 
		         				Teilnehmer angemeldet:   <xsl:value-of select="Anmeldungsstand"/>      						
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>						
		         				<fo:block> 
		         				Status:    <xsl:value-of select="Status"/>     					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row >
							<fo:table-cell>						
		         				<fo:block>
		         				&#160;         						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Postausgang: 
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:choose>
										  <xsl:when test="Postausgang='1'">
										  	ja
										  </xsl:when>
										  <xsl:otherwise>
										   	nein
										  </xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block> 
		         				Postausgang Datum:   <xsl:value-of select="PostausgangDatum"/>      						
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell>						
		         				<fo:block> 
		         				   &#160; 					
								</fo:block>
							</fo:table-cell>
						</fo:table-row >
							
						</xsl:for-each>
					</fo:table-body>
			</fo:table>
		
			<fo:block id="last_page"></fo:block>
   			
	</fo:block>
</fo:flow>
</fo:page-sequence>
</fo:root>

</xsl:template> 

</xsl:stylesheet>