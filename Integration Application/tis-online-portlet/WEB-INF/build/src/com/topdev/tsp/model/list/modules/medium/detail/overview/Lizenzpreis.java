package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Lizenzpreis extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String beschreibung;
	boolean dirty;
    
    

    
    
    
    
    
    
	public Lizenzpreis()							{				}
	public Lizenzpreis(String id)					{ setId(id);	}
	public Lizenzpreis(HashMap<String, String> map)	{ setData(map);	}
	
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
		getEntries().add(new SimpleEntry("beschreibung",			            getBeschreibung(),		    "textfield"));
		
	}
	public String getBeschreibung() {
        return beschreibung;
    }

    public void setBeschreibung(String beschreibung) {
        this.beschreibung = beschreibung;
    }
}