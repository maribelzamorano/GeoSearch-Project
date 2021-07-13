package com.topdev.tsp.model.list.modules.working_group;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;


public class WorkingGroup extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String inhalt;
	String anzahl_wochenstunden;
	String anzahl_gruppen;
	String anzahl_schueler;
	String anzahl_weiblich;
	String kategorie;
	String kategorie_code;
	//String cell;
	//String cell_odd;
	

	public WorkingGroup()								{				}
	public WorkingGroup(String id)						{ setId(id);	}
	public WorkingGroup(HashMap<String, String> map)	{ setData(map);	}
	
	
	public String getAnzahl_gruppen() {
		return anzahl_gruppen;
	}
	public void setAnzahl_gruppen(String anzahl_gruppen) {
		this.anzahl_gruppen = anzahl_gruppen;
	}
	public String getAnzahl_schueler() {
		return anzahl_schueler;
	}
	public void setAnzahl_schueler(String anzahl_schueler) {
		this.anzahl_schueler = anzahl_schueler;
	}
	public String getAnzahl_weiblich() {
		return anzahl_weiblich;
	}
	public void setAnzahl_weiblich(String anzahl_weiblich) {
		this.anzahl_weiblich = anzahl_weiblich;
	}
	public String getAnzahl_wochenstunden() {
		return anzahl_wochenstunden;
	}
	public void setAnzahl_wochenstunden(String anzahl_wochenstunden) {
		this.anzahl_wochenstunden = anzahl_wochenstunden;
	}
	public String getInhalt() {
		return inhalt;
	}
	public void setInhalt(String inhalt) {
		this.inhalt = inhalt;
	}
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

	
	
	

}