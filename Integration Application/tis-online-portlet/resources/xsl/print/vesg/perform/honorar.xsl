<?xml version="1.0" encoding="iso-8859-1" ?> 
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" exclude-result-prefixes="fo">
<xsl:output method="xml" version="1.0" omit-xml-declaration="no" indent="yes" /> 
<xsl:decimal-format name="de" decimal-separator="," grouping-separator="."/>

<xsl:template match="Dozent">
<fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<fo:layout-master-set>
		<fo:simple-page-master master-name="simpleA4" page-height="29.7cm" page-width="21cm" margin-top="0.6cm" margin-bottom="0.5cm" margin-left="2cm" margin-right="2cm">
			<fo:region-body margin-top="1.2cm" margin-bottom="1.2cm"/> 
			<fo:region-before extent="3.5cm"/>
		</fo:simple-page-master>
	</fo:layout-master-set>
	<fo:page-sequence master-reference="simpleA4">
		<fo:static-content flow-name="xsl-region-before">
			<fo:block padding-bottom="0pt"><!-- =================== Kopfbereich ========================== --></fo:block>
		</fo:static-content>		

	<fo:flow flow-name="xsl-region-body" font-size="9pt">
	<fo:block font-family="Helvetica" font-size="11pt">
     	<fo:block font-size="14pt" text-align="center" font-weight="bold">
			HONORARVEREINBARUNG
		</fo:block>
     	<fo:block white-space-collapse='false'>
Zwischen dem
<xsl:value-of select="MAND_BESCHREIBUNG"/>
Bereich Fort- und Weiterbildung
<xsl:value-of select="MAND_CC_STRASSE"/>&#160; 
<xsl:value-of select="MAND_PLZV_NUMMER"/>&#160;<xsl:value-of select="MAND_ORTV_NAME"/>
		</fo:block>
		<fo:block text-align="right">- Auftraggeber -</fo:block>
		<fo:block padding-bottom="10pt">und</fo:block>
		<fo:block><xsl:value-of select="Anrede"/>&#160;<xsl:value-of select="Titel"/></fo:block>
		<fo:block><xsl:value-of select="Vorname"/>&#160;<xsl:value-of select="Name"/></fo:block>
		<fo:block><xsl:value-of select="Strasse"/>&#160;<xsl:value-of select="Hausnr"/></fo:block>
		<fo:block><xsl:value-of select="PLZ"/>&#160;<xsl:value-of select="Wohnort"/></fo:block>
		<fo:block text-align="right">- Auftragnehmer(-in) -</fo:block>
		<fo:block>wird folgende Honorarvereinbarung geschlossen:</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 1</fo:block>
		<fo:block>Der Auftragnehmer/Die Auftragnehmerin erbringt selbständig folgende Leistung:</fo:block>
		<fo:block>
			<fo:table table-layout="auto" padding-top="10pt" padding-bottom="10pt">   
		        <fo:table-column column-width="5cm"/>
		        <fo:table-column/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>						
			      			<fo:block font-weight="bold">
								Maßnahme:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="Thema"/></fo:block>
							<fo:block padding-top="5px"><xsl:value-of select="Veranstaltungsnummer"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>						
			      			<fo:block font-weight="bold">
								Ort:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="LGOB_NAME"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>						
			      			<fo:block font-weight="bold">
								Zeit:
							</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="VESG_BEGINN_ZEIT"/> Uhr bis  <xsl:value-of select="VESG_ENDE_ZEIT"/> Uhr</fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block>einschließlich der hierfür notwendigen Vor- und Nachbereitung.</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 2</fo:block>
		<fo:block>Für die Erbringung der Leistung zahlt der Auftraggeber dem Auftragnehmer als Vergütung</fo:block>
		<fo:block>ein Honorar in Höhe von</fo:block>
		<fo:block padding-top="10pt" white-space-collapse='false'>                       &#160;<xsl:value-of select="format-number(Honorar,'#.##0,00','de')"/> Euro</fo:block>
		<fo:block padding-bottom="10pt" white-space-collapse='false'>                       &#160;(in Worten: ........................................................  Euro).</fo:block>
		<fo:block>Die Vergütung wird auf der Grundlage der VV-Honorare des Ministeriums für Bildung, Ju-</fo:block>
		<fo:block>gend und Sport in der jeweils geltenden Fassung vereinbart. Für die Erbringung der Leistung</fo:block>
		<fo:block>wird folgender Zeitaufwand berücksichtigt:</fo:block>
		<fo:block white-space-collapse='false' padding-top="10pt" padding-bottom="10pt" text-decoration="underline">Durchführung  	           <xsl:value-of select="STD"/> Zeiteinheiten</fo:block>
		<fo:block>Je Zeiteinheit (45 Min) werden <xsl:value-of select="format-number(HS,'#.##0,00','de')"/> Euro gewährt. Hieraus ergibt sich die Vergütung.</fo:block>
		<fo:block>Mit ihr sind alle dem Auftragnehmer entstehenden Aufwendungen und Steuern abgegolten.</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 3</fo:block>
		<fo:block>Die Zahlung erfolgt brutto nach Erbringung der Leistung und Bestätigung durch den Auftrag</fo:block>
		<fo:block>Auftraggeber auf folgende Bankverbindung:</fo:block>
		<fo:block>
			<fo:table table-layout="auto" padding-top="10pt" padding-bottom="10pt">   
		        <fo:table-column column-width="3cm"/>
		        <fo:table-column/>
		        <fo:table-column column-width="3cm"/>
		        <fo:table-column/>
				<fo:table-body>
					<fo:table-row>
						<fo:table-cell>						
			      			<fo:block>Kontoinhaber:</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="Anrede"/> <xsl:value-of select="Titel"/><xsl:if test="Titel=''">&#160;</xsl:if><xsl:value-of select="Vorname"/>&#160;<xsl:value-of select="Name"/></fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block>Kontonummer:</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="Kontonummer"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
					<fo:table-row>
						<fo:table-cell>						
			      			<fo:block>Kreditinstitut:</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="Bank"/></fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block>Bankleitzahl:</fo:block>
						</fo:table-cell>
						<fo:table-cell>						
			      			<fo:block><xsl:value-of select="BLZ"/></fo:block>
						</fo:table-cell>
					</fo:table-row>
				</fo:table-body>
			</fo:table>
		</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 4</fo:block>
		<fo:block white-space-collapse="false">Vergütungen (Honorare) sind steuerpflichtiges Entgelt und unterliegen der Steuererklärungs-
