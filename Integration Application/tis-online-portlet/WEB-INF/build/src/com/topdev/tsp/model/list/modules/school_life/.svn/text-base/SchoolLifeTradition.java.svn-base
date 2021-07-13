package com.topdev.tsp.model.list.modules.school_life;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;


public class SchoolLifeTradition extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String		trad_bezeichnung;
	String		trad_beschreibung;
	String		weitere_informationen;
	String		trad_id;
	String 		faecher;
	String 		klassenstufen;

	ComplexList	sub_list1;
	ComplexList	sub_list2;
	
	public SchoolLifeTradition()							{ initSublists(); }
	public SchoolLifeTradition(String id)					{ setId(id); initSublists();	}
	public SchoolLifeTradition(HashMap<String, String> map)	{ setData(map); initSublists();	}
	public void initSublists()
	{
		sub_list1 = new ComplexList();
		sub_list1.getHeadingList().add(new ComplexHeading("Fach/Faechergruppe"));

		sub_list2 = new ComplexList();
		sub_list2.getHeadingList().add(new ComplexHeading("Klassenstufe(n)"));
	}

	
	public String getTrad_beschreibung() {
		return trad_beschreibung;
	}
	public void setTrad_beschreibung(String trad_beschreibung) {
		this.trad_beschreibung = trad_beschreibung;
	}
	public String getTrad_bezeichnung() {
		return trad_bezeichnung;
	}
	public void setTrad_bezeichnung(String trad_bezeichnung) {
		this.trad_bezeichnung = trad_bezeichnung;
	}
	public String getTrad_id()
	{
		return trad_id;
	}
	public void setTrad_id(String trad_id)
	{
		this.trad_id = trad_id;
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
	public String getWeitere_informationen()
	{
		return weitere_informationen;
	}
	public void setWeitere_informationen(String weitere_informationen)
	{
		this.weitere_informationen = weitere_informationen;
	}
	public String getFaecher() {
		return faecher;
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
}