package com.topdev.tsp.model.list.modules.cooperation;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class CooperationContributer extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String titel;
	String vorname;
	String nachname;
	String funktion;
	String funktion_code;
	String erreichbarkeit;
	String kategorie;
	String kategorie_code;
	String futr_id;

	public CooperationContributer()								{				}
	public CooperationContributer(String id)					{ setId(id);	}
	public CooperationContributer(HashMap<String, String> map)	{ setData(map);	}

	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		getEntries().add(new SimpleEntry("name",			getTitel()+" "+getVorname()+" "+getNachname(),	"textfield"));
		getEntries().add(new SimpleEntry("funktion",		getFunktion(),									"textfield"));
		getEntries().add(new SimpleEntry("erreichbarkeit",	getErreichbarkeit(),							"textfield"));
	}
	
	public String getErreichbarkeit()
	{
		return erreichbarkeit;
	}
	public void setErreichbarkeit(String erreichbarkeit)
	{
		this.erreichbarkeit = erreichbarkeit;
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