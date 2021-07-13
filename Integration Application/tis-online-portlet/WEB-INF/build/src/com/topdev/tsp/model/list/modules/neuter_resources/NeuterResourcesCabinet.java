package com.topdev.tsp.model.list.modules.neuter_resources;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class NeuterResourcesCabinet extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String nutzungsprofil;
	String anzahl;
	
	public NeuterResourcesCabinet()								{				}
	public NeuterResourcesCabinet(String id)					{ setId(id);	}
	public NeuterResourcesCabinet(HashMap<String, String> map)	{ setData(map);	}
	
	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("nutzungsprofil",			getNutzungsprofil(),	"textfield"));
		getEntries().add(new SimpleEntry("anzahl",					getAnzahl(),			"textfield"));

	}
	
	public String getAnzahl() {
		return anzahl;
	}
	public void setAnzahl(String anzahl) {
		this.anzahl = anzahl;
	}
	public String getNutzungsprofil() {
		return nutzungsprofil;
	}
	public void setNutzungsprofil(String nutzungsprofil) {
		this.nutzungsprofil = nutzungsprofil;
	}

	

}