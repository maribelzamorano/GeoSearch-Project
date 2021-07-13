package com.topdev.tsp.model.list.modules.school_evolution;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;

public class EvolutionInstrument extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String instrument_art;
	String instrument_art_code;
	String beschreibung;
	String beteiligte;		//kommaseparierte Liste
	String anlagen_labels;
	String anlagen_ids;
	String kz_artikel;
	String url;
	HashMap<String,String> anlagen;
	
	private ComplexList	instrument_anla_liste;
	private ComplexList	instrument_beteiligte_liste;
	public EvolutionInstrument()							{ initSublists(); 				}
	public EvolutionInstrument(String id)					{ setId(id); initSublists();	}
	public EvolutionInstrument(HashMap<String, String> map)	{ setData(map); initSublists();	}

	public void initSublists()
	{
		instrument_anla_liste = new ComplexList();
		instrument_anla_liste.getHeadingList().add(new ComplexHeading("Dokument"));
		instrument_beteiligte_liste = new ComplexList();
		instrument_beteiligte_liste.getHeadingList().add(new ComplexHeading("Beteiligte"));
	}
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		anlagen = new HashMap<String,String>(5);
		if(anlagen_ids!=null && anlagen_labels!=null)
		{
			String[] labels	= anlagen_labels.split(",");
			String[] ids	= anlagen_ids.split(",");
			if(labels.length == ids.length) for(int i=0; i<ids.length; i++) anlagen.put(ids[i], labels[i]);
		}
	}

	public String getBeteiligte()
	{
		return beteiligte;
	}
	public void setBeteiligte(String beteiligte)
	{
		this.beteiligte = beteiligte;
	}

	public String getBeschreibung()
	{
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung)
	{
		this.beschreibung = beschreibung;
	}
	public HashMap<String, String> getAnlagen()
	{
		return anlagen;
	}
	public void setAnlagen(HashMap<String, String> anlagen)
	{
		this.anlagen = anlagen;
	}
	public String getAnlagen_ids()
	{
		return anlagen_ids;
	}
	public void setAnlagen_ids(String anlagen_ids)
	{
		this.anlagen_ids = anlagen_ids;
	}
	public String getAnlagen_labels()
	{
		return anlagen_labels;
	}
	public void setAnlagen_labels(String anlagen_labels)
	{
		this.anlagen_labels = anlagen_labels;
	}
	public ComplexList getInstrument_anla_liste()
	{
		return instrument_anla_liste;
	}
	public void setInstrument_anla_liste(ComplexList instrument_anla_liste)
	{
		this.instrument_anla_liste = instrument_anla_liste;
	}
	public ComplexList getInstrument_beteiligte_liste()
	{
		return instrument_beteiligte_liste;
	}
	public void setInstrument_beteiligte_liste(
			ComplexList instrument_beteiligte_liste)
	{
		this.instrument_beteiligte_liste = instrument_beteiligte_liste;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getInstrument_art()
	{
		return instrument_art;
	}
	public void setInstrument_art(String instrument_art)
	{
		this.instrument_art = instrument_art;
	}
	public String getInstrument_art_code()
	{
		return instrument_art_code;
	}
	public void setInstrument_art_code(String instrument_art_code)
	{
		this.instrument_art_code = instrument_art_code;
	}
	public String getKz_artikel() {
		return kz_artikel;
	}
	public void setKz_artikel(String kz_artikel) {
		this.kz_artikel = kz_artikel;
	}


}