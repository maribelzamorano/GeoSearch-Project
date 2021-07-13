<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0cm" margin-left="1.5cm" margin-right="1.2cm">
		<fo:region-body margin-top="1.5cm" margin-bottom="1cm"/> 
		<fo:region-before extent="1.8cm"/>
		<fo:region-after extent="1.5cm"/>
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="simpleA4">
		
	<!-- =================== Fuß =======================  -->
	
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block  text-align="right" font-size="8pt"> 
   		<fo:table>
   			<fo:table-column column-width="100%"/>
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
   	
<!-- =================== Veranstaltung ========================= -->			
	<fo:flow flow-name="xsl-region-body" font-size="9pt">

	<fo:block padding-bottom="1cm">
		<fo:table table-layout="fixed">   
	            <fo:table-column column-width="2.5cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
							
			            <fo:table-row >
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-weight="bold" font-size="9pt" font-family="Helvetica">         					
									Veranstaltung:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Veranstaltungsnummer"/>&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="0.1cm">
							<fo:table-cell>						
		         				<fo:block>         						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block>         					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Thema:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Thema"/>&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="0.1cm">
							<fo:table-cell>						
		         				<fo:block>         						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block>         					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row >
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Ort:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Lehrgangsobjekt_Name"/><xsl:if test="Lehrgangsobjekt_PLZ !=''">,</xsl:if>&#160;<xsl:value-of select="Lehrgangsobjekt_PLZ"/>&#160;<xsl:value-of select="Lehrgangsobjekt_Ort"/><xsl:if test="Lehrgangsobjekt_Strasse !=''">,</xsl:if>&#160;<xsl:value-of select="Lehrgangsobjekt_Strasse"/>&#160;<xsl:value-of select="HAUSNR"/> 
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="0.1cm">
							<fo:table-cell>						
		         				<fo:block>         						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block>         					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row >
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Beginn:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Beginn"/>&#160;<xsl:value-of select="Beginn_Zeit"/><xsl:if test="Beginn_Zeit!=''">Uhr&#160;</xsl:if>Ende: <xsl:value-of select="Ende"/>&#160;<xsl:value-of select="Ende_Zeit"/><xsl:if test="Ende_Zeit!=''">Uhr&#160;</xsl:if>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
			</fo:table>
	</fo:block>
<!-- =================== Liste ========================= -->	



<fo:block >
	 <xsl:variable name="dienstlich">
	 	<xsl:value-of select="dienstlich" />
	 </xsl:variable>
	 <xsl:variable name="MitPersNummer">
	 	<xsl:value-of select="MitPersNummer" />
	 </xsl:variable>
		<fo:table table-layout="fixed">   
	            <fo:table-column column-width="0.6cm"/>
	            <fo:table-column column-width="1.8cm"/>
	            <fo:table-column column-width="4.4cm"/>
	            <fo:table-column column-width="4.6cm"/>
	            <fo:table-column column-width="4.6cm"/>
	            <fo:table-column column-width="1cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
							
			            <fo:table-row >
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Nr.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									<xsl:if test="MitPersNummer=1">Pers.-Nr.</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block width="4.4cm" text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Name
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									<xsl:if test="$dienstlich=0">Privatadresse</xsl:if>
									<xsl:if test="$dienstlich=1">Dienststelle</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									<xsl:if test="$dienstlich=0">Dienststelle</xsl:if>
									<xsl:if test="$dienstlich=1">Dienstadresse</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanning="2" >						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Verpfl./Übern.
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						<xsl:for-each select="Teilnehmer">
						<fo:table-row height="1cm">
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:number level="single" count="Teilnehmer" format="1. " />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:if test="$MitPersNummer=1"><xsl:value-of select="Personalnummer" /></xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-right="3pt" padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Anrede" />&#160;<xsl:value-of select="Titel" /><xsl:if test="Titel!=''">&#160;</xsl:if><xsl:value-of select="Vorname" />&#160;<xsl:value-of select="Name" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block  font-size="9pt" font-family="Helvetica">         					
									<xsl:if test="$dienstlich=0">
											<xsl:value-of select="Strasse_Privat" />&#160;<xsl:value-of select="HAUSNR" /><xsl:if test="Strasse_Privat!='....'">,</xsl:if>&#160;
											<xsl:value-of select="PLZ_Privat" />&#160;
											<xsl:value-of select="Ort_Privat" />&#160;
									</xsl:if>
																		
									<xsl:if test="$dienstlich=1">
											<xsl:value-of select="Dienststelle" />	
									</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:if test="$dienstlich=0">
											<xsl:value-of select="Dienststelle" />
									</xsl:if>
																		
									<xsl:if test="$dienstlich=1">
											<xsl:value-of select="Strasse_Dienst" />&#160;<xsl:value-of select="HAUSNR" /><xsl:if test="Strasse_Dienst!='....'">,</xsl:if>&#160;
											<xsl:value-of select="PLZ_Dienst" />&#160;
											<xsl:value-of select="Ort_Dienst" />&#160;
									</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block text-align="right" font-size="9pt" font-family="Helvetica">         					
									<xsl:if test="Verpflegung=1">
											X&#160;
									</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">
								<fo:block>						
		         				<xsl:if test="Uebernachtung=1">
											/ &#160;X
									</xsl:if>      					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
			</fo:table>
			<fo:block  text-align="left" font-size="8pt"> 
	   	<!-- 	<fo:table>
	   			<fo:table-column column-width="100%"/>
	   				<fo:table-body>
	   				
	   					<fo:table-row>
			   				<fo:table-cell >
				   				<fo:block>
				   					&#160;
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
		   				<fo:table-row>
			   				<fo:table-cell >
				   				<fo:block>
				   					Anz. Übernachtungen weiblich:&#160;&#160;<xsl:value-of select="AnzahlUebernachtungW" />
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
		   				
		   				<fo:table-row>
			   				<fo:table-cell >
				   				<fo:block>
				   					Anz. Übernachtungen männlich:&#160;<xsl:value-of select="AnzahlUebernachtungM" />
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
	   				</fo:table-body>
	   		</fo:table> -->
   		   		   		
   		</fo:block>
			<fo:block id="last_page"></fo:block>		
		</fo:block>
</fo:flow>
</fo:page-sequence>
</fo:root>

</xsl:template> 

</xsl:stylesheet>