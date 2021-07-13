package com.topdev.tsp.model.list.modules.system;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Contest extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String sort;
	String bezeichnung;
	String kategorie;
	String kategorie_code;
	String kz_veraltet;

	public Contest()							{				}
	public Contest(String id)					{ setId(id);	}
	public Contest(HashMap<String, String> map)	{ setData(map);	}
	
	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		getEntries().add( new SimpleEntry("name0", sort,		"textfield"));
		getEntries().add( new SimpleEntry("name1", bezeichnung,	"textfield"));
		getEntries().add( new SimpleEntry("name2", kategorie,	"textfield"));
		getEntries().add( new SimpleEntry("name4", kz_veraltet,	"checkbox"));
	}
	public String getBezeichnung()
	{
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung)
	{
		this.bezeichnung = bezeichnung;
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
	public String getKz_veraltet()
	{
		return kz_veraltet;
	}
	public void setKz_veraltet(String kz_veraltet)
	{
		this.kz_veraltet = kz_veraltet;
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