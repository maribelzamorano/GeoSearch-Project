package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class ISBN extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String bezeichnung;
	boolean dirty;
    
    

    
    
    
    public ISBN()					      		{				}
	public ISBN(String id)					    { setId(id);	}
	public ISBN(HashMap<String, String> map)	{ setData(map);	}
	
	public boolean isDirty() {
        return dirty;
    }
    
	public void setDirty(boolean dirty) {
        this.dirty = dirty;
    }
	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("bezeichnung",			getBezeichnung(),		"textfield"));
	}
	
    
	public String getBezeichnung() {
        return bezeichnung;
    }

    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }
}