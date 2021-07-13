package com.topdev.tsp.action.modules.cooperation.submodules;

import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.cooperation.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.cooperation.CooperationPartner;

public class PartnerDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	CooperationPartner entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getPartnerList().getEntryList();
		entry = (CooperationPartner) getElementById(entries);
		if(entry==null) entry = new CooperationPartner();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new CooperationPartner(getMaxId(entries));
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
			entry = new CooperationPartner(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(entry.getPartnerart()==null || entry.getPartnerart().length()<1)
			entry.setPartnerart(DropdownContentAction.getDecodeByCode("KOOA", entry.getPartnerart_code()));
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
	public CooperationPartner getEntry()
	{
		return entry;
	}
	public void setEntry(CooperationPartner entry)
	{
		this.entry = entry;
	}
}