package com.topdev.tsp.action.modules.neuter_resources.submodules;

import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.neuter_resources.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesSport;

public class SportDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	NeuterResourcesSport entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getSportList().getEntryList();
		entry = (NeuterResourcesSport) getElementById(entries);
		if(entry==null) entry = new NeuterResourcesSport();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new NeuterResourcesSport(getMaxId(entries));
		return SUCCESS;
		
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
		return SUCCESS;
    }
	

	public String save() throws Exception
	{
		init("save");		
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new NeuterResourcesSport(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(entry.getSportstaettenart()==null || entry.getSportstaettenart().length()<1)
			entry.setSportstaettenart(DropdownContentAction.getDecodeByCode("SPAR", entry.getSportstaettenart_code()));
		entry.setData(null); //Spalten updaten

		return "list";
		
	}
	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}
	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}
	public NeuterResourcesSport getEntry()
	{
		return entry;
	}
	public void setEntry(NeuterResourcesSport entry)
	{
		this.entry = entry;
	}

}