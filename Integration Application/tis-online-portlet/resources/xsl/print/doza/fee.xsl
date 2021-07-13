<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="fee">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">


<!-- Header -->
        <fo:block margin-left="1cm" font-size="8pt">
        
                <fo:table table-layout="fixed">
                        <fo:table-column column-width="9cm"/>
                        <fo:table-column column-width="9cm"/>
                        <fo:table-body>
                                <fo:table-row>
                                        <fo:table-cell>

                                                        <fo:table table-layout="fixed">
                                                        <fo:table-column column-width="9cm"/>
                                                                <fo:table-body  >
                                                                        <fo:table-row>
                                                                                <fo:table-cell >						
                                                                                	<fo:block>
                                                                                		<fo:external-graphic height="80%" width="80%">
                                                                                			<xsl:attribute name="src">
															                                	<xsl:value-of select="logo" />
																							</xsl:attribute>
                                                                                		</fo:external-graphic>
                         																		
                                                                                	</fo:block>
                                                                                </fo:table-cell>
                                                                        </fo:table-row>
                                                                        <fo:table-row>
                                                                                <fo:table-cell padding-top="6pt" font-weight="bold">
                                                                                        <fo:block>Thüringer Institut für</fo:block>
                                                                                        <fo:block>Lehrerfortbildung, Lehrplanentwicklung und Medien</fo:block>
                                                                                        <fo:block>Heinrich-Heine-Allee 2-4, 99438 Bad Berka</fo:block>
                                                                                </fo:table-cell>
                                                                        </fo:table-row>
                                                                </fo:table-body>
                                                        </fo:table>
                                        </fo:table-cell>
                                        <fo:table-cell padding-top="10pt">
                                       		<fo:block border="0.1pt black solid" color="white" line-height="2cm">.</fo:block>
                                       		
                                       		
                                       		<fo:table table-layout="fixed">
                                                        <fo:table-column column-width="3cm"/>
                                                        <fo:table-column column-width="6cm"/>
                                                                <fo:table-body  >
                                                                        <fo:table-row>
                                                                                <fo:table-cell vertical-align="middle" colspan="2">
                                                                                	<fo:block font-size="8pt" padding-top="6pt" padding-bottom="6pt" font-weight="bold">Schulstempel</fo:block>
                                                                                </fo:table-cell>
                                                                        </fo:table-row>
                                                                        <fo:table-row>
                                                                                <fo:table-cell vertical-align="bottom">
																					<fo:block font-size="8pt" padding-top="8pt">
                                                                                		<fo:inline font-weight="bold">Schul-Nr.:</fo:inline>
                                                                                	</fo:block>
                                                                                </fo:table-cell>
                                                                                <fo:table-cell >
																					<fo:block>
																						<fo:block border="0.1pt black solid" color="white" line-height="1cm" >
																						.
																						</fo:block>
																					</fo:block>
                                                                                </fo:table-cell>
                                                                        </fo:table-row>
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                        
                                                                </fo:table-body>
                                        	</fo:table>
                                        	
                                        </fo:table-cell>
                                </fo:table-row>
                        </fo:table-body>
                </fo:table>
                <fo:block  text-align="center" font-size="20pt" font-weight="bold" padding-top="25pt" padding-bottom="10pt">Honorarvertrag - Budgetierung</fo:block>
	        		<fo:block>zwischen dem Land Thüringen,</fo:block>
					<fo:block>vertreten durch das Thüringer Kultusministerium (ThKM) und dieses</fo:block>
					<fo:block>vertreten durch das Thüringer Institut für Lehrerfortbildung, Lehrplanentwicklung und Medien (ThILLM)</fo:block>
					<fo:block  font-weight="bold" margin-left="2cm" padding-top="6">(Auftraggeber)</fo:block>
	        		<fo:block>und</fo:block>
	        		<fo:table table-layout="fixed">
		                <fo:table-column column-width="5cm"/>
		                <fo:table-column column-width="6cm"/>
		                        <fo:table-body>
		                                <fo:table-row>
		                                        <fo:table-cell vertical-align="middle">
		                                        	<fo:block>Frau/Herrn</fo:block>
		                                        </fo:table-cell>
		                                        <fo:table-cell >
		                                             <fo:block><xsl:value-of select="gepa_name_12"/></fo:block>
		                                        </fo:table-cell>
		                                </fo:table-row>
		                        </fo:table-body>
	                </fo:table>
	        		<fo:block font-weight="bold" margin-left="2cm" padding-top="6">(Auftragnehmer)</fo:block>
	        		<fo:table table-layout="fixed">
		                <fo:table-column column-width="5cm"/>
		                <fo:table-column column-width="6cm"/>
		                        <fo:table-body>
		                                <fo:table-row>
		                                        <fo:table-cell vertical-align="middle">
		                                        	<fo:block>Anschrift</fo:block>
		                                        		
		                                        	
		                                        </fo:table-cell>
		                                        <fo:table-cell >
		                                             <fo:block><xsl:value-of select="dien_ortv_name"/>, <xsl:value-of select="dien_strv_name"/></fo:block>
		                                        </fo:table-cell>
		                                </fo:table-row>
		                        </fo:table-body>
	                </fo:table>
        		
        		<fo:block padding-top="20pt">Zusändiges Finanzamt</fo:block>
        		<fo:block font-weight="bold" padding-top="5pt">wird folgende Vereinbarung getroffen:</fo:block>
        

