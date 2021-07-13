package com.topdev.tsp.action.modules.contributer.submodules;

import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.contributer.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.contributer.Contributer;

public class ContributerDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	Contributer entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getContributerList().getEntryList();
		entry = (Contributer) getElementById(entries);
		if(entry==null) entry = new Contributer();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new Contributer(getMaxId(entries));
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
			entry = new Contributer(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(entry.getFunktion()==null || entry.getFunktion().length()<1)
			entry.setFunktion(DropdownContentAction.getDecodeByCode("FUNK_MITW", entry.getFunktion_code()));
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
	public Contributer getEntry()
	{
		return entry;
	}
	public void setEntry(Contributer entry)
	{
		this.entry = entry;
	}
}