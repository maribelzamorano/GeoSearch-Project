package com.topdev.tsp.action.modules.neuter_resources.submodules;


import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.neuter_resources.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesHandicap;

public class HandicapDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	NeuterResourcesHandicap	handicapEntry;
	List<ComplexEntryList> entries;


	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getHandicapList().getEntryList();
		handicapEntry = (NeuterResourcesHandicap) getElementById(entries);
		if(handicapEntry==null) handicapEntry = new NeuterResourcesHandicap();
	}


	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}
	public String insert() throws Exception
	{
		init("insert");
		handicapEntry = new NeuterResourcesHandicap(getMaxId(entries));
		return SUCCESS;
	}
	
	public String delete() throws Exception
	{
		init("delete");
		handicapEntry.createClone();
		handicapEntry.setDeleted("1");
		return "list";
	}
	

	public String undo() throws Exception
	{
		init("undo");
		if(handicapEntry.getId_entity().equals("0")) entries.remove(handicapEntry);
		else handicapEntry.reset();
		return "list";
		
	}
	
	public String edit() throws Exception
    {
		init("edit");
		handicapEntry.createClone();
		return SUCCESS;
	
    }	

	public String save() throws Exception
	{
		init("save");

		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			handicapEntry = new NeuterResourcesHandicap(getActionParameters());
			handicapEntry.setInserted("1");
			entries.add(handicapEntry);

		}
		else handicapEntry.setData(getActionParameters());
		handicapEntry.setModified("1");
		
		if(handicapEntry.getAuar_decode()==null || handicapEntry.getAuar_decode().length()<1)
			handicapEntry.setAuar_decode(DropdownContentAction.getDecodeByCode("AUAR", handicapEntry.getAuar_code()));
		handicapEntry.setData(null); //Spalten updaten
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


	public NeuterResourcesHandicap getHandicapEntry()
	{
		return handicapEntry;
	}


	public void setHandicapEntry(NeuterResourcesHandicap handicapEntry)
	{
		this.handicapEntry = handicapEntry;
	}
}