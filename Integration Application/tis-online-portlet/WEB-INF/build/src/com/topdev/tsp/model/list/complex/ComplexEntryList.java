package com.topdev.tsp.model.list.complex;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.tsp.model.list.BasicList;
import com.topdev.tsp.model.list.simple.SimpleEntry;


public class ComplexEntryList extends BasicList implements Cloneable, Serializable, EntryList
{
	private static final long	serialVersionUID	= 1L;
	List<SimpleEntry>	entries	= new ArrayList<SimpleEntry>(5);
	ComplexEntryList	clone;
	ComplexList			sub_list1;
	ComplexList			sub_list2;	
	int					style = 0;
	public Log			log					= LogFactory.getLog(this.getClass());
    public final static List<String> reservedParameters = new ArrayList<String>(10);
    static
    {
    	reservedParameters.add("ajaxId");
    	reservedParameters.add("ns");
    	reservedParameters.add("forwardUrl");
    }
	
	public void createClone()
	{
		if(clone==null) setClone(clone());
	}
	
	@Override 
	public ComplexEntryList clone() 
	{ 
		return (ComplexEntryList) super.clone();  
	}

	public void setEntry(String name, String value)
	{
		SimpleEntry se = null;
		Iterator<SimpleEntry> it = entries.iterator();
		while(it.hasNext())
		{
			SimpleEntry t_se = it.next();
			if(t_se.getName()!=null && t_se.getName().equals(name))
				se = t_se;
		}
		if(se!=null) se.setDecode(value);
	}
	
	public void setData(HashMap<String, String> map)
	{
		setEntries(new ArrayList<SimpleEntry>(10));
		if(map==null) return;
		Iterator<String> it =  map.keySet().iterator();
		String key, name;
		Method method;
		while(it.hasNext())
		{
			key = it.next();
			if(!reservedParameters.contains(key))
			{
				name = "set"+key.substring(0,1).toUpperCase()+key.substring(1);
				try
				{
					method = this.getClass().getMethod(name, new Class[]{String.class});
					method.invoke(this, new Object[]{map.get(key)});
				}
				catch (Exception e)
				{
					log.debug("Fehler bei Aufruf  der Methode "+name+":\n "+e.getLocalizedMessage());
				}
			}
		}
	}
	
	public void reset()
	{
		if(getClone()!=null)
		{
			Method method;
			HashMap<String, String> map = new HashMap<String, String>();
			Method[] methods = this.getClass().getMethods();
			for(int i=0; i<methods.length; i++)
			{
				String name = methods[i].getName();
				if(name.startsWith("get") && !name.equals("getClone") && !name.equals("getClass"))
				{
					try
					{
						method = this.getClass().getMethod("set"+name.substring(3), new Class[]{String.class});
						method.invoke(this, new Object[]{methods[i].invoke(getClone(), new Object[]{})});
					}
					catch (Exception e) { log.debug("Fehler bei Aufruf der Methode "+name+":\n "+e.getLocalizedMessage()); }
				}
			}
			setEntries(getClone().getEntries());
			setClone(null);
		}
	}

	public ComplexEntryList getClone()
	{
		return clone;
	}

	public void setClone(ComplexEntryList clone)
	{
		this.clone = clone;
	}
	public List<SimpleEntry> getEntries() {
		return entries;
	}

	public void setEntries(List<SimpleEntry> entries) {
		this.entries = entries;
	}

	public int getStyle()
	{
		return style;
	}

	public void setStyle(int style)
	{
		this.style = style;
	}

	public ComplexList getSub_list1() {
		return sub_list1;
	}

	public void setSub_list1(ComplexList sub_list1) {
		this.sub_list1 = sub_list1;
	}

	public ComplexList getSub_list2() {
		return sub_list2;
	}

	public void setSub_list2(ComplexList sub_list2) {
		this.sub_list2 = sub_list2;
	}
}