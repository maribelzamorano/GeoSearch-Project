package com.topdev.tsp.model.list.modules.school_life;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;


public class SchoolLifeContest extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String wett_bezeichnung;
	String wett_bezeichnung_code;
	String wete_id;
	String kategorie;
	String kategorie_code;

	public String getKategorie() {
		return kategorie;
	}
	public void setKategorie(String kategorie) {
		this.kategorie = kategorie;
	}
	public String getKategorie_code() {
		return kategorie_code;
	}
	public void setKategorie_code(String kategorie_code) {
		this.kategorie_code = kategorie_code;
	}
	public SchoolLifeContest()								{				}
	public SchoolLifeContest(String id)						{ setId(id);	}
	public SchoolLifeContest(HashMap<String, String> map)	{ setData(map);	}
	

	public String getWett_bezeichnung() {
		return wett_bezeichnung;
	}
	public void setWett_bezeichnung(String wett_bezeichnung) {
		this.wett_bezeichnung = wett_bezeichnung;
	}
	public String getWett_bezeichnung_code() {
		return wett_bezeichnung_code;
	}
	public void setWett_bezeichnung_code(String wett_bezeichnung_code) {
		this.wett_bezeichnung_code = wett_bezeichnung_code;
	}
	public String getWete_id()
	{
		return wete_id;
	}
	public void setWete_id(String wete_id)
	{
		this.wete_id = wete_id;
	}
	
}