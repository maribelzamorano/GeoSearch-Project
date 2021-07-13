package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Klassifikation extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String code;
    private String decode;
    boolean dirty;
    
    

    
    public Klassifikation()							{				}
	public Klassifikation(String id)					{ setId(id);	}
	public Klassifikation(HashMap<String, String> map)	{ setData(map);	}
	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("code",            getCode(),          "dropdown"));
		getEntries().add(new SimpleEntry("decode",			getDecode(),		"dropdown"));
	}
	
    public boolean isDirty() {
        return dirty;
    }
    public void setDirty(boolean dirty) {
        this.dirty = dirty;
    }
    
	public String getCode() {
        return code;
    }
    public void setCode(String code) {
        this.code = code;
    }
    public String getDecode() {
        return decode;
    }
    public void setDecode(String decode) {
        this.decode = decode;
    }
}