package com.topdev.tsp.model.list.complex;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.model.aop.TextBean;
import com.topdev.tsp.model.list.BasicList;

public class ComplexList implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	String kz_insert = "0";
	List<ComplexHeading>	headingList	= new ArrayList<ComplexHeading>(10);
	List<ComplexEntryList>	entryList	= new ArrayList<ComplexEntryList>(20);

	public ComplexList()
	{
	}
	
	public ComplexList(String key)
	{
		getHeadingList().add(		new ComplexHeading(key));
	}
	
	
	public void clearEntryList()
	{
		entryList = new ArrayList<ComplexEntryList>(20);
	}

	public void addHeading(String key, TextBean textBean)
	{
		headingList.add(new ComplexHeading( textBean.getText(key, TextBean.TYPE_HEADING)));
	}
	public void addHeading(String key)
	{
		headingList.add(new ComplexHeading( key));
	}
	public ComplexEntryList getElementById(String id)
	{
		Iterator<ComplexEntryList> it = entryList.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(id)) return cel;
		}
		return null;
	}
	
	public ComplexEntryList getElementByEntityId(String id)
	{
		Iterator<ComplexEntryList> it = entryList.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId_entity().equals(id)) return cel;
		}
		return null;
	}
	
	public String getNextId()
	{
		Iterator<ComplexEntryList> it = entryList.iterator();
		int i, max = 0;
		while(it.hasNext())
		{
			BasicList cel = it.next();
			i = Integer.parseInt(cel.getId());
			if(i>max) max=i;
		}
		return String.valueOf(max+1);
	}
	
	
	public void printIds()
	{
		Iterator<ComplexEntryList> it = entryList.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
		}
	}
	
	public void removeElementById(String id)
	{
		ComplexEntryList cel = getElementById(id);
		if(cel!=null) entryList.remove(cel);
	}
	public void removeElementByEntityId(String id)
	{
		ComplexEntryList cel = getElementByEntityId(id);
		if(cel!=null) entryList.remove(cel);
	}
	
	public List<ComplexEntryList> getEntryList()
	{
		return entryList;
	}
	public void setEntryList(List<ComplexEntryList> entryList)
	{
		this.entryList = entryList;
	}
	public List<ComplexHeading> getHeadingList()
	{
		return headingList;
	}
	public void setHeadingList(List<ComplexHeading> headingList)
	{
		this.headingList = headingList;
	}
	public String getKz_insert() {
		return kz_insert;
	}
	public void setKz_insert(String kz_insert) {
		this.kz_insert = kz_insert;
	}
	
}