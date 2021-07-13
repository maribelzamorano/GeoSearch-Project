<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="A4Quer" page-height="21cm" page-width="29.7cm" margin-top="1cm" margin-bottom="0cm" margin-left="1.5cm" margin-right="1.2cm">
		<fo:region-body margin-top="3.5cm" margin-bottom="1cm"/> 
		<fo:region-before extent="3.3cm"/>
		<fo:region-after extent="1.0cm"/>
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="A4Quer">
		
	<!-- =================== Fuß =======================  -->
	
	<fo:static-content flow-name="xsl-region-after">
   		<fo:block  text-align="right" font-size="8pt"> 
   		<fo:table>
   			<fo:table-column column-width="27cm"/>
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
<!-- =================== Veranstaltung ========================= -->  
	<fo:block padding-bottom="0.5cm" padding-top="0.3cm">
		<fo:table table-layout="fixed">   
	            <fo:table-column column-width="4.7cm"/>
	            <fo:table-column column-width="1.8cm"/>
	            <fo:table-column column-width="6.5cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
							
			            <fo:table-row >
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-weight="bold" font-size="9pt" font-family="Helvetica">         					
									Veranstaltungsnummer:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-weight="bold" font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Veranstaltungsnummer"/>&#160;
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Thema: <xsl:value-of select="Thema"/>
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
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Beginn: <xsl:value-of select="Beginn"/>&#160;&#160;Ende: <xsl:value-of select="Ende"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Ort: <xsl:value-of select="Veranstaltungsort"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									Einrichtung: <xsl:value-of select="Lehrgangsobjekt_Ort"/>&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="0.1cm">
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block>         						
								</fo:block>
							</fo:table-cell>
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
							<fo:table-cell number-columns-spanned="2">						
		         				<fo:block border-bottom="0.1pt #000000 solid" font-size="9pt" font-family="Helvetica">         					
									max. Teilnehmerzahl: <xsl:value-of select="TeilnehmerMax"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block border-bottom="0.1pt #000000 solid" font-size="9pt" font-family="Helvetica">         					
									Anmeldungsstand: <xsl:value-of select="Anmeldungsstand"/> &#160; 
									Postausgang: 
									<xsl:choose>
									  <xsl:when test="Postausgang=1">
									   ja
									  </xsl:when>
									  <xsl:otherwise>
									  nein
									  </xsl:otherwise>
									 </xsl:choose>
 
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block border-bottom="0.1pt #000000 solid" font-size="9pt" font-family="Helvetica">         					
									Status: <xsl:value-of select="Status"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
					</fo:table-body>
			</fo:table>
	</fo:block>
</fo:static-content>	
			
<fo:flow flow-name="xsl-region-body" font-size="9pt">

<fo:block>
	<fo:table table-layout="fixed">   
	            <fo:table-column column-width="4.3cm"/>
	            <fo:table-column column-width="5.3cm"/>
	            <fo:table-column column-width="1.5cm"/>
	            <fo:table-column column-width="3.5cm"/>
	            <fo:table-column column-width="2.6cm"/>
	            <fo:table-column column-width="0.7cm"/>
	            <fo:table-column column-width="1.5cm"/>
	            <fo:table-column column-width="2.8cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
					
	<!-- =================== Teilnehmer ========================= -->						
			            <fo:table-row >
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">
		         					Teilnehmer(in)     					
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Dienststelle
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Schultyp
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Ort
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Eingangsdatum
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2" >						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Verpfl./Übern.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Teilnehmerstatus
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt">         					
									Bemerkungen
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
					</fo:table-body>
				
			</fo:table>
		</fo:block>
<!-- =================== Liste ========================= -->	

