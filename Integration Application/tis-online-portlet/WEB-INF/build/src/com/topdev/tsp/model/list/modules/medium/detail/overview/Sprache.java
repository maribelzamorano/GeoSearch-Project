package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Sprache extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String code;
    private String decode;
    private String sprachergaenzungCode;
    private String sprachergaenzungDeCode;
    boolean dirty;
    
    

    

	public Sprache()							{				}
	public Sprache(String id)					{ setId(id);	}
	public Sprache(HashMap<String, String> map)	{ setData(map);	}
	
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
		getEntries().add(new SimpleEntry("decode",			getDecode(),		"dropdown"));
		getEntries().add(new SimpleEntry("sprachergaenzungDeCode",				getSprachergaenzungDeCode(),				"dropdown"));
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
    public String getSprachergaenzungCode() {
        return sprachergaenzungCode;
    }
    public void setSprachergaenzungCode(String sprachergaenzungCode) {
        this.sprachergaenzungCode = sprachergaenzungCode;
    }
    public String getSprachergaenzungDeCode() {
        return sprachergaenzungDeCode;
    }
    public void setSprachergaenzungDeCode(String sprachergaenzungDeCode) {
        this.sprachergaenzungDeCode = sprachergaenzungDeCode;
    }
}