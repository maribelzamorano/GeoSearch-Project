<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="travel">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">
<!-- Header -->
	<fo:block margin-left="1cm">
		<fo:block text-align="right" font-size="8pt" padding-bottom="6pt">Seite 1 von 2</fo:block>
		<fo:table table-layout="fixed">
		 	<fo:table-column column-width="9cm"/>
			<fo:table-column column-width="2cm"/>
			<fo:table-column column-width="1cm"/>
			<fo:table-column column-width="8cm"/>
			<fo:table-body>
				<fo:table-row>
			        <fo:table-cell>
						<fo:block text-align="left" font-size="30pt" border="0.1pt black solid" color="white">|</fo:block>
					</fo:table-cell>
				    <fo:table-cell>
						<fo:block text-align="left"></fo:block>
					</fo:table-cell>
					<fo:table-cell font-size="8pt">
						<fo:block>An:</fo:block>
					</fo:table-cell>
					<fo:table-cell font-size="8pt">
						<fo:block>Thüringer Institut für Lehrerfortbildung,</fo:block>
						<fo:block>Lehrplanentwicklung und Medien</fo:block>
						<fo:block>Heinrich-Heine-Allee 2-4</fo:block>
						<fo:block>99438 Bad Berka</fo:block>
					</fo:table-cell>
				</fo:table-row>
				<fo:table-row>
					<fo:table-cell>
						<fo:block padding-top="4pt" text-align="left" font-size="8pt">
							Schulnummer     
							<fo:inline font-size="30">_ </fo:inline> 
							<fo:inline font-size="30">_ </fo:inline>
							<fo:inline font-size="30">_ </fo:inline>
							<fo:inline font-size="30">_ </fo:inline>
							<fo:inline font-size="30">_ </fo:inline>
							<fo:inline font-size="30">_ </fo:inline>
							<fo:inline font-size="30">_ </fo:inline>
							
						</fo:block>
					 </fo:table-cell>
					 <fo:table-cell>
					 </fo:table-cell>
					 <fo:table-cell>
					 </fo:table-cell>
				</fo:table-row>
					 
			</fo:table-body>
		</fo:table>
	</fo:block>





<!-- Überschrift -->
	<fo:block text-align="center" font-size="20pt" font-weight="bold" padding-top="25pt" padding-bottom="10pt">
		<fo:inline>
	  		<xsl:value-of select="ueberschrift"/>
		</fo:inline>
	</fo:block>




    <fo:block margin-left="5pt">

		<fo:block font-size="9pt" text-align="center">
			<xsl:apply-templates select="abschnitt0"/>
       	</fo:block>
		<fo:block font-size="9pt" text-align="center">
			<xsl:apply-templates select="abschnitt1"/>
       	</fo:block>
		<fo:block font-size="9pt" text-align="center">
			<xsl:apply-templates select="abschnitt2"/>
       	</fo:block>
		<fo:block font-size="9pt" text-align="center">
			<xsl:apply-templates select="abschnitt23"/>
       	</fo:block>

		<fo:block font-size="9pt" text-align="center">
			<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
				<fo:table-column column-width="18.4cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="left">
								Ich beantrage Reisekosten und Trennungsgeld anlässlich meiner Abordnung/Dienstreise  
    						</fo:block>
							<fo:block text-align="left">
								für die Zeit am/vom
								<fo:inline color="white">_____________________</fo:inline>
								bis<fo:inline color="white">_________________</fo:inline>
								in  
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
       	</fo:block>

		<fo:block font-size="9pt" text-align="center">
			<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
				<fo:table-column column-width="18.4cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>
							<fo:block text-align="left">
								Veranstaltungsnummer:
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
       	</fo:block>

		<fo:block font-size="9pt" text-align="center">
			<xsl:apply-templates select="abschnitt3"/>
     	</fo:block>

       	<fo:block font-size="9pt" text-align="left">
			<fo:table table-layout="fixed" border="0.1pt black solid">
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="3.4cm"/>
				<fo:table-column column-width="3.5cm"/>
				<fo:table-column column-width="3.5cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt" margin-left="0pt" padding-left="0pt">
<!--4::::::::::-->
							<fo:inline margin-left="5pt">
								<fo:block text-align="left" font-size="9pt">Reiseerläuterung</fo:block>
								<fo:block text-align="left" font-size="9pt" color="white">|</fo:block>
								<fo:block text-align="left" font-size="6pt">
									<fo:block>Bitte geben Sie den tatsächlichen</fo:block>
									<fo:block>Verlauf der Dienstreise an, weitere</fo:block>
									<fo:block>Angaben wie z.B.: Weiterfahrt zu</fo:block>
									<fo:block>einem anderen Geschäftsort,</fo:block>
									<fo:block>Dienstreise im Zusammenhang mit</fo:block>
									<fo:block>Nebentätigkeit, Nebenkosten,</fo:block>
									<fo:block>Begründung für das</fo:block>
									<fo:block>Benutzen des Taxis ggf. unter</fo:block>
									<fo:block>Erläuterung. Bei Auslandsreisen</fo:block>
									<fo:block>ist das jeweils zuletzt</fo:block>
									<fo:block>erreichte oder verlassene Land</fo:block>
									<fo:block padding-bottom="3pt">anzugeben.</fo:block>
								</fo:block>
							</fo:inline>