<fo:block >
	 <xsl:variable name="PrivatoderDienst">
	 	<xsl:value-of select="PrivatoderDienst" />
	 </xsl:variable>
	 	<fo:table table-layout="fixed">   
	            <fo:table-column column-width="4.3cm"/>
	            <fo:table-column column-width="5.3cm"/>
	            <fo:table-column column-width="1.5cm"/>
	            <fo:table-column column-width="3.5cm"/>
	            <fo:table-column column-width="2.6cm"/>
	            <fo:table-column column-width="0.7cm"/>
	            <fo:table-column column-width="1.5cm"/>
	            <fo:table-column column-width="2.8cm"/>
	            <fo:table-column column-width="*"/>
					<fo:table-body>
						<xsl:for-each select="Teilnehmer" >
						<fo:table-row height="0.8pt" >
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Name" />, <xsl:value-of select="Vorname" />&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="9pt" font-family="Helvetica">           					
									<xsl:value-of select="Dienststelle" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Schultyp" />		
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="9pt" font-family="Helvetica">           					
									<xsl:value-of select="PLZ_Dienst" />&#160;<xsl:value-of select="Ort_Dienst" />	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica" text-align="center">         					
									<xsl:value-of select="Eingangsdatum" />	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block text-align="right" font-size="9pt" font-family="Helvetica">
		         				 <xsl:choose>         					
									<xsl:when test="Verpflegung=''">
									   nein
									  </xsl:when>
									  <xsl:otherwise>
										ja
									  </xsl:otherwise>
									</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									/ &#160;
									<xsl:choose>
									  <xsl:when test="Uebernachtung=1">
									   	ja
									  </xsl:when>
									  <xsl:otherwise>
									  keine
									  </xsl:otherwise>
									 </xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Teilnehmerstatus" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Bemerkungen" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						<fo:table-row >
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Dozent(in)
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Dienststelle
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Schultyp
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Ort
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Eingangsdatum
								</fo:block>
							</fo:table-cell>
							<fo:table-cell number-columns-spanned="2" >						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Verpfl./Übern.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Teilnehmerstatus
								</fo:block>
							</fo:table-cell>
							<fo:table-cell>						
		         				<fo:block text-decoration="underline" font-size="9pt" font-family="Helvetica" padding-bottom="2pt" padding-top="2pt">         					
									Bemerkungen
								</fo:block>
							</fo:table-cell>
							
						</fo:table-row>
						
<!-- =================== Dozent ========================= -->						
						<xsl:for-each select="Dozent">
						
						<fo:table-row height="0.8pt" >
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Name" />, <xsl:value-of select="Vorname" />&#160;
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="9pt" font-family="Helvetica">          					
									<xsl:value-of select="Dienststelle" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Schultyp" />		
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="9pt" font-family="Helvetica">           					
									<xsl:value-of select="PLZ_Dienst" />&#160;<xsl:value-of select="Ort_Dienst" />	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica" text-align="center">         					
									<xsl:value-of select="Eingangsdatum" />	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block text-align="right" font-size="9pt" font-family="Helvetica">         					
									  <xsl:choose>         					
											<xsl:when test="Verpflegung=0">
									   		nein
										  </xsl:when>
										  <xsl:otherwise>
										 	ja
									  	</xsl:otherwise>
										</xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									/ &#160; 
									<xsl:choose>  
										<xsl:when test="Uebernachtung=1">
										   ja
										  </xsl:when>
										  <xsl:otherwise>
										  keine
										  </xsl:otherwise>
									 </xsl:choose>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Teilnehmerstatus" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-bottom="3pt">						
		         				<fo:block font-size="9pt" font-family="Helvetica">         					
									<xsl:value-of select="Bemerkungen" />
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
					</fo:table-body>
			</fo:table>
	<!-- 
			<fo:block  text-align="left" font-size="8pt"> 
	   		<fo:table>
	   			<fo:table-column column-width="3.5cm"/>
	   			<fo:table-column column-width="*"/>
	   				<fo:table-body>
		   				<fo:table-row>
			   				<fo:table-cell padding-top="3pt">
				   				<fo:block text-decoration="underline" >
				   					Anzahl Übernachtungen
				   				</fo:block>
			   				</fo:table-cell>
			   				<fo:table-cell padding-top="3pt">
				   				<fo:block>
				   					
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
		   				<fo:table-row>
			   				<fo:table-cell >
				   				<fo:block>
				   					Männlich 
				   				</fo:block>
			   				</fo:table-cell>
			   				<fo:table-cell text-decoration="underline">
				   				<fo:block>
				   					<xsl:value-of select="AnzahlUebernachtungM" />
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
		   				<fo:table-row>
			   				<fo:table-cell >
				   				<fo:block>
				   					Weiblich
				   				</fo:block>
			   				</fo:table-cell>
			   				<fo:table-cell text-decoration="underline">
				   				<fo:block>
				   					<xsl:value-of select="AnzahlUebernachtungW" />
				   				</fo:block>
			   				</fo:table-cell>
		   				</fo:table-row>
	   				</fo:table-body>
	   		</fo:table>
   		   		   		
   		</fo:block>
   	 -->
			<fo:block id="last_page"></fo:block>
    			
  			
	</fo:block>
</fo:flow>
</fo:page-sequence>
</fo:root>

</xsl:template> 


</xsl:stylesheet>