package com.topdev.tsp.model.list.simple;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.model.list.BasicList;


public class SimpleEntryList extends BasicList implements Cloneable, Serializable
{
	private static final long	serialVersionUID	= 1L;
	List<SimpleEntry>	entries		= new ArrayList<SimpleEntry>(5);
	SimpleEntryList		clone		= null;


	
	@Override 
	public SimpleEntryList clone() 
	{ 
		SimpleEntryList ses = (SimpleEntryList) super.clone();
		if(entries!=null)
		{
			ses.setEntries(new ArrayList<SimpleEntry>(entries.size()));
			Iterator<SimpleEntry> it = entries.iterator();
			while(it.hasNext())
				ses.getEntries().add(it.next().clone());
		}
		return ses;
	}
	public void createClone()
	{
		setClone(clone());
	}
	
	
	public List<SimpleEntry> getEntries()
	{
		return entries;
	}

	public void setEntries(List<SimpleEntry> entries)
	{
		this.entries = entries;
	}

	public SimpleEntryList getClone()
	{
		return clone;
	}

	public void setClone(SimpleEntryList clone)
	{
		this.clone = clone;
	}
}