<!--5::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									1
								</fo:inline>
							</fo:block>
<!--6::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block padding-bottom="5pt">Beginn der Dienstreise an der</fo:block>
									<fo:block>[&#160;&#160;] Wohnung&#160;&#160;&#160;&#160; [&#160;&#160;] Dienststelle</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>in __________________________</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>am __________ um _________Uhr</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>mit _________________________</fo:block>
									<fo:block><fo:inline color="white">_______</fo:inline>Beförderungsmittel</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Fahrtkosten, Zuschläge,</fo:block>
									<fo:block>Gepäckkosten</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Ankunft am Dienstort</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block padding-bottom="3pt">am __________ um _________Uhr</fo:block>
								</fo:inline>
							</fo:block>
<!--7::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block>Beginn des Dienstgeschäftes</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>am __________ um _________Uhr</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Ende des Dienstgeschäftes</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block padding-bottom="3pt">am __________ um _________Uhr</fo:block>
								</fo:inline>
							</fo:block>

<!--8::::::::::-->

							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block>Abfahrt vom Dienstort</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>am __________ um _________Uhr</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>mit _________________________</fo:block>
									<fo:block><fo:inline color="white">_______</fo:inline>Beförderungsmittel</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Fahrtkosten, Zuschläge,</fo:block>
									<fo:block>Gepäckkosten</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Ende der Dienstreise an der</fo:block>
									<fo:block>[&#160;&#160;] Wohnung &#160;&#160;&#160;&#160;[&#160;&#160;] Dienststelle</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>in __________________________</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>am __________ um _________Uhr</fo:block>
								</fo:inline>
							</fo:block>
						</fo:table-cell>


















						<fo:table-cell border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt" margin-left="0pt" padding-left="0pt">
<!--4::::::::::-->
							<fo:inline margin-left="5pt">
								<fo:block text-align="left" font-size="9pt" >Fahrtkosten</fo:block>
								<fo:block text-align="left" font-size="9pt" color="white">|</fo:block>
								<fo:block text-align="left" font-size="6pt" >
									<fo:block>a) Fahrkarte usw.</fo:block>
									<fo:block>b) Zuschläge</fo:block>
									<fo:block>c) Bettkarte</fo:block>
									<fo:block>d) Platzkarte</fo:block>
									<fo:block>e) Fahrtkosten</fo:block>
									<fo:block padding-bottom="43.5pt">&#160;&#160;&#160;     am Wohn- / Dienstort</fo:block>
								</fo:block>
							</fo:inline>
<!--5::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									2
								</fo:inline>
							</fo:block>
<!--6::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>EUR</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--7::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--8::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>EUR</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
								</fo:inline>
							</fo:block>
						</fo:table-cell>

						
						
						
						
						
						
						
						
						
						
						
						
						
						
						

						








<!--#############################################################Landwegstrecken-->

						<fo:table-cell border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt" margin-left="0pt" padding-left="0pt">
