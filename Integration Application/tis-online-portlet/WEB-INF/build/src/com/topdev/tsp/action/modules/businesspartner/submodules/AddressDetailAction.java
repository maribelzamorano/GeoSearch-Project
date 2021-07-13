package com.topdev.tsp.action.modules.businesspartner.submodules;

import java.util.List;

import com.topdev.tsp.action.lib.xml.DropdownContentAction;
import com.topdev.tsp.action.modules.businesspartner.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.overview.OverviewAddress;


public class AddressDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	OverviewAddress entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getAddressList().getEntryList();
		entry = (OverviewAddress) getElementById(entries);
		if(entry==null) entry = new OverviewAddress();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new OverviewAddress(getMaxId(entries));
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
			entry = new OverviewAddress(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(entry.getAdressart_decode()==null || entry.getAdressart_decode().length()<1)
			entry.setAdressart_decode(DropdownContentAction.getDecodeByCode("ANAR", entry.getAdressart()));
		entry.setData(null); //Spalten updaten

		return "list";
		
	}
	
	public OverviewAddress getentry() {
		return entry;
	}
	public void setentry(OverviewAddress entry) {
		this.entry = entry;
	}
}