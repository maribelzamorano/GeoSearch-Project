<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 

<xsl:template match="list">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
	<fo:simple-page-master master-name="A4Quer" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="0.7cm" margin-left="2.1cm" margin-right="2.6cm">
		<fo:region-body margin-top="0.5cm" margin-bottom="1.0cm"/> 
   		
	</fo:simple-page-master>
	</fo:layout-master-set>
		<fo:page-sequence master-reference="A4Quer">
		
	
<!-- =================== Kopf ========================= -->			
	<fo:flow flow-name="xsl-region-body" font-size="11pt" font-family="Times New Roman">
	
	<fo:block  text-align="left" font-size="8pt"> 
   		<fo:table>
   			<fo:table-column column-width="16.3cm"/>
   				<fo:table-body>
	   				<fo:table-row>
		   				<fo:table-cell font-family="Times New Roman" text-align="center" font-weight="bold" font-size="14pt">
			   				<fo:block>
			   					Teilnehmerliste
			   				</fo:block>
			   				<fo:block>
			   					für eine Fortbildung des Bereiches Fort- und Weiterbildung des
			   				</fo:block>
			   				<fo:block>
			   					<xsl:value-of select="MAND_BESCHREIBUNG"/>
			   				</fo:block>
		   				</fo:table-cell>
	   				</fo:table-row>
   				</fo:table-body>
   		</fo:table>
   		   		   		
   		</fo:block>

	 <fo:block padding-bottom="0.5cm">
		<fo:table table-layout="fixed"> 
				<fo:table-column column-width="4.0cm"/>  
	            <fo:table-column column-width="4.0cm"/>
	            <fo:table-column column-width="4.7cm"/>
	            <fo:table-column column-width="3.0"/>
					<fo:table-body>
			            <fo:table-row >
							<fo:table-cell number-columns-spanned="2" border="0.1pt #000000 solid" padding="2pt"  >							         				         					
									<xsl:for-each select="Dozent">
										<fo:block language="en" hyphenate="true" font-size="11pt" font-family="Times New Roman">
											<xsl:value-of select="Anrede" />&#160;<xsl:value-of select="Titel" /><xsl:if test="Titel!=''">&#160;</xsl:if><xsl:value-of select="Name" />, <xsl:value-of select="Vorname" />
										</fo:block>
									</xsl:for-each>
							</fo:table-cell>
							
							<fo:table-cell font-weight="bold" border="0.1pt #000000 solid" padding="2pt"  >						
		         				<fo:block language="en" hyphenate="true" font-size="11pt" font-family="Times New Roman">  
		         					<xsl:value-of select="Lehrgangsobjekt_Name"/>
								</fo:block>
							</fo:table-cell>
							
							<fo:table-cell border="0.1pt #000000 solid" font-weight="bold" font-size="11pt" font-family="Times New Roman" padding="2pt"  >						
		         				<fo:block font-size="11pt" font-family="Times New Roman">         					
									Datum:&#160;<xsl:value-of select="Beginn"/>&#160;
								</fo:block>
								<fo:block font-size="11pt" font-family="Times New Roman">         					
									Beginn:&#160;<xsl:value-of select="VESG_XBEGINN_ZEIT"/>&#160;Uhr
								</fo:block>
								<fo:block font-size="11pt" font-family="Times New Roman">         					
									Ende:&#160;&#160;&#160;&#160;<xsl:value-of select="VESG_XENDE_ZEIT"/>&#160;Uhr
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row >		
							<fo:table-cell border="0.1pt #000000 solid" font-weight="bold" padding="2pt"  >	
								<fo:block font-size="11pt" font-family="Times New Roman">         					
										VA-Nr.:
								</fo:block>					
		         				<fo:block font-size="11pt" font-family="Times New Roman">         					
										<xsl:value-of select="Veranstaltungsnummer"/>
								</fo:block>
							</fo:table-cell  >	
							<fo:table-cell border="0.1pt #000000 solid" font-weight="bold"  number-columns-spanned="3" padding="2pt"  >						
		         				<fo:block>  
		         				Thema: <xsl:value-of select="Thema"/>        					
								</fo:block>
								<fo:block>  
		         				Kooperationspartner:   <xsl:value-of select="VESG_KOOP_PARTNER"/>    					
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
				</fo:table-body>
			</fo:table>
	</fo:block> 

<!-- =================== Liste ========================= -->	

