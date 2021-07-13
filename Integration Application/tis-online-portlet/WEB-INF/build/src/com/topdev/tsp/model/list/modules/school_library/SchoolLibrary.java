package com.topdev.tsp.model.list.modules.school_library;

import java.util.HashMap;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;


public class SchoolLibrary extends ComplexEntryList implements EntryList

{
	private static final long	serialVersionUID	= 1L;
	String merkmal;
	String angabe;
	
	public SchoolLibrary()								{				}
	public SchoolLibrary(String id)						{ setId(id);	}
	public SchoolLibrary(HashMap<String, String> map)	{ setData(map);	}

	public String getAngabe() {
		return angabe;
	}
	public void setAngabe(String angabe) {
		this.angabe = angabe;
	}
	public String getMerkmal() {
		return merkmal;
	}
	public void setMerkmal(String merkmal) {
		this.merkmal = merkmal;
	}

	
	

}