pflicht sowie ggf. der Sozialversicherungspflicht. Der Auftragnehmer ist verpflichtet, nach
Maßgabe der für ihn geltenden rechtlichen Vorschriften über die durch diese Honorarverein-
barung erzielten Einkünfte Angaben gegenüber den zuständigen Behörden zu machen. Der 
Auftraggeber ist verpflichtet, nach Maßgabe der Mitteilungsverordnung (MV) vom 07.09.1993 
zuletzt geändert durch das Dritte Gesetz für moderne Dienstleistungen am Arbeitsmarkt vom 
23.12.2003, dem zuständigen Finanzamt schriftlich zu melden, wenn die an einen Empfän-
ger geleisteten Zahlungen mindestens 1.500 Euro pro Jahr betragen und der Zahlungsempfän-
ger nicht im Rahmen einer land- und forstwirtschaftlichen, gewerblichen oder freiberuflichen 
Haupttätigkeit gehandelt hat. Wiederkehrende Bezüge sind unabhängig von der Höhe zu 
melden. Die Mitteilung an das Finanzamt wird die Behörde, die anordnende Stelle, das Ak-
tenzeichen, den Zahlungsempfänger, Grund, Höhe und Tag der Zahlung sowie das Geburts-
datum erhalten.</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 5</fo:block>
		<fo:block white-space-collapse="false">Die unterzeichnenden Parteien sind sich darüber einig, dass mit dieser Vereinbarung kein
Arbeitsverhältnis oder sonstiges wirtschaftliches und persönliches Abhängigkeitsverhältnis 
begründet wird. Der Auftragnehmer ist nicht gegen die Folgen von Arbeitsunfällen versichert, 
eine Sozialversicherung entsteht aus dieser Vereinbarung nicht.

Der Auftragnehmer (sofern er im öffentlichen Dienst beschäftigt ist) verpflichtet sich, die ar-
beits- bzw. dienstrechtlichen Vorschriften über Nebentätigkeiten zu beachten.

Der Auftragnehmer verpflichtet sich, die vereinbarte Leistung in eigener unternehmerischer 
Sorgfalt auszuführen. Dabei hat er zugleich auch die Interessen des Auftraggebers zu be-
rücksichtigen. Der Auftragnehmer versichert, die für die Erbringung der Leistung notwendige 
fachliche Kompetenz und Qualifikation mitzubringen.</fo:block>
		<fo:block text-align="center" padding-top="10pt" padding-bottom="10pt">§ 6</fo:block>
		<fo:block white-space-collapse="false">Änderungen und Ergänzungen dieses Vertrages sowie Nebenabreden bedürfen der Schrift-
form.


Jede unterzeichnende Partei hat eine Ausfertigung der Vereinbarung erhalten. 


<xsl:value-of select="MAND_ORTV_NAME"/>, den <xsl:value-of select="../Datum"/>

Im Auftrag



<fo:table table-layout="auto">   
	<fo:table-column column-width="7.5cm"/>
	<fo:table-column/>
	<fo:table-body>
		<fo:table-row>
			<fo:table-cell><fo:block>___________________________</fo:block></fo:table-cell>
			<fo:table-cell><fo:block>___________________________</fo:block></fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell><fo:block>(Auftraggeber)</fo:block><fo:block padding-top="3px"><xsl:value-of select="MAND_BESCHREIBUNG"/></fo:block></fo:table-cell>
			<fo:table-cell><fo:block>(Auftragnehmer)</fo:block></fo:table-cell>
		</fo:table-row>
	</fo:table-body>
</fo:table>

</fo:block>
		<fo:block></fo:block>
		<fo:block></fo:block>
	</fo:block>


</fo:flow>
</fo:page-sequence>
</fo:root>
</xsl:template>
</xsl:stylesheet>