<fo:block >
	 
		<fo:table table-layout="fixed" >   
	            <fo:table-column column-width="0.9cm"/>
	            <fo:table-column column-width="4.5cm"/>
	            <fo:table-column column-width="8.2cm"/>
	            <fo:table-column column-width="2.7cm"/>
					<fo:table-body>
					
	<!-- =================== Liste ========================= -->
	
						<fo:table-row >
							<fo:table-cell number-columns-spanned="4" border="0.1pt #000000 solid" >						
		         				<fo:block text-decoration="underline" text-align="center" font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="1pt">        					
									Spalte 2 und 3 bitte in Druckschrift und gut leserlich ausfüllen!
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
			            <fo:table-row >
							<fo:table-cell border="0.1pt #000000 solid" >						
		         				<fo:block text-align="center" font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="1pt">        					
									Lf
								</fo:block>
								<fo:block text-align="center" font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="1pt">        					
									d.-
								</fo:block>
								<fo:block text-align="center" font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="1pt">        					
									Nr.
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="10pt" border="0.1pt #000000 solid" >						
		         				<fo:block  font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="2pt">        					
									1. Vorname
								</fo:block>
								<fo:block  font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="2pt">        					
									2. Nachname
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="10pt" border="0.1pt #000000 solid" >						
		         				<fo:block  font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="2pt">        					
									1. Schulname
								</fo:block>
								<fo:block  font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="2pt">        					
									2. Schulort
								</fo:block>
							</fo:table-cell>
							<fo:table-cell padding-left="2pt" border="0.1pt #000000 solid" >						
		         				<fo:block font-weight="bold" font-size="12pt" font-family="Times New Roman" padding-top="2pt" padding="2pt">      					
									Unterschrift
								</fo:block>
							</fo:table-cell>							
						</fo:table-row>
					<xsl:for-each select="Teilnehmer">
						<fo:table-row height="0.9cm">
							<fo:table-cell text-align="center" border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block font-size="10pt" font-family="Times New Roman" font-weight="bold">         					
									<xsl:number level="single" count="Teilnehmer" format="1 " />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">											
		         				<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="10pt" font-family="Times New Roman">         					
								1. 	<xsl:value-of select="Name" />
								</fo:block>
								<fo:block hyphenate="true"
							    hyphenation-character="!"
							    hyphenation-push-character-count="2"
							    hyphenation-remain-character-count="3"
							    language="de"
							    font-size="10pt" font-family="Times New Roman">         					
								2. <xsl:value-of select="Vorname" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block font-size="10pt" font-family="Times New Roman">         					
									1. <xsl:value-of select="Dienststelle" />		
								</fo:block>
								<fo:block font-size="10pt" font-family="Times New Roman">         					
									2. <xsl:value-of select="Ort_Dienst" />		
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						
		         				&#160;
							</fo:table-cell>
						</fo:table-row>
						</xsl:for-each>
						
						<fo:table-row height="0.5cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block  font-size="12pt" font-family="Times New Roman">         					
									...	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block  font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1.0cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1.0cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1.0cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1.0cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row height="1.0cm">
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						       				
								<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;	
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
<!--				<xsl:for-each select="Dozent">
						<fo:table-row height="0.9cm">
							<fo:table-cell text-align="center" border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:number level="single" count="Dozent" format="1 " />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:value-of select="Anrede" />&#160;<xsl:value-of select="Titel" /><xsl:if test="Titel!=''">&#160;</xsl:if><xsl:value-of select="Name" />, <xsl:value-of select="Vorname" />
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:value-of select="Dienststelle" />		
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">						
		         				<fo:block  font-size="9pt" font-family="Times New Roman">         					
									<xsl:value-of select="Strasse_Dienst" />&#160;<xsl:value-of select="PLZ_Dienst" />&#160;<xsl:value-of select="Ort_Dienst" />	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">					
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:value-of select="Email" />	
								</fo:block>
							</fo:table-cell>
						<fo:table-cell text-align="center" border="0.1pt #000000 solid" padding="1pt">					
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:if test="Uebernachtung=1">X</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" border="0.1pt #000000 solid" padding="1pt">					
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:if test="FreierTraeger=1">X</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell text-align="center" border="0.1pt #000000 solid" padding="1pt">					
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									<xsl:if test="FreierTraeger='0'">X</xsl:if>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border="0.1pt #000000 solid" padding="1pt">					
		         				<fo:block font-size="9pt" font-family="Times New Roman">         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:for-each>
	 			
						<fo:table-row>
						<fo:table-cell number-columns-spanned="9" height="0.5cm">					
		         				<fo:block >         					
									&#160;
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</xsl:if>	
					 -->
				</fo:table-body>
			</fo:table>
	</fo:block>
</fo:flow>
</fo:page-sequence>
</fo:root>

</xsl:template> 

</xsl:stylesheet>