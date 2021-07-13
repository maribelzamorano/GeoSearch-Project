package com.topdev.tsp.model.list.modules.system;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Instrument extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String bezeichnung;
	String beschreibung;
	String url;
	String kz_veraltet;
	String sort;

	public Instrument()								{				}
	public Instrument(String id)					{ setId(id);	}
	public Instrument(HashMap<String, String> map)	{ setData(map);	}
	
	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		getEntries().add( new SimpleEntry("name0", sort,							"textfield"));
		getEntries().add( new SimpleEntry("name1", getId_entity(),					"textfield"));
		getEntries().add( new SimpleEntry("name1", bezeichnung,						"textfield"));
		getEntries().add( new SimpleEntry("name2", beschreibung,					"textfield"));
//		getEntries().add( new SimpleEntry("name3", "window.open('"+url+"');", url, 	"link"));
		getEntries().add( new SimpleEntry("name4", kz_veraltet,						"checkbox"));
	}
	
	public String getBeschreibung()
	{
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung)
	{
		this.beschreibung = beschreibung;
	}
	public String getBezeichnung()
	{
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung)
	{
		this.bezeichnung = bezeichnung;
	}
	public String getKz_veraltet()
	{
		return kz_veraltet;
	}
	public void setKz_veraltet(String kz_veraltet)
	{
		this.kz_veraltet = kz_veraltet;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getSort()
	{
		return sort;
	}
	public void setSort(String sort)
	{
		this.sort = sort;
	}

}