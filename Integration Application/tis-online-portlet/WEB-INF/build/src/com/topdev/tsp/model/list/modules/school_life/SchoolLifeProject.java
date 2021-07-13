package com.topdev.tsp.model.list.modules.school_life;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;


public class SchoolLifeProject extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String eipr_bezeichnung;
	String eipr_beschreibung;
	String weitere_informationen;
	String wete_id;
	String faecher;
	String klassenstufen;

	ComplexList	sub_list1;
	ComplexList	sub_list2;
	
	public SchoolLifeProject()							{ initSublists(); }
	public SchoolLifeProject(String id)					{ setId(id); initSublists();	}
	public SchoolLifeProject(HashMap<String, String> map)	{ setData(map); initSublists();	}
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
	public void setFaecher(String faecher) {
		this.faecher = faecher;
	}
	public String getKlassenstufen() {
		return klassenstufen;
	}
	public void setKlassenstufen(String klassenstufen) {
		this.klassenstufen = klassenstufen;
	}
	

	public String getWete_id()
	{
		return wete_id;
	}
	public void setWete_id(String wete_id)
	{
		this.wete_id = wete_id;
	}
	
	public String getEipr_beschreibung() {
		return eipr_beschreibung;
	}
	public void setEipr_beschreibung(String eipr_beschreibung) {
		this.eipr_beschreibung = eipr_beschreibung;
	}
	public String getEipr_bezeichnung() {
		return eipr_bezeichnung;
	}
	public void setEipr_bezeichnung(String eipr_bezeichnung) {
		this.eipr_bezeichnung = eipr_bezeichnung;
	}
	public String getWeitere_informationen() {
		return weitere_informationen;
	}
	public void setWeitere_informationen(String weitere_informationen) {
		this.weitere_informationen = weitere_informationen;
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



	
}