<fo:block color="white">|</fo:block>
<fo:block color="white">|</fo:block>
<fo:block color="white">|</fo:block>
<fo:block margin-left="70pt">
	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;1.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					<fo:block>Der Auftragnehmer führt für den Auftraggeber die Fortbildungsveranstaltung </fo:block>
					<fo:block padding-top="8pt">
						<fo:table table-layout="fixed">
							<fo:table-column column-width="5cm"/>
							<fo:table-column column-width="4cm"/>
							<fo:table-column column-width="2cm"/>
							<fo:table-column column-width="2cm"/>
							<fo:table-column column-width="2cm"/>
							<fo:table-column column-width="2cm"/>
							<fo:table-body>
									<fo:table-row height="15pt">
											<fo:table-cell><fo:block>Nr.:</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>am</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>von</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>bis</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
									</fo:table-row>
									<fo:table-row height="15pt">
											<fo:table-cell><fo:block></fo:block></fo:table-cell>
											<fo:table-cell><fo:block>am</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>von</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>bis</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
									</fo:table-row>
									<fo:table-row height="15pt">
											<fo:table-cell><fo:block></fo:block></fo:table-cell>
											<fo:table-cell><fo:block>am</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>von</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>bis</fo:block></fo:table-cell>
											<fo:table-cell><fo:block>Uhr</fo:block></fo:table-cell>
									</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block padding-bottom="8pt">in:</fo:block>
				
					<fo:table table-layout="fixed">
						<fo:table-column column-width="2cm"/>
						<fo:table-column column-width="16cm"/>
						<fo:table-body>
							<fo:table-row height="15pt">
								<fo:table-cell>
									<fo:block wrap-option="no-wrap">zum Thema:</fo:block>
								</fo:table-cell>
								<fo:table-cell padding-bottom="10pt">
									<fo:block><xsl:value-of select="doza_thema"/></fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>

					<fo:block padding-bottom="10pt">durch.</fo:block>		
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>


	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;2.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>Der Auftragnehmer erhält für seine Tätigkeit</fo:block>
				<fo:block padding-top="7pt" padding-bottom="7pt">von
					<fo:inline color="white">________</fo:inline>
					Stunden
					<fo:inline color="white">________</fo:inline>
					zu je
					<fo:inline color="white">_________</fo:inline>
					EUR/Std.
				</fo:block>
				<fo:block  padding-bottom="7pt">
					ein Honorar in Höhe von<fo:inline color="white">______________________</fo:inline>EUR
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;3.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>Der Auftragnehmer erhält Reisekostenvergütung auf <fo:inline font-weight="bold">Antrag</fo:inline></fo:block>
				<fo:block>in entsprechender Anwendung des Thüringer Reisekostengesetzes in der jeweils gültigen Fassung.</fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;4.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>Die Beträge werden überwiesen auf</fo:block>
				<fo:block padding-top="7pt" padding-bottom="7pt">das Konto:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="gepa_kontonr"/></fo:block>
				<fo:block  padding-bottom="7pt">bei Kreditinstitut: <xsl:value-of select="gepa_bankbezeichnung"/></fo:block>
				<fo:block padding-bottom="7pt">BLZ:&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;<xsl:value-of select="gepa_blz"/></fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;5.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>Die steuer- und sozialversicherungsrechtliche Behandlung ist durch den Auftragnehmer selbst vorzunehmen.  </fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;6.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>Gemäß Mitteilungsverordnung vom 07.Sept. 1993 (BGBl I S.1554), zuletzt geändert durch VO vom 26.Mai 1999 (BGBI I S. 1077) §7 Abs. 2 ist der Auftraggeber verpflichtet, Mitteilung an das zuständige Finanzamt zu machen, wenn im Laufe eines Jahres über 1.500,00 EUR an den Auftragnehmer gezahlt wurden. </fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;7.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					Für vom Auftragnehmer zu vertretende Schäden, die im Zusammenhang mit der Durchführung der Veranstaltung auftreten, übernimmt der Auftraggeber 	keine Haftung.  
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;8.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					Das vereinbarte Honorar wird nur fällig, wenn die Veranstaltung tatsächlich durchgeführt wurde.  
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>&#160;&#160;9.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					Änderungen des Vertrages bedürfen der Schriftform.  
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>



	<fo:list-item>
			<fo:list-item-label start-indent="18mm"><fo:block>10.</fo:block></fo:list-item-label>
			<fo:list-item-body>
				<fo:block>
					Von diesem in zweifacher Ausfertigung erstellten Vertrag erhalten der Auftraggeber und der Auftragnehmer je eine Ausfertigung.
				</fo:block>
			</fo:list-item-body>
	</fo:list-item>
</fo:block>
<fo:block color="white">|</fo:block>
<fo:block color="white">|</fo:block>



<fo:block>
	<fo:table table-layout="fixed">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="3cm"/>
		<fo:table-column column-width="4cm"/>
		<fo:table-body>
				<fo:table-row>
						<fo:table-cell padding-bottom="10pt"><fo:block>Ort:</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>Ort:</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
				</fo:table-row>
				<fo:table-row>
						<fo:table-cell padding-bottom="10pt"><fo:block>Datum:</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>Datum:</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
				</fo:table-row>
				<fo:table-row>
						<fo:table-cell padding-bottom="10pt"><fo:block>Im Auftrag</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt">6#160;</fo:table-cell>
						<fo:table-cell padding-bottom="10pt">6#160;</fo:table-cell>
						<fo:table-cell padding-bottom="10pt">6#160;</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
						<fo:table-cell padding-bottom="10pt"><fo:block>(Vertreter des ThILLM)</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>Auftragnehmer:</fo:block></fo:table-cell>
						<fo:table-cell padding-bottom="10pt"><fo:block>______________________</fo:block></fo:table-cell>
				</fo:table-row>
		</fo:table-body>
	</fo:table>
</fo:block>
        
        
        
        
        
        </fo:block>
    </fo:flow>
   </fo:page-sequence>
  </fo:root>
 </xsl:template>
</xsl:stylesheet>