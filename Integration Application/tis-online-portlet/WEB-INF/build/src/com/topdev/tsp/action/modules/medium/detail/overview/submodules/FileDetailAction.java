package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Submodule;
import com.topdev.aa.model.action.SubmoduleImpl;
import com.topdev.aa.object.MainObject;
import com.topdev.tsp.model.list.BasicList;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Datei;
import com.topdev.tsp.model.presentation.medium.MediumEditObj;

public class FileDetailAction extends SubmoduleImpl implements Submodule
{
	private static final long	serialVersionUID	= 1L;
	MediumEditObj mainObject;
	Datei entry;
	List<ComplexEntryList> entries;
	String id;
	String id_entity;
	String status;

	public String getMaxId(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		int i, max = 0;
		while(it.hasNext())
		{
			BasicList cel = it.next();
			i = Integer.parseInt(cel.getId());
			if(i>max) max=i;
		}
		return String.valueOf(max+1);
	}

	public ComplexEntryList getElementById(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(id))
				return cel;
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public HashMap<String, String> getActionParameters()
	{
		HashMap<String,String> map = new HashMap<String, String>(10);
		Map<String, String[]> t_map = ActionContext.getContext().getParameters();
		String key = null;
		String[] s = null;
		try
		{
			Iterator<String> it = t_map.keySet().iterator();
			while(it.hasNext())
			{
				try
				{
					key = (String) it.next();
					s = t_map.get(key);
					if(s!=null && s.length>0)
						map.put(key, s[0]);
				} catch (Exception e1)
				{
					getLog().debug("Fehler bei Parameterauswertung (01): "+e1.getLocalizedMessage());
				}
			}
		} catch(Exception e2)
		{
			getLog().debug("Fehler bei Parameterauswertung (02): "+e2.getLocalizedMessage());
		}
		return map;
	}

	
	public void init(String aktion) throws Exception
	{
		entries = mainObject.getDatei_liste().getEntryList();
		entry = (Datei) getElementById(entries);
		if(entry==null) entry = new Datei();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new Datei(getMaxId(entries));
		return "success";
		
	}
	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}
	
	public String delete() throws Exception
	{
		init("delete");
		entry.createClone();
		entry.setDeleted("1");
		return "list";

	}
	public String undo() throws Exception
	{
		init("undo");
		if(entry.getId_entity().equals("0")) entries.remove(entry);
		else entry.reset();
		return "list";
	
	}
	
	public String edit() throws Exception
    {
		init("edit");
		entry.createClone();
		return "success";
    }
	

	public String save() throws Exception
	{
		init("save");
		
		if(id_entity.equals("0") && getElementById(entries)==null)
		{
			entry = new Datei(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else
		{
			if(Validator.equals(status, "2")) entry.setStatus("2");
			else entry.setData(getActionParameters());
		}
		entry.setModified("1");
		
//		if(entry.getAdressart_decode()==null || entry.getAdressart_decode().length()<1)
//			entry.setAdressart_decode(DropdownContentAction.getDecodeByCode("ANAR", entry.getAdressart()));
		entry.setData(null); //Spalten updaten

		return "list";
		
	}

	public MainObject getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(MainObject mainObject)
	{
		this.mainObject = (MediumEditObj)mainObject;
	}
	public void setMainObject(MediumEditObj mainObject)
	{
		this.mainObject = mainObject;
	}

	public Datei getEntry()
	{
		return entry;
	}

	public void setEntry(Datei entry)
	{
		this.entry = entry;
	}

	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getId_entity()
	{
		return id_entity;
	}

	public void setId_entity(String id_entity)
	{
		this.id_entity = id_entity;
	}

	public String getStatus()
	{
		return status;
	}

	public void setStatus(String status)
	{
		this.status = status;
	}

}