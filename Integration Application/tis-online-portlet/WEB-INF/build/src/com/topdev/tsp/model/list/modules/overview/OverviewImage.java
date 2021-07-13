package com.topdev.tsp.model.list.modules.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class OverviewImage extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String tbshDecode;
	String tbshCode;
	String groesse;
	String name;
	String geprueft;
	
	public OverviewImage()								{				}
	public OverviewImage(String id)						{ setId(id);	}
	public OverviewImage(HashMap<String, String> map)	{ setData(map);	}

	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		setEntries(new ArrayList<SimpleEntry>(10));
		
		getEntries().add(new SimpleEntry("tbsh_beschreibung",	getTbshDecode(),	"textfield"));
		getEntries().add(new SimpleEntry("name",				getName(),				"textfield"));
		getEntries().add(new SimpleEntry("groesse",				getGroesse(),			"textfield"));
		getEntries().add(new SimpleEntry("geprueft",			(getGeprueft()!=null && getGeprueft().equals("1"))?"abgeschlossen":"wird geprüft",
																"textfield"));
	}
	
	public String getGroesse()
	{
		return groesse;
	}
	public void setGroesse(String groesse)
	{
		this.groesse = groesse;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getGeprueft()
	{
		return geprueft;
	}
	public void setGeprueft(String geprueft)
	{
		this.geprueft = geprueft;
	}
	public String getTbshDecode() {
		return tbshDecode;
	}
	public void setTbshDecode(String tbshDecode) {
		this.tbshDecode = tbshDecode;
	}
	public String getTbshCode() {
		return tbshCode;
	}
	public void setTbshCode(String tbshCode) {
		this.tbshCode = tbshCode;
	}

}