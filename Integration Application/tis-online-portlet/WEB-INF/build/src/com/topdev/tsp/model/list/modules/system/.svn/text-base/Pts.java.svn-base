package com.topdev.tsp.model.list.modules.system;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Pts extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String objekt;
	String schulbezeichnung;
	String schulnummer;
	String letzte_aenderung;
	String ort;
	String gepa_id;
	

	public Pts()							{				}
	public Pts(String id)					{ setId(id);	}
	public Pts(HashMap<String, String> map)	{ setData(map);	}
	
	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		if(gepa_id!=null)
		{
			getEntries().add( new SimpleEntry("name1", objekt,				"textfield"));
			getEntries().add( new SimpleEntry("name4", letzte_aenderung,	"textfield"));
		}
		else
		{
			SimpleEntry se = new SimpleEntry("entry", "link");
			se.setDecode(schulnummer);
			se.setCode("ptsAction('"+getId_entity()+"','"+getId()+"')");
			getEntries().add( se );
			
			getEntries().add( new SimpleEntry("name2", schulbezeichnung,	"textfield"));
			getEntries().add( new SimpleEntry("name1", objekt,				"textfield"));
			getEntries().add( new SimpleEntry("name4", letzte_aenderung,	"textfield"));
		}
	}
	
	public String getLetzte_aenderung()
	{
		return letzte_aenderung;
	}
	public void setLetzte_aenderung(String letzte_aenderung)
	{
		this.letzte_aenderung = letzte_aenderung;
	}
	public String getObjekt()
	{
		return objekt;
	}
	public void setObjekt(String objekt)
	{
		this.objekt = objekt;
	}
	public String getSchulbezeichnung()
	{
		return schulbezeichnung;
	}
	public void setSchulbezeichnung(String schulbezeichnung)
	{
		this.schulbezeichnung = schulbezeichnung;
	}
	public String getSchulnummer()
	{
		return schulnummer;
	}
	public void setSchulnummer(String schulnummer)
	{
		this.schulnummer = schulnummer;
	}
	public String getGepa_id()
	{
		return gepa_id;
	}
	public void setGepa_id(String gepa_id)
	{
		this.gepa_id = gepa_id;
	}
	public String getOrt()
	{
		return ort;
	}
	public void setOrt(String ort)
	{
		this.ort = ort;
	}


}