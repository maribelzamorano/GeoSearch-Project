package com.topdev.tsp.model.list.modules.neuter_resources;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class NeuterResourcesHandicap extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String auar_code;
	String auar_decode;

	public NeuterResourcesHandicap()							{				}
	public NeuterResourcesHandicap(String id)					{ setId(id);	}
	public NeuterResourcesHandicap(HashMap<String, String> map)	{ setData(map);	}

	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("icon",			"handicap_"+getAuar_code()+".jpg",getAuar_decode(),"image"));
		getEntries().add(new SimpleEntry("handicap",		getAuar_code(),getAuar_decode(),"dropdown"));
	}

	public String getAuar_code()
	{
		return auar_code;
	}
	public void setAuar_code(String auar_code)
	{
		this.auar_code = auar_code;
	}
	public String getAuar_decode()
	{
		return auar_decode;
	}
	public void setAuar_decode(String auar_decode)
	{
		this.auar_decode = auar_decode;
	}
}