<!--4::::::::::-->
							<fo:inline margin-left="5pt">
								<fo:block text-align="left" font-size="9pt">Landwegstrecken</fo:block>
								<fo:block text-align="left" font-size="9pt" color="white">|</fo:block>
								<fo:block text-align="left" font-size="6pt">
									<fo:block>a) Kfz</fo:block>
									<fo:block>[&#160;&#160;]</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>b) Fahrrad</fo:block>
									<fo:block>[&#160;&#160;]</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:block>
							</fo:inline>
<!--5::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									3
								</fo:inline>
							</fo:block>
<!--6::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>km</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--7::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--8::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>km</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
								</fo:inline>
							</fo:block>
						</fo:table-cell>















						
						
						
						
						
						
						
						
						

						









<!--#############################################################Nebenkosten-->
						<fo:table-cell border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt" margin-left="0pt" padding-left="0pt">
<!--4::::::::::-->
							<fo:inline margin-left="5pt">
								<fo:block text-align="left" font-size="9pt">Nebenkosten</fo:block>
								<fo:block text-align="left" font-size="9pt" color="white">|</fo:block>
								<fo:block text-align="left" font-size="6pt">
									<fo:block>(unter Erläuterung</fo:block>
									<fo:block>aufführen)</fo:block>
									<fo:block>bei Gepäck</fo:block>
									<fo:block>Gewicht in</fo:block>
									<fo:block>kg angeben;</fo:block>
									<fo:block>sonst den</fo:block>
									<fo:block>Betrag</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:block>
							</fo:inline>
<!--5::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									4
								</fo:inline>
							</fo:block>
<!--6::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>kg</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>EUR</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--7::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--8::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>kg</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>__________</fo:block>
									<fo:block>EUR</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
								</fo:inline>
							</fo:block>
						</fo:table-cell>

























						
						
						
						
						
						
						
						
						

						









<!--#############################################################-->
						<fo:table-cell border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt" margin-left="0pt" padding-left="0pt">
<!--4::::::::::-->
							<fo:inline margin-left="5pt">
								<fo:block text-align="left" font-size="6pt">
									<fo:block>[&#160;&#160;] Während der Abordnung bin</fo:block>
									<fo:block>ich täglich an den Wohnort</fo:block>
									<fo:block>zurückgekehrt</fo:block>
									<fo:block>Reisekostenabrechnung für jeden</fo:block>
									<fo:block>Tag auf weiterem Abrechnungs-</fo:block>
									<fo:block>formular vornehmen.</fo:block>
									<fo:block color="white" padding-bottom="57pt">|</fo:block>
								</fo:block>
							</fo:inline>
<!--5::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block>Mitfahrer/in 1 ____________ km </fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>___________________________</fo:block>
									<fo:block>Name<fo:inline color="white">____________</fo:inline>Unterschrift</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Mitfahrer/in 2 ____________ km </fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>___________________________</fo:block>
									<fo:block>Name<fo:inline color="white">____________</fo:inline>Unterschrift</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Mitfahrer/in 3 ____________ km </fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>___________________________</fo:block>
									<fo:block padding-bottom="6.1pt">Name<fo:inline color="white">____________</fo:inline>Unterschrift   </fo:block>

								</fo:inline>
							</fo:block>
<!--7::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>Ich war Mitfahrer bei</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block>_______________ _________</fo:block>
									<fo:block><fo:inline>Name</fo:inline><fo:inline color="white">____________</fo:inline>km</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white" padding-bottom="3pt">|</fo:block>
								</fo:inline>
							</fo:block>
<!--8::::::::::-->
							<fo:block border-top="0.1pt black solid" padding-bottom="3pt"></fo:block>
							<fo:block text-align="left" font-size="6pt" margin-left="5pt">
								<fo:inline padding-left="5pt">
									<fo:block color="white">|</fo:block>
									<fo:block>Erläuterung</fo:block>
									<fo:block>(z.B. triftige Gründe für die Benutzung </fo:block>
									<fo:block>des privaten PKW gemäß § 6.1 ThürKG)</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
									<fo:block color="white">|</fo:block>
								</fo:inline>
							</fo:block>
						</fo:table-cell>










						
						
						
						
						
						
						

					</fo:table-row>
				</fo:table-body>
			</fo:table>
       	</fo:block>

	
	
	
	




	
	</fo:block>
        </fo:flow>
      </fo:page-sequence>

	  <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body">
        	<fo:block text-align="right" font-size="8pt" padding-bottom="6pt">Seite 2 von 2</fo:block>
			<fo:block border="0.1pt black solid">
				<fo:block margin-left="1cm" >
					<fo:block color="white">|</fo:block>
					<fo:block>Trennungsgeld</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block font-size="8pt">[&#160;&#160;] Unterkunft des Amtes wegen</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block font-size="8pt">[&#160;&#160;] Vollverpflegung des Amtes wegen</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block>
						<fo:table table-layout="fixed"  font-size="8pt">
							<fo:table-column column-width="7cm"/>
							<fo:table-column column-width="12cm"/>
							<fo:table-body>
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="left">[&#160;&#160;] Teilmahlzeiten wurden bereitgestellt am</fo:block>
										<fo:block>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Frühstück</fo:block>
										<fo:block>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Mittag</fo:block>
										<fo:block>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;Abendbrot</fo:block>
										<fo:block color="white">|</fo:block>
									</fo:table-cell>

									<fo:table-cell>
										<fo:block>
											<fo:table table-layout="fixed">
												<fo:table-column column-width="1.3cm"/>
												<fo:table-column column-width="1.3cm"/>
												<fo:table-column column-width="1.3cm"/>
												<fo:table-column column-width="1.3cm"/>
												<fo:table-column column-width="1.3cm"/>
												<fo:table-body>
													<fo:table-row>
														<fo:table-cell><fo:block>1.</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>2.</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>3.</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>4.</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>5.Tag</fo:block></fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
													</fo:table-row>
													<fo:table-row>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
														<fo:table-cell><fo:block>[&#160;&#160;]</fo:block></fo:table-cell>
													</fo:table-row>
												</fo:table-body>
											</fo:table>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell>
										<fo:block text-align="left">[&#160;&#160;] Selbstunterbringer</fo:block>
									</fo:table-cell>
									<fo:table-cell>
										<fo:block>[&#160;&#160;] Selbstverpfleger</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</fo:table-body>
						</fo:table>
					</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block font-size="8pt">Die bereitgestellte [&#160;&#160;] Unterkunft [&#160;&#160;] Verpflegung habe ich nicht in Anspruch genommen weil:</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block color="white">|</fo:block>
				</fo:block>
			</fo:block>
			<xsl:apply-templates select="abschnitt4"/>
			<fo:block border="0.1pt black solid">
				<fo:block margin-left="1cm" font-size="8pt">
					<fo:block color="white">|</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block font-size="8pt">Ich versichere die Richtigkeit der Angaben. Die angesetzten Kosten sind mir wirklich entstanden.</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block color="white">|</fo:block>
					<fo:block>
						__________________
						<fo:inline color="white">______________</fo:inline>
						__________________________
					</fo:block>
					<fo:block>
						<fo:inline color="white">______</fo:inline>Datum
						<fo:inline color="white">____________________________</fo:inline>
						Unterschrift
					</fo:block>
					<fo:block color="white">|</fo:block>
				</fo:block>
			</fo:block>
	    </fo:flow>

      </fo:page-sequence>

    </fo:root>
  </xsl:template>




  
<!-- ========================= -->
<!-- abschnitt0                -->
<!-- ========================= -->
<xsl:template match="abschnitt0">
	<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="6cm"/>
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="4.4cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell>
					<fo:block text-align="left">
						Antragsteller:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="a2"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						Landesbedienstete(r):
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						[&#160;&#160;] ja  [&#160;&#160;] nein
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>




  
<!-- ========================= -->
<!-- abschnitt1                -->
<!-- ========================= -->
<xsl:template match="abschnitt1">
	<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="6cm"/>
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="4.4cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell>
					<fo:block text-align="left">
						Dienstort:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="a2"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						Telefon (dienstl.):
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="a4"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>




  
<!-- ========================= -->
<!-- abschnitt2                -->
<!-- ========================= -->
<xsl:template match="abschnitt2">
	<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="6cm"/>
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="4.4cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell>
					<fo:block text-align="left">
						PLZ, Wohnort, Straße, Nr.:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="a2"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>




  
<!-- ========================= -->
<!-- abschnitt2                -->
<!-- ========================= -->
<xsl:template match="abschnitt3">
	<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="14.4cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell>
					<fo:block text-align="left">
						Thema:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="thema"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>



  
<!-- ========================= -->
<!-- abschnitt23                -->
<!-- ========================= -->
<xsl:template match="abschnitt23">
	<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="3pt" padding-bottom="3pt">
		<fo:table-column column-width="4cm"/>
		<fo:table-column column-width="14.4cm"/>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell>
					<fo:block text-align="left">
						Thema:
					</fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block text-align="left">
						<xsl:value-of select="thema"/>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>




  
<!-- ========================= -->
<!-- abschnitt4                -->
<!-- ========================= -->
<xsl:template match="abschnitt4">
	<fo:block border="0.1pt black solid">
		<fo:block margin-left="1cm">
			<fo:table table-layout="fixed" border="0.1pt black solid" padding-top="10pt" padding-bottom="3pt">
					<fo:table-column column-width="6cm"/>
					<fo:table-column column-width="6cm"/>
					<fo:table-column column-width="6cm"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell height="15pt">
								<fo:block text-align="left" font-size="8pt">
									Meine Bankverbindung
								</fo:block>
							</fo:table-cell>
							<fo:table-cell height="15pt">
								
							</fo:table-cell>
							<fo:table-cell height="15pt">
							
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell height="15pt">
								<fo:block text-align="left" font-size="8pt">
									Kontonummer
								</fo:block>
							</fo:table-cell>
							<fo:table-cell height="15pt">
								<fo:block text-align="left" font-size="8pt">
									Bankleitzahl
								</fo:block>
							</fo:table-cell>
							<fo:table-cell height="15pt">
								<fo:block text-align="left" font-size="8pt">
									bei
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						
						<fo:table-row>
							<fo:table-cell height="20pt">
								<fo:block text-align="left" font-size="8pt">
									<xsl:value-of select="a1"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell height="20pt"> 
								<fo:block text-align="left" font-size="8pt">
									<xsl:value-of select="a2"/>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell height="20pt">
								<fo:block text-align="left" font-size="8pt">
									<xsl:value-of select="a3"/>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
		</fo:block>
</xsl:template>

</xsl:stylesheet>
