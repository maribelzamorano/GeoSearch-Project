<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="beda_detail">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body" font-size="10pt">
        
        
        
<!-- ################ HEADER #################################-->

			<fo:table table-layout="fixed" border="0.1pt #000000 solid" font-size="8pt" font-family="Helvetica">
				<fo:table-column column-width="5cm"/>
				<fo:table-column column-width="9cm"/>
				<fo:table-column column-width="5cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-left="3pt" padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="left"><xsl:value-of select="repko_01l"/></fo:block>
							<fo:block text-align="left"><xsl:value-of select="repko_02l"/></fo:block>
							<fo:block text-align="left"><xsl:value-of select="repko_03l"/></fo:block>
						</fo:table-cell>
						<fo:table-cell>
							<fo:block  border-left="0.1pt #000000 solid"  border-right="0.1pt #000000 solid"  padding-top="3pt" padding-bottom="3pt">
								<fo:block text-align="center" font-size="10pt" font-weight="bold">Bedarfsmeldung</fo:block>
								<fo:block color="white" font-size="8pt">|</fo:block>
								<fo:block color="white" font-size="6.5pt">|</fo:block>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-right="3pt" padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="right"><xsl:value-of select="repko_01r"/></fo:block>
							<fo:block text-align="right"><fo:inline color="white">|</fo:inline><xsl:value-of select="repko_02r"/></fo:block>
							<fo:block text-align="right"><xsl:value-of select="datum"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
<!-- ################ DETAIL-Daten #################################-->			
			<fo:block padding-top="20pt" font-family="Helvetica">
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="15.75cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="beschreibung"/>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			
			<fo:block font-family="Helvetica">
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="5cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="2.75cm"/>
					<fo:table-column column-width="2cm"/>
					<fo:table-column column-width="2.75cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="erstellt_von"/>
							<xsl:apply-templates select="erstellt_am"/>								
							<xsl:apply-templates select="status"/>								
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>

			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="2cm"/>
					<fo:table-column column-width="1cm"/>
					<fo:table-column column-width="2cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="0.75cm"/>
					<fo:table-column column-width="2cm"/>
					<fo:table-column column-width="4.75cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="termin_von"/>
							<xsl:apply-templates select="termin_bis"/>								
							<xsl:apply-templates select="teilnehmer"/>								
							<xsl:apply-templates select="anbieter"/>																	
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="5cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="7.5cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="gueltigkeitsbereich"/>
							<xsl:apply-templates select="veranstaltungsart"/>								
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>					
			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="5cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="7.5cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="fortbildungsart"/>
							<xsl:apply-templates select="zielgruppe"/>								
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>										
			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="5cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="7.5cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="ansprechpartner"/>
							<xsl:apply-templates select="vorname"/>								
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>										
			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="5cm"/>
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="7.5cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="telefon"/>
							<xsl:apply-templates select="email"/>								
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>										
			<fo:block>
				<fo:table table-layout="fixed" font-size="10pt" >
					<fo:table-column column-width="3.25cm"/>
					<fo:table-column column-width="15.75cm"/>
					<fo:table-body>
						<fo:table-row>		
							<xsl:apply-templates select="kommentar"/>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
<!-- ################ DETAIL-Tabellen #################################-->			

			<xsl:apply-templates select="stichworte"/>	
			<xsl:apply-templates select="schularten"/>		
			<xsl:apply-templates select="schwerpunkte"/>	
			<xsl:apply-templates select="fachrichtungen"/>
			<xsl:apply-templates select="kommentare_weitere"/>							

			</fo:flow>	
		</fo:page-sequence>	
	</fo:root>
</xsl:template>




