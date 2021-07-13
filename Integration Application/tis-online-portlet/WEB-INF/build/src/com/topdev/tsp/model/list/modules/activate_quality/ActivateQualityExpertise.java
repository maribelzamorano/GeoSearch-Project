package com.topdev.tsp.model.list.modules.activate_quality;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;

public class ActivateQualityExpertise extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	
	String beschreibung;
	String sortierung;
	String wiqu_id;
	
	
	public ActivateQualityExpertise()								{				}
	public ActivateQualityExpertise(String id)						{ setId(id);	}
	public ActivateQualityExpertise(HashMap<String, String> map)	{ setData(map);	}
	
	public String getBeschreibung() {
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}
	public String getSortierung() {
		return sortierung;
	}
	public void setSortierung(String sortierung) {
		this.sortierung = sortierung;
	}
	public String getWiqu_id() {
		return wiqu_id;
	}
	public void setWiqu_id(String wiqu_id) {
		this.wiqu_id = wiqu_id;
	}
	


}