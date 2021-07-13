package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Lizenz extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String bezeichnung;
    private String webseite;
    boolean dirty;
    
    

    
    
    
    
	public Lizenz()								{				}
	public Lizenz(String id)						{ setId(id);	}
	public Lizenz(HashMap<String, String> map)	{ setData(map);	}
	
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
		getEntries().add(new SimpleEntry("bezeichnung",			        getBezeichnung(),		    "textfield"));
		getEntries().add(new SimpleEntry("webseite",		            getWebseite(),				"textfield"));
	}
	public String getBezeichnung() {
        return bezeichnung;
    }
    public void setBezeichnung(String bezeichnung) {
        this.bezeichnung = bezeichnung;
    }
    public String getWebseite() {
        return webseite;
    }
    public void setWebseite(String webseite) {
        this.webseite = webseite;
    }
}