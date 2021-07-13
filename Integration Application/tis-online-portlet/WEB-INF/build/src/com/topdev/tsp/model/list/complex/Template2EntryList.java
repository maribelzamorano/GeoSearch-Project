package com.topdev.tsp.model.list.complex;

import java.io.File;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;

public class Template2EntryList extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String	bezeichnung;
	String	groesse;
	File	file;
	String	fileName;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public Template2EntryList()								{				}
	public Template2EntryList(String id)					{ setId(id);	}
	public Template2EntryList(HashMap<String, String> map)	{ setData(map);	}
	public String getBezeichnung()
	{
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung)
	{
		this.bezeichnung = bezeichnung;
	}
	public String getGroesse()
	{
		return groesse;
	}
	public void setGroesse(String groesse)
	{
		this.groesse = groesse;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}