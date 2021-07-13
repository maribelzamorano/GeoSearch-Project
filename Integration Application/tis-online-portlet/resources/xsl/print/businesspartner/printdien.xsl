<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
  <xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes"/>
  <!-- ========================= -->
  <!-- root element: projectteam -->
  <!-- ========================= -->
  <xsl:template match="printdien">
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
								<fo:block text-align="center" font-size="10pt" font-weight="bold">
									Meine Daten
								</fo:block>
								<fo:block color="white" font-size="6pt">|</fo:block>
								<fo:block color="white" font-size="6pt">|</fo:block>
							</fo:block>
						</fo:table-cell>
						<!-- Rechter Kopfbereich -->
						<fo:table-cell padding-right="3pt" padding-top="3pt" padding-bottom="1pt">
							<fo:block text-align="right"><xsl:value-of select="repko_01r"/></fo:block>
							<fo:block text-align="right"><fo:inline color="white">|</fo:inline><xsl:value-of select="repko_02r"/></fo:block>
							<fo:block text-align="right"><xsl:value-of select="datum"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
	
<!-- ***** Tabelle ALLGEMEIN -->
				<fo:block padding-top="10pt" font-weight="bold">
					<xsl:apply-templates select="template_header_allgemein"/>
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
					<xsl:apply-templates select="template_header_detail"/>
				</fo:block>
				<fo:block padding-top="10pt">
					<fo:table table-layout="fixed">
						<fo:table-column column-width="4cm"/>
						<fo:table-column column-width="10cm"/>
						<fo:table-body>
							<xsl:apply-templates select="template_dien_nr"/>
							<xsl:apply-templates select="template_dien_kunden_nr"/>
							<xsl:apply-templates select="template_krei_bezeichnung"/>
							<xsl:apply-templates select="template_schu_bezeichnung"/>
							<xsl:apply-templates select="template_dien_anz_lehrer"/>								
							<xsl:apply-templates select="template_gepa__name_12_kontakt"/>								
							<xsl:apply-templates select="template_gepa__name_12_leiter"/>	
							<xsl:apply-templates select="template_gepa__name_12_traeger"/>															
						</fo:table-body>
					</fo:table>
				</fo:block>

<!-- ***** Tabelle DETAIL-KENNZEICHEN -->
			<fo:table table-layout="fixed" font-size="10pt" padding-top="10pt">
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>
				<fo:table-column column-width="4cm"/>				
				<fo:table-body>
					<fo:table-row>									
						<fo:table-cell padding-bottom="5pt" >
							<fo:block>
								<xsl:apply-templates select="template_label_dien_kz_freier_traeger"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom="5pt">
							<fo:block padding-left="50pt">
								<xsl:apply-templates select="template_dien_kz_freier_traeger"/>
							</fo:block>
						</fo:table-cell>						
						<fo:table-cell padding-bottom="5pt">
							<fo:block>
								<xsl:apply-templates select="template_label_dien_kz_ausbildungsort"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom="5pt">
							<fo:block padding-left="50pt">
								<xsl:apply-templates select="template_dien_kz_ausbildungsort"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>						
					<fo:table-row>									
						<fo:table-cell padding-bottom="5pt">
							<fo:block>
								<xsl:apply-templates select="template_label_dien_kz_anmeldung_an"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom="5pt">
							<fo:block padding-left="50pt">
								<xsl:apply-templates select="template_dien_kz_anmeldung_an"/>
							</fo:block>
						</fo:table-cell>						
						<fo:table-cell padding-bottom="5pt">
							<fo:block>
								<xsl:apply-templates select="template_label_dien_kz_kooperationspartner"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-bottom="5pt">
							<fo:block padding-left="50pt">
								<xsl:apply-templates select="template_dien_kz_kooperationspartner"/>
							</fo:block>
						</fo:table-cell>						
					</fo:table-row>						
				</fo:table-body>
			</fo:table>

<!-- ***** Tabelle BANKVERBINDUNG -->
				<fo:block padding-top="10pt" font-weight="bold">
					<xsl:apply-templates select="template_header_bankverbindung"/>
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

<!-- ***** Tabelle ANSCHRIFTEN -->
		<fo:block padding-top="10pt" font-weight="bold">
			<xsl:apply-templates select="template_header_anschrift"/>
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
								<xsl:apply-templates select="template_label_anar_bezeichnung"/> 
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_ortv_nation"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_plzv_nummer"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_ortv_name"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_cc_strasse"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_ansc_adresszusatz"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_ansc_kz_serienbrief"/>
							</fo:block>
						</fo:table-cell>
					</fo:table-row>
 					<xsl:apply-templates select="template_anschrift_daten"/> 
				</fo:table-body>
			</fo:table>
		</fo:block>
		
<!-- ***** Tabelle KOMMUNIKATION 	-->				
		<fo:block padding-top="15pt" font-weight="bold">
			<xsl:apply-templates select="template_header_kommunikation"/>
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
								<xsl:apply-templates select="template_label_koar_bezeichnung"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold">
								<xsl:apply-templates select="template_label_komm_verbindung"/>
							</fo:block>
						</fo:table-cell>
						<fo:table-cell padding-top="2pt" padding-left="2pt"  table-layout="fixed" border="0.1pt #000000 solid">
							<fo:block font-weight="bold" text-align="center">
								<xsl:apply-templates select="template_label_komm_kz_bevorzugt"/>
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
				<fo:block>
					<xsl:value-of select="label_gepa_art"/>
				</fo:block>
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
				<fo:block>
					<xsl:value-of select="label_gepa_name_1"/>
				</fo:block>
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
				<fo:block>
					<xsl:value-of select="label_gepa_name_2"/>
				</fo:block> 
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
				<fo:block>
					<xsl:value-of select="label_gepa_name_3"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa_name_3"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>




