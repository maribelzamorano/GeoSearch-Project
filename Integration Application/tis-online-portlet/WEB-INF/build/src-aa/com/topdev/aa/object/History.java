package com.topdev.aa.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.Properties;

import javax.servlet.http.HttpSession;

public class History implements Serializable 
{
	private static final long	serialVersionUID	= 1L;
	public List<HistoryEntry> 		entries;
	public Properties 	mappings;
	public HttpSession 	session;

	public History(Properties properties, HttpSession pSession)
	{
		this.mappings=properties;
		this.entries = new ArrayList<HistoryEntry>();
		this.session=pSession;
	}

	public void add(HistoryEntry entry)
	{
		if(mappings.getProperty(entry.mapping)==null) return;
		if(mappings.getProperty(entry.mapping).equals("none")) return;
		if(entry.label==null) entry.label=mappings.getProperty(entry.mapping);

		this.entries.add(entry);
		ListIterator<HistoryEntry> it=entries.listIterator();
		while(it.hasNext())
		{
			HistoryEntry currentEntry = it.next();
			if(currentEntry.getMapping().equals(entry.getMapping()))
			{
				this.entries=this.entries.subList(0, it.nextIndex());
				break;
			}
		}

		session.setAttribute("history",this);
		session.setAttribute("historyEntries",entries);
	}
}