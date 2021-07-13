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
		 <fo:table border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px" table-layout="fixed">   
	            <fo:table-column column-width="6cm"/>
	             <fo:table-column column-width="10.5cm"/>
					<fo:table-body>							
							<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										Thema: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="PGPK_THEMA_1"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="PGPK_THEMA_2"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="PGPK_THEMA_3"/>
									</fo:block>
									
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">		
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Veranstaltungsnummer: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">		
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_NR"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Beginn: 
									</fo:block>	
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_BEGINN_DATUM"/>&#160;<xsl:value-of select="VESG_BEGINN_ZEIT"/>
									</fo:block>	
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">								
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Ende:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">								
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_ENDE_DATUM"/>&#160;<xsl:value-of select="VESG_ENDE_ZEIT"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Veranstaltungsort: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_VORL_ORT"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Vorl. Termin: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_VORL_TERMIN"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Gesamtkosten:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_GESAMTKOSTEN"/>&#160;&#8364;
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Referenten: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_REFERENTEN"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Leitung: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_LEITUNG"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Kooperationspartner: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VESG_KOOP_PARTNER"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										Lehrgangsobjekt: 
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VGPO_CC_STRV_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VGPO_CC_ORTV_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VGPO_ORTV_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VGPO_PLZV_NUMMER"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="VGPO_GEPA_NAME"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										Budgetierte Einrichtung:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_GEPA_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_DIEN_NR"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_CC_STRV_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_CC_ORTV_NAME"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_PLZV_NUMMER"/>
									</fo:block>
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="BUEI_ORTV_NAME"/>
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">						
			         				<fo:block font-size="12pt" font-family="Helvetica">         					
										&#160;
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">	
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Betrag verfügbar:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">	
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="KOBJ_BETRAG_VERFUEGBAR"/>&#160;&#8364;
									</fo:block>
								</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">	
									<fo:block font-size="12pt" font-family="Helvetica">         					
										Jahrgang:
									</fo:block>
								</fo:table-cell>
								<fo:table-cell border="0.1pt #000000 solid" padding-left="5px" padding-top="5px" padding-right="5px" padding-bottom="5px">	
									<fo:block font-size="12pt" font-family="Helvetica">         					
										<xsl:value-of select="JAHR_BESCHREIBUNG"/>
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