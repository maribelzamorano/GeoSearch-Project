package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Urheber extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String urheberFunktionCode;
    private String urheberFunktionDecode;
    private String urheberFunktionZusatz;
    private String bezeichnung;
    boolean dirty;
    
    

    
    
    
	public Urheber()								{				}
	public Urheber(String id)						{ setId(id);	}
	public Urheber(HashMap<String, String> map)	{ setData(map);	}
	
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
		getEntries().add(new SimpleEntry("bezeichnung",			            getBezeichnung(),		                "textfield"));
		getEntries().add(new SimpleEntry("urheberFunktionDecode",				getUrheberFunktionDecode(),				"dropdown"));
		getEntries().add(new SimpleEntry("urheberFunktionCode",            getUrheberFunktionCode(),        "dropdown"));
		getEntries().add(new SimpleEntry("urheberFunktionsZusatz",		getUrheberFunktionZusatz(),				"textfield"));
	}
	public String getUrheberFunktionCode() {
        return urheberFunktionCode;
    }
    public void setUrheberFunktionCode(String urheberFunktionCode) {
        this.urheberFunktionCode = urheberFunktionCode;
    }
    public String getUrheberFunktionDecode() {
        return urheberFunktionDecode;
    }
    public void setUrheberFunktionDecode(String urheberFunktionDecode) {
        this.urheberFunktionDecode = urheberFunktionDecode;
    }
    public String getUrheberFunktionZusatz() {
        return urheberFunktionZusatz;
    }
    public void setUrheberFunktionZusatz(String urheberFunktionZusatz) {
        this.urheberFunktionZusatz = urheberFunktionZusatz;
    }
    public String getBezeichnung() {
        return bezeichnung;
    }
    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }
}