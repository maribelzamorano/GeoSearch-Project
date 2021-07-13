package com.topdev.tsp.model.list.modules.documents;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Documents extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String beschreibung;
	String typ;
	String dokumentart_code;
	String dokumentart_decode;
	String dokumentgruppe_code;
	String dokumentgruppe_decode;
	String groesse;
	String datum;
	String name;
	String dokumentFileName;
	String dokumentContentType;
	String dokument_id;
	ComplexList	gruppen_liste;

	public Documents(int style)								{ setStyle(style);					initSublists();  }
	public Documents(String id, int style)					{ setStyle(style); setId(id);		initSublists(); 	}
	public Documents(HashMap<String, String> map, int style){ setStyle(style); setData(map);	initSublists(); 	}

	public void initSublists()
	{
		gruppen_liste = new ComplexList();
		gruppen_liste.getHeadingList().add(new ComplexHeading("Gruppe"));
	}

	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry(getName(),					getId_entity(), 			getBeschreibung(),		"anla"));
		getEntries().add(new SimpleEntry("typ",						getTyp(),					"textfield"));
		getEntries().add(new SimpleEntry("groesse",					getGroesse(),				"textfield"));
		getEntries().add(new SimpleEntry("Letzte Aktualisierung",	getDatum(),					"textfield"));
	}

	public String getBeschreibung()
	{
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung)
	{
		this.beschreibung = beschreibung;
	}
	public String getDatum()
	{
		return datum;
	}
	public void setDatum(String datum)
	{
		this.datum = datum;
	}
	public String getDokumentart_code()
	{
		return dokumentart_code;
	}
	public void setDokumentart_code(String dokumentart_code)
	{
		this.dokumentart_code = dokumentart_code;
	}
	public String getDokumentart_decode()
	{
		return dokumentart_decode;
	}
	public void setDokumentart_decode(String dokumentart_decode)
	{
		this.dokumentart_decode = dokumentart_decode;
	}
	public String getGroesse()
	{
		return groesse;
	}
	public void setGroesse(String groesse)
	{
		this.groesse = groesse;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getTyp()
	{
		return typ;
	}
	public void setTyp(String typ)
	{
		this.typ = typ;
	}
	public String getDokumentContentType()
	{
		return dokumentContentType;
	}
	public void setDokumentContentType(String dokumentContentType)
	{
		this.dokumentContentType = dokumentContentType;
	}
	public String getDokumentFileName()
	{
		return dokumentFileName;
	}
	public void setDokumentFileName(String dokumentFileName)
	{
		this.dokumentFileName = dokumentFileName;
	}
	public String getDokument_id()
	{
		return dokument_id;
	}
	public void setDokument_id(String dokument_id)
	{
		this.dokument_id = dokument_id;
	}
	public String getDokumentgruppe_code()
	{
		return dokumentgruppe_code;
	}
	public void setDokumentgruppe_code(String dokumentgruppe_code)
	{
		this.dokumentgruppe_code = dokumentgruppe_code;
	}
	public String getDokumentgruppe_decode()
	{
		return dokumentgruppe_decode;
	}
	public void setDokumentgruppe_decode(String dokumentgruppe_decode)
	{
		this.dokumentgruppe_decode = dokumentgruppe_decode;
	}
	public ComplexList getGruppen_liste()
	{
		return gruppen_liste;
	}
	public void setGruppen_liste(ComplexList gruppen_liste)
	{
		this.gruppen_liste = gruppen_liste;
	}
}