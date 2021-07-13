package com.topdev.tsp.model.list.modules.system;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Project extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String bezeichnung;
	String art;
	String art_code;
	String kz_veraltet;
	String sort;

	public Project()							{				}
	public Project(String id)					{ setId(id);	}
	public Project(HashMap<String, String> map)	{ setData(map);	}
	
	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		getEntries().add( new SimpleEntry("name0", sort,							"textfield"));
		getEntries().add( new SimpleEntry("name1", getId_entity(),					"textfield"));
		getEntries().add( new SimpleEntry("name1", art,								"textfield"));
		getEntries().add( new SimpleEntry("name1", bezeichnung,						"textfield"));
		getEntries().add( new SimpleEntry("name4", kz_veraltet,						"checkbox"));
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
	public String getSort()
	{
		return sort;
	}
	public void setSort(String sort)
	{
		this.sort = sort;
	}
	public String getArt() {
		return art;
	}
	public void setArt(String art) {
		this.art = art;
	}
	public String getArt_code() {
		return art_code;
	}
	public void setArt_code(String art_code) {
		this.art_code = art_code;
	}

}