package com.topdev.tsp.model.list.modules.school_intention;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;


public class ForeignLanguage extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String code;
	String decode;
	
	public ForeignLanguage()							{				}
	public ForeignLanguage(String id)					{ setId(id);	}
	public ForeignLanguage(HashMap<String, String> map)	{ setData(map);	}

	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		SimpleEntry se = new SimpleEntry("entry",getDecode(),"textfield");
		getEntries().add(se);
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