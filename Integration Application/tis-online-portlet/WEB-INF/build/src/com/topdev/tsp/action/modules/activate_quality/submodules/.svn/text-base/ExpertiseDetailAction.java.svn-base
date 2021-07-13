package com.topdev.tsp.action.modules.activate_quality.submodules;

import java.util.List;

import com.topdev.tsp.action.modules.activate_quality.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.activate_quality.ActivateQualityExpertise;;

public class ExpertiseDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ActivateQualityExpertise entry;
	List<ComplexEntryList> entries;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getExpertiseList().getEntryList();
		entry = (ActivateQualityExpertise) getElementById(entries);
		if(entry==null) entry = new ActivateQualityExpertise();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new ActivateQualityExpertise(getMaxId(entries));
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
			entry = new ActivateQualityExpertise(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
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
	public ActivateQualityExpertise getEntry() {
		return entry;
	}
	public void setEntry(ActivateQualityExpertise entry) {
		this.entry = entry;
	}

}