<!--  Templates für Detailbereich -->
	<xsl:template match="erstellt_von">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				erstellt von:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="GEPA_XNAME_12"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="erstellt_am">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				am:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_PTS_ERSTELLT"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="status">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Status:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BMST_DECODE"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="beschreibung">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Beschreibung:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_BESCHREIBUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>

	<xsl:template match="termin_von">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Zeitraum:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_TERMIN_VON"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="termin_bis">
		<fo:table-cell padding-bottom="5pt"  padding-left="2pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				bis:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_TERMIN_BIS"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="teilnehmer">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Teilnehmer:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_RESERVIERUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="anbieter">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Anbieter:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="MAND_BESCHREIBUNG_ANBIETER"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="gueltigkeitsbereich">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Gültigkeitsbereich:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="GUEB_BEZEICHNUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	<xsl:template match="veranstaltungsart">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Veranstaltungsart:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="VERR_BEZEICHNUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>	

	<xsl:template match="fortbildungsart">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Fortbildungsart:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="FOAR_BEZEICHNUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="zielgruppe">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Zielgruppe:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="ZIGR_BEZEICHNUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>	

	<xsl:template match="ansprechpartner">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Ansprechpartner:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_GEPA_NAME_1"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="vorname">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Vorname:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_GEPA_NAME_2"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>	

	<xsl:template match="telefon">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Telefon:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_KOMM_TELEFON"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>
	
	<xsl:template match="email">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				E-Mail:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_KOMM_EMAIL"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>	

	<xsl:template match="kommentar">
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block font-weight="bold" font-style="italic">
				Kommentar:
			</fo:block>
		</fo:table-cell>
		<fo:table-cell padding-bottom="5pt" table-layout="fixed" border="0.0pt #000000 solid">
			<fo:block padding-left="50pt">
				<xsl:value-of select="BEDA_BEMERKUNG"/>
			</fo:block>
		</fo:table-cell>
	</xsl:template>	



	<xsl:template match="stichworte">
		<fo:block padding-top="15pt" font-size="11pt">Stichwörter</fo:block>
  		<fo:block padding-top="5pt">
			<fo:table table-layout="fixed">
				<fo:table-column column-width="19cm"/>
				<fo:table-body>					
					<fo:table-row>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-size="10pt" font-weight="bold">
			 					Stichwort 
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="stichwort"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
 	<xsl:template match="stichwort">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block font-size="10pt">
 					<xsl:value-of select="STIC_BEZEICHNUNG"/> 
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
  	</xsl:template>
	
	<xsl:template match="schularten">
		<fo:block padding-top="15pt" font-size="11pt">Schularten</fo:block>
  		<fo:block padding-top="5pt">
			<fo:table>
				<fo:table-column column-width="1.5cm"/>
				<fo:table-column column-width="17.5cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="center" font-weight="bold" font-size="10pt">
								primär
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								Schulart
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="schulart"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
 	<xsl:template match="schulart">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="center" font-size="10pt">
					<xsl:value-of select="SCHU_KZ_PRIMAER"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="left" font-size="10pt">
					<xsl:value-of select="SCHU_BEZEICHNUNG"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
  	</xsl:template>		
	
	<xsl:template match="schwerpunkte">
		<fo:block padding-top="15pt" font-size="11pt">Schwerpunkte</fo:block>
  		<fo:block padding-top="5pt">
			<fo:table>
				<fo:table-column column-width="1.5cm"/>
				<fo:table-column column-width="17.5cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="center" font-weight="bold" font-size="10pt">
								primär
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								Schwerpunkt
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="schwerpunkt"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>		
 	<xsl:template match="schwerpunkt">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="center" font-size="10pt">
					<xsl:value-of select="BESW_KZ_PRIMAER"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="left" font-size="10pt">
					<xsl:value-of select="DIME_BEZEICHNUNG"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
  	</xsl:template>	

	<xsl:template match="fachrichtungen">	  		
		<fo:block padding-top="15pt" font-size="11pt">Fachrichtungen</fo:block>
  		<fo:block padding-top="5pt">
			<fo:table>
				<fo:table-column column-width="1.5cm"/>
				<fo:table-column column-width="17.5cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="center" font-weight="bold" font-size="10pt">
								primär
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								Fachrichtung
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="fachrichtung"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>
 	<xsl:template match="fachrichtung">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block  text-align="center" font-size="10pt">
					<xsl:value-of select="BEFA_KZ_PRIMAER"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block  text-align="left" font-size="10pt">
					<xsl:value-of select="FACH_BEZEICHNUNG"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
  	</xsl:template>  	
		
	<xsl:template match="kommentare_weitere">
		<fo:block padding-top="15pt" font-size="11pt">Kommentare</fo:block>
  		<fo:block padding-top="5pt">
			<fo:table>
				<fo:table-column column-width="19cm"/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block text-align="left" font-weight="bold" font-size="10pt">
								Kommentare
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
 					<xsl:apply-templates select="kommentar_weitere"/>
				</fo:table-body>
			</fo:table>
		</fo:block>
	</xsl:template>	
 	<xsl:template match="kommentar_weitere">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block  text-align="left" font-size="10pt">
					<xsl:value-of select="BEAW_BESCHREIBUNG"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
  	</xsl:template>  	
	  	
</xsl:stylesheet>
