package com.topdev.tsp.action.modules.neuter_resources.submodules;


import java.util.List;

import com.topdev.tsp.action.modules.neuter_resources.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesCabinet;

public class CabinetDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	NeuterResourcesCabinet	cabinetEntry;
	List<ComplexEntryList> entries;


	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getCabinetList().getEntryList();
		cabinetEntry = (NeuterResourcesCabinet) getElementById(entries);
		if(cabinetEntry==null) cabinetEntry = new NeuterResourcesCabinet();
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
		cabinetEntry = new NeuterResourcesCabinet(getMaxId(entries));
		return SUCCESS;
	}
	
	public String delete() throws Exception
	{
		init("delete");
		cabinetEntry.createClone();
		cabinetEntry.setDeleted("1");
		return "list";
	}
	

	public String undo() throws Exception
	{
		init("undo");
		if(cabinetEntry.getId_entity().equals("0")) entries.remove(cabinetEntry);
		else cabinetEntry.reset();
		return "list";
		
	}
	
	public String edit() throws Exception
    {
		init("edit");
		cabinetEntry.createClone();
		return SUCCESS;
	
    }	

	public String save() throws Exception
	{
		init("save");

		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			cabinetEntry = new NeuterResourcesCabinet(getActionParameters());
			cabinetEntry.setInserted("1");
			entries.add(cabinetEntry);

		}
		else cabinetEntry.setData(getActionParameters());
		cabinetEntry.setModified("1");
		return "list";		
	
	}

	public NeuterResourcesCabinet getCabinetEntry() {
		return cabinetEntry;
	}

	public void setCabinetEntry(NeuterResourcesCabinet cabinetEntry) {
		this.cabinetEntry = cabinetEntry;
	}

	
	
	

}