<!-- Templates zu DEATIL -->
	<xsl:template match="template_dien_nr">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_dien_nr"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="dien_nr"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_dien_kunden_nr">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_dien_kunden_nr"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="dien_kunden_nr"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_krei_bezeichnung">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_krei_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="krei_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_schu_bezeichnung">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_schu_bezeichnung"/>				
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="schu_bezeichnung"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_dien_anz_lehrer">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_dien_anz_lehrer"/>				
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="dien_anz_lehrer"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa__name_12_kontakt">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_gepa__name_12_kontakt"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa__name_12_kontakt"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa__name_12_leiter">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_gepa__name_12_leiter"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa__name_12_leiter"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>
	<xsl:template match="template_gepa__name_12_traeger">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_gepa__name_12_traeger"/>
				</fo:block>
			</fo:table-cell>
			<fo:table-cell padding-bottom="5pt">
				<fo:block padding-left="50pt">
					<xsl:value-of select="gepa__name_12_traeger"/>
				</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</xsl:template>

<!-- Templates zu DETAIL-KENNZEICHEN -->
	<xsl:template match="template_dien_kz_freier_traeger">
		<xsl:value-of select="dien_kz_freier_traeger"/>
	</xsl:template>			
	<xsl:template match="template_dien_kz_ausbildungsort">
		<xsl:value-of select="dien_kz_ausbildungsort"/>
	</xsl:template>
	<xsl:template match="template_dien_kz_anmeldung_an">
		<xsl:value-of select="dien_kz_anmeldung_an"/>
	</xsl:template>
	<xsl:template match="template_dien_kz_kooperationspartner">
		<xsl:value-of select="dien_kz_kooperationspartner"/>
	</xsl:template>

<!-- Templates zu BANKVERBINDUNG -->
	<xsl:template match="template_gepa_kontonr">
		<fo:table-row>
			<fo:table-cell padding-bottom="5pt">
				<fo:block>
					<xsl:value-of select="label_gepa_kontonr"/>				
				</fo:block>
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
				<fo:block>
					<xsl:value-of select="label_gepa_blz"/>
				</fo:block>
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
				<fo:block>
					<xsl:value-of select="label_gepa_bankbezeichnung"/>
				</fo:block>
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


<!--  Überschriften -->
<xsl:template match="template_header_allgemein">
		<xsl:value-of select="header_allgemein"/>
</xsl:template>
<xsl:template match="template_header_detail">
		<xsl:value-of select="header_detail"/>
</xsl:template>
<xsl:template match="template_header_bankverbindung">
		<xsl:value-of select="header_bankverbindung"/>
</xsl:template>
<xsl:template match="template_header_anschrift">
		<xsl:value-of select="header_anschrift"/>
</xsl:template>
<xsl:template match="template_header_kommunikation">
		<xsl:value-of select="header_kommunikation"/>
</xsl:template>


<xsl:template match="template_label_dien_kz_freier_traeger">
		<xsl:value-of select="label_dien_kz_freier_traeger"/>
</xsl:template>
<xsl:template match="template_label_dien_kz_ausbildungsort">
		<xsl:value-of select="label_dien_kz_ausbildungsort"/>
</xsl:template>
<xsl:template match="template_label_dien_kz_anmeldung_an">
		<xsl:value-of select="label_dien_kz_anmeldung_an"/>
</xsl:template>
<xsl:template match="template_label_dien_kz_kooperationspartner">
		<xsl:value-of select="label_dien_kz_kooperationspartner"/>
</xsl:template>

<!-- Anschiften -->
<xsl:template match="template_label_anar_bezeichnung">
	<xsl:value-of select="label_anar_bezeichnung"/>
</xsl:template>	
<xsl:template match="template_label_ortv_nation">
	<xsl:value-of select="label_ortv_nation"/>
</xsl:template>		
<xsl:template match="template_label_plzv_nummer">
	<xsl:value-of select="label_plzv_nummer"/>
</xsl:template>	
<xsl:template match="template_label_ortv_name">
	<xsl:value-of select="label_ortv_name"/>
</xsl:template>	
<xsl:template match="template_label_cc_strasse">
	<xsl:value-of select="label_cc_strasse"/>
</xsl:template>	
<xsl:template match="template_label_ansc_adresszusatz">
	<xsl:value-of select="label_ansc_adresszusatz"/>
</xsl:template>	
<xsl:template match="template_label_ansc_kz_serienbrief">
	<xsl:value-of select="label_ansc_kz_serienbrief"/> 
</xsl:template>

<!-- Kommunikation -->
<xsl:template match="template_label_koar_bezeichnung">
	<xsl:value-of select="label_koar_bezeichnung"/>
</xsl:template>	
<xsl:template match="template_label_komm_verbindung">
	<xsl:value-of select="label_komm_verbindung"/>
</xsl:template>		
<xsl:template match="template_label_komm_kz_bevorzugt">
	<xsl:value-of select="label_komm_kz_bevorzugt"/>
</xsl:template>	


	
	
	

</xsl:stylesheet>
