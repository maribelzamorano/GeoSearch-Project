<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="printpers">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="1cm" margin-right="2cm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="simpleA4">
        <fo:flow flow-name="xsl-region-body" font-size="10pt">
        
<!-- ***** KOPFBEREICH -->
			<fo:table table-layout="fixed" border="0.1pt #000000 solid" font-size="8pt">
				<fo:table-column column-width="5cm"/>
				<fo:table-column column-width="9cm"/>
				<fo:table-column column-width="5cm"/>
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
								<fo:block text-align="center" font-size="10pt" font-weight="bold">Meine Daten</fo:block>
								<fo:block color="white" font-size="6pt">|</fo:block>
								<fo:block color="white" font-size="6pt">|</fo:block>
							</fo:block>
						</fo:table-cell>
						<!-- Rechter Kopfbereich -->
						<fo:table-cell padding-right="3pt" padding-top="3pt" padding-bottom="3pt">
							<fo:block text-align="right"><xsl:value-of select="repko_01r"/></fo:block>
							<fo:block text-align="right"><fo:inline color="white">|</fo:inline><xsl:value-of select="repko_02r"/></fo:block>
							<fo:block text-align="right"><xsl:value-of select="datum"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
	
<!-- ***** Tabelle ALLGEMEIN -->
				<fo:block padding-top="10pt" font-weight="bold">
					Allgemein
				</fo:block>
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-body>
								<xsl:apply-templates select="template_gepa_art"/>
								<xsl:apply-templates select="template_gepa_name_1"/>
								<xsl:apply-templates select="template_gepa_name_2"/>
								<xsl:apply-templates select="template_gepa_name_3"/>
						</fo:table-body>
					</fo:table>
				</fo:block>
				
<!-- ***** Tabelle DETAIL -->
				<fo:block padding-top="10pt" font-weight="bold">
					Detail
				</fo:block>
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-body>
							<xsl:apply-templates select="template_pers_personalnummer"/>
							<xsl:apply-templates select="template_pers_geburtsjahr"/>
							<xsl:apply-templates select="template_gesch_code"/>
							<xsl:apply-templates select="template_pers_titel"/>
							<xsl:apply-templates select="template_dibe_bezeichnung"/>								
						</fo:table-body>
					</fo:table>
				</fo:block>


<!-- ***** Tabelle BANKVERBINDUNG -->
			<fo:block padding-top="10pt" font-weight="bold">
				Bankverbindung
			</fo:block>
			<fo:block padding-top="10pt">
				<fo:table table-layout="fixed">
					<fo:table-column column-width="4cm"/>
					<fo:table-column column-width="10cm"/>
					<fo:table-body>
						<xsl:apply-templates select="template_gepa_kontonr"/>
						<xsl:apply-templates select="template_gepa_blz"/>
						<xsl:apply-templates select="template_gepa_bankbezeichnung"/>
					</fo:table-body>
				</fo:table>
			</fo:block>


<!-- ***** Tabelle DOZENTENREFERENZEN -->
				<fo:block padding-top="10pt" font-weight="bold">
					<xsl:apply-templates select="template_dozent_angebot"/>
				</fo:block>
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="10cm"/>
						<fo:table-column column-width="4cm"/>
						<fo:table-body>
							<xsl:apply-templates select="template_pers_kz_priv_adr_oeffentlich"/>							
						</fo:table-body>
					</fo:table>
				</fo:block>
				<fo:block padding-top="0pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-body>
							<xsl:apply-templates select="template_pers_reda_referenzen"/>
						</fo:table-body>
					</fo:table>
				</fo:block>
				
<!-- ***** Tabelle ANSCHRIFTEN -->
		<fo:block padding-top="10pt" font-weight="bold">
			Anschrift
		</fo:block>
		
		<fo:block padding-top="5pt">
			<fo:table>
				<fo:table-column column-width="3cm"/>
				<fo:table-column column-width="1cm"/>
				<fo:table-column column-width="1.5cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="3.5cm"/>
				<fo:table-column column-width="2cm"/>	
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Art
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Land
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								PLZ
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Ort
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Straße
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Adreßzusatz
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Serienbrief
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
 					<xsl:apply-templates select="template_anschrift_daten"/> 
				</fo:table-body>
			</fo:table>
		</fo:block>
		
<!-- ***** Tabelle KOMMUNIKATION 	-->				
		<fo:block padding-top="15pt" font-weight="bold">
			Kommunikation
		</fo:block>
		<fo:block padding-top="10pt">
			<fo:table>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="13cm"/>
				<fo:table-column column-width="2cm"/>	
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Art
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								Verbindung
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold" text-align="center">
								bevorzugt
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
					<xsl:apply-templates select="template_kommunikation_daten"/>
				</fo:table-body>
			</fo:table>
		</fo:block>		
		
		
				</fo:flow>
   			</fo:page-sequence>
		</fo:root>
	</xsl:template>
 
<!-- ****************************************************************************************-->

<!-- Templates zu ALLGEMEIN -->
	<xsl:template match="template_gepa_art">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Geschäftspartnerart:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_art"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa_name_1">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Name:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_name_1"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa_name_2">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Vorname</fo:block> <!--  Name_2 -->
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_name_2"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa_name_3">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block></fo:block> <!--  Name_3 -->
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_name_3"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Templates zu DEATIL -->
	<xsl:template match="template_pers_personalnummer">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Personalnummer:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="pers_personalnummer"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_pers_geburtsjahr">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Geburtsjahr:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="pers_geburtsjahr"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gesch_code">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Geschlecht:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gesch_code"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_pers_titel">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Titel:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="pers_titel"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_dibe_bezeichnung">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Dienstbezeichnung:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="dibe_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_dien__name_12">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Dienststelle:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="dien__name_12"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Template zu Dozentenangebot -->
	<xsl:template match="template_dozent_angebot">
		<xsl:value-of select="dozent_header"/>
	</xsl:template>
	<xsl:template match="template_pers_kz_priv_adr_oeffentlich">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="dozent_label"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="dozent_value"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>	
	</xsl:template>	
	<xsl:template match="template_pers_reda_referenzen">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="dozent_label"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="dozent_value"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>	
	</xsl:template>
	

	


<!-- Templates zu BANKVERBINDUNG -->
	<xsl:template match="template_gepa_kontonr">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Konto:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_kontonr"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa_blz">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>BLZ:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_blz"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa_bankbezeichnung">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>Geldinstitut:</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_bankbezeichnung"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Templates zu Tabelle ANSCHIFTEN Daten-->

	<xsl:template match="template_anschrift_daten">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="anar_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="ortv_nation"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="plzv_nummer"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="ortv_name"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="cc_strasse"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="ansc_adresszusatz"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt" table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="center">
 					<xsl:value-of select="ansc_kz_serienbrief"/> 
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Templates zu Tabelle KOMMUNIKATION Daten -->

	<xsl:template match="template_kommunikation_daten">
		<fo:table-row>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="koar_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block>
					<xsl:value-of select="komm_verbindung"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
				<fo:block text-align="center">
					<xsl:value-of select="komm_kz_bevorzugt"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

</xsl:stylesheet>
