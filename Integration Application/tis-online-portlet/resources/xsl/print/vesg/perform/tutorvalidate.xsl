<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0.5cm" margin-left="2cm" margin-right="2cm">
		<fo:region-body margin-top="7.5cm" margin-left="1.0cm" margin-right="1.0cm"/> 
	   	
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="simpleA4">
		
	<fo:flow flow-name="xsl-region-body" font-size="12pt">

<!-- =================== Dozentenbestaetigung ========================= -->
	<xsl:for-each select="Dozent">
	<fo:block padding-bottom="20pt" text-align="center">

		 <fo:table table-layout="fixed" >   
	            <fo:table-column column-width="100%"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="36pt" font-family="Helvetica" font-style="italic">         					
									Dozentenbestätigung
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
		            	<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-weight="bold">         					
									<xsl:value-of select="Anrede"/>&#160;<xsl:value-of select="Titel"/>&#160;<xsl:value-of select="Vorname"/>&#160;<xsl:value-of select="Name"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>									
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									war als Dozent<xsl:if test="Anrede='Frau'">in</xsl:if>
									in der Fortbildungsveranstaltung mit dem Thema
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="16pt" font-family="Helvetica">         					
									"<xsl:value-of select="Thema"/>"
								</fo:block>
							</fo:table-cell>
						</fo:table-row>	
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									(ThILLM-Nr.<xsl:value-of select="Veranstaltungsnummer"/>)
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
									<xsl:if test="Beginn = Ende">am <xsl:value-of select="Beginn"/> tätig.
									</xsl:if> 
									<xsl:if test="Beginn != Ende">vom <xsl:value-of select="Beginn"/> bis <xsl:value-of select="Ende"/> tätig.
									</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>		
					</fo:table-body>
			</fo:table>
	</fo:block>
	<fo:block text-align="left">
		 <fo:table table-layout="fixed" >   
	            <fo:table-column column-width="100%"/>
					<fo:table-body>
					
					<fo:table-row height="5cm">
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica">         					
									Bad Berka, den <xsl:value-of select="Ende"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" font-style="italic">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="12pt" font-family="Helvetica" >         					
									<xsl:value-of select="Referent_Titel"/><xsl:if test="Referent_Titel != ''">&#160;</xsl:if><xsl:value-of select="Referent_Vorname"/>&#160;<xsl:value-of select="Referent_Nachname"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block padding-bottom="5.0cm"  font-size="10pt" font-family="Helvetica" >         					
									Referent<xsl:if test="Referent_Anrede='Frau'">in</xsl:if> im ThILLM
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
			
												
					</fo:table-body>
			</fo:table>
	</fo:block>
	</xsl:for-each>

</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>




</xsl:stylesheet>