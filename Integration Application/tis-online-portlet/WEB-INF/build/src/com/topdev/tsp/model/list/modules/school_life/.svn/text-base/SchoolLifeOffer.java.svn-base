package com.topdev.tsp.model.list.modules.school_life;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;

public class SchoolLifeOffer extends ComplexEntryList 
{
	private static final long	serialVersionUID	= 1L;
	String foan_bezeichnung;
	String foan_beschreibung;
	String weitere_informationen;
	String foan_id;
	String faecher;
	String klassenstufen;

	ComplexList	sub_list1;
	ComplexList	sub_list2;		
	
	
	public SchoolLifeOffer()							{ initSublists(); }
	public SchoolLifeOffer(String id)					{ setId(id); initSublists();	}
	public SchoolLifeOffer(HashMap<String, String> map)	{ setData(map); initSublists();	}
	
	
	public void initSublists()
	{
		sub_list1 = new ComplexList();
		sub_list1.getHeadingList().add(new ComplexHeading("Fach/Faechergruppe"));

		sub_list2 = new ComplexList();
		sub_list2.getHeadingList().add(new ComplexHeading("Klassenstufe(n)"));
	}
	
	public String getFaecher() {
		return faecher;
	}
	public ComplexList getSub_list1() {
		return sub_list1;
	}
	public void setSub_list1(ComplexList sub_list1) {
		this.sub_list1 = sub_list1;
	}
	public ComplexList getSub_list2() {
		return sub_list2;
	}
	public void setSub_list2(ComplexList sub_list2) {
		this.sub_list2 = sub_list2;
	}
	public void setFaecher(String faecher) {
		this.faecher = faecher;
	}
	public String getKlassenstufen() {
		return klassenstufen;
	}
	public void setKlassenstufen(String klassenstufen) {
		this.klassenstufen = klassenstufen;
	}
	
	public String getFoan_id() {
		return foan_id;
	}
	public void setFoan_id(String foan_id) {
		this.foan_id = foan_id;
	}
	
	public String getFoan_beschreibung() {
		return foan_beschreibung;
	}
	public void setFoan_beschreibung(String foan_beschreibung) {
		this.foan_beschreibung = foan_beschreibung;
	}
	public String getFoan_bezeichnung() {
		return foan_bezeichnung;
	}
	public void setFoan_bezeichnung(String foan_bezeichnung) {
		this.foan_bezeichnung = foan_bezeichnung;
	}
	public String getWeitere_informationen() {
		return weitere_informationen;
	}
	public void setWeitere_informationen(String weitere_informationen) {
		this.weitere_informationen = weitere_informationen;
	}
	

	
}