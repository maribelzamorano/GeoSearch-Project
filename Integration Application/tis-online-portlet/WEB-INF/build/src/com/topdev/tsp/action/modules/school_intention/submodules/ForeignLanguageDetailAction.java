package com.topdev.tsp.action.modules.school_intention.submodules;

import java.util.List;

import com.topdev.tsp.action.modules.school_intention.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.school_intention.ForeignLanguage;
import com.topdev.tsp.model.list.modules.school_intention.SchoolIntention;

public class ForeignLanguageDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ForeignLanguage			entry;
	List<ComplexEntryList>	entries;
	String					filter;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getForeignlanguageList().getEntryList();
		entry = (ForeignLanguage) getElementById(entries);
		if(entry==null) entry = new ForeignLanguage();
		filter = getParameter("filter");
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new ForeignLanguage(getMaxId(entries));
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
			entry = new ForeignLanguage(getActionParameters());
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
	public String getFilter()
	{
		return filter;
	}
	public void setFilter(String filter)
	{
		this.filter = filter;
	}
	public ForeignLanguage getEntry() {
		return entry;
	}
	public void setEntry(ForeignLanguage entry) {
		this.entry = entry;
	}

}