package com.topdev.tsp.action.modules.businesspartner.submodules;

import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.businesspartner.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.overview.OverviewCommunication;

public class CommunicationDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	OverviewCommunication entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getCommunicationList().getEntryList();
		entry = (OverviewCommunication) getElementById(entries);
		if(entry==null) entry = new OverviewCommunication();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new OverviewCommunication(getMaxId(entries));
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
			entry = new OverviewCommunication(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(entry.getKommunikationsart_decode()==null || entry.getKommunikationsart_decode().length()<1)
			entry.setKommunikationsart_decode(DropdownContentAction.getDecodeByCode("KOAR", entry.getKommunikationsart()));
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
	public OverviewCommunication getEntry()
	{
		return entry;
	}
	public void setEntry(OverviewCommunication entry)
	{
		this.entry = entry;
	}

}