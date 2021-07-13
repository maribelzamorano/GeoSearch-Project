package com.topdev.tsp.model.list.modules.personal_resources;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;


public class PersonalResourcesPersonal extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String name;
	String vorname;
	String nachname;
	String titel;
	String funktion;
	String funktion_code;
	String kategorie;
	String kategorie_code;
	String telefon;
	String email;
	String sprechzeiten;
	String bemerkung;
	String futr_id="0";
	
	public PersonalResourcesPersonal()								{				}
	public PersonalResourcesPersonal(String id)						{ setId(id);	}
	public PersonalResourcesPersonal(HashMap<String, String> map)	{ setData(map);	}
	
	
	
	public String getBemerkung()
	{
		return bemerkung;
	}
	public void setBemerkung(String bemerkung)
	{
		this.bemerkung = bemerkung;
	}
	public String getEmail()
	{
		return email;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}
	public String getFunktion()
	{
		return funktion;
	}
	public void setFunktion(String funktion)
	{
		this.funktion = funktion;
	}
	public String getFunktion_code()
	{
		return funktion_code;
	}
	public void setFunktion_code(String funktion_code)
	{
		this.funktion_code = funktion_code;
	}
	public String getFutr_id()
	{
		return futr_id;
	}
	public void setFutr_id(String futr_id)
	{
		this.futr_id = futr_id;
	}
	public String getKategorie()
	{
		return kategorie;
	}
	public void setKategorie(String kategorie)
	{
		this.kategorie = kategorie;
	}
	public String getKategorie_code()
	{
		return kategorie_code;
	}
	public void setKategorie_code(String kategorie_code)
	{
		this.kategorie_code = kategorie_code;
	}
	public String getNachname()
	{
		return nachname;
	}
	public void setNachname(String nachname)
	{
		this.nachname = nachname;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSprechzeiten()
	{
		return sprechzeiten;
	}
	public void setSprechzeiten(String sprechzeiten)
	{
		this.sprechzeiten = sprechzeiten;
	}
	public String getTelefon()
	{
		return telefon;
	}
	public void setTelefon(String telefon)
	{
		this.telefon = telefon;
	}
	public String getTitel()
	{
		return titel;
	}
	public void setTitel(String titel)
	{
		this.titel = titel;
	}
	public String getVorname()
	{
		return vorname;
	}
	public void setVorname(String vorname)
	{
		this.vorname = vorname;
	}
	
	

}