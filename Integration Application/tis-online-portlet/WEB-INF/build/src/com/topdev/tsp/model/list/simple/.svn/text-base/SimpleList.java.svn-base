package com.topdev.tsp.model.list.simple;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SimpleList implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	String kz_insert = "0";
	List<SimpleHeading>		headingList	= new ArrayList<SimpleHeading>(10);
	List<SimpleEntryList>	entryList	= new ArrayList<SimpleEntryList>(20);

	public void clearEntryList()
	{
		entryList	= new ArrayList<SimpleEntryList>(20);
	}

	public List<SimpleHeading> getHeadingList()
	{
		return headingList;
	}
	public void setHeadingList(List<SimpleHeading> headingList)
	{
		this.headingList = headingList;
	}

	public String getKz_insert() {
		return kz_insert;
	}
	public void setKz_insert(String kz_insert) {
		this.kz_insert = kz_insert;
	}
	public List<SimpleEntryList> getEntryList()
	{
		return entryList;
	}
	public void setEntryList(List<SimpleEntryList> entryList)
	{
		this.entryList = entryList;
	}
}