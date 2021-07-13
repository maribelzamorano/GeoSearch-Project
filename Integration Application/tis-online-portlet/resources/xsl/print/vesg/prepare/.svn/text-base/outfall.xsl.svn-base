<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="root">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0.5cm" margin-left="2.0cm" margin-right="1.5cm">
		<fo:region-body margin-top="4.5cm" margin-bottom="1cm"/> 
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
	<fo:page-sequence master-reference="simpleA4">
		
	<fo:flow flow-name="xsl-region-body" font-size="12pt">

<!-- =================== Adresse ========================= -->
<xsl:template match="body">
	<fo:block padding-bottom="20pt">
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="8.5cm"/>
					<fo:table-body>
					<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="Anrede"/><xsl:if test="Anrede='Herr'">n&#160;</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
						
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="PERS_TITEL"/><xsl:if test="PERS_TITEL!=''">&#160;</xsl:if><xsl:value-of select="GEPA_NAME_2"/>&#160;<xsl:value-of select="GEPA_NAME_1"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
												
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="STRV"/>&#160;<xsl:value-of select="HAUSNR"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									<xsl:value-of select="PLZV"/>&#160;<xsl:value-of select="ORTV"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
					</fo:table-body>
			</fo:table>
	</fo:block>
	
	
<!-- =================== Anschreiben ========================= -->
	
	<fo:block >
		 <fo:table table-layout="fixed">   
	            <fo:table-column column-width="17.5cm"/>
					<fo:table-body>
					<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					<fo:table-row>
							<fo:table-cell >						
		         				<fo:block font-size="12pt" font-family="Helvetica" text-align="right">         					
									<xsl:value-of select="Datum"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Sehr geehrte<xsl:if test="Anrede='Herr'">r</xsl:if>&#160;<xsl:value-of select="Anrede"/>&#160;<xsl:value-of select="PERS_TITEL"/><xsl:if test="PERS_TITEL!=''">&#160;</xsl:if><xsl:value-of select="GEPA_NAME_1"/>,
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
												
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									leider müssen wir Ihnen mitteilen, dass die Fortbildung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block margin-left="1.0cm" font-size="12pt" font-weight="bold" font-family="Helvetica">         					
									<xsl:value-of select="PGPK_THEMA_1"/>&#160;<xsl:value-of select="PGPK_THEMA_2"/>&#160;<xsl:value-of select="PGPK_THEMA_3"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block margin-left="1.0cm" font-size="12pt" font-weight="bold" font-family="Helvetica">         					
									Veranstaltungs-Nr: &#160;<xsl:value-of select="VESG_NR"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									nicht stattfinden kann. Ausfallgrund: &#160;<xsl:value-of select="AGVG_BEZEICHNUNG"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Falls Sie sich bei Wiederholung dieser Fortbildungsveranstaltung erneut anmelden möchten, vermerken Sie bitte, dass es Ihre Zweitanmeldung ist.
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>					
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
							
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Mit freundlichen Grüßen
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Im Auftrag
								</fo:block>
							</fo:table-cell>
						</fo:table-row>		
						
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row><fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt"  font-family="Helvetica">         					
										<xsl:value-of select="REFERENT"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
			</fo:table>
	</fo:block>
</xsl:template>

</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>

</xsl:stylesheet>