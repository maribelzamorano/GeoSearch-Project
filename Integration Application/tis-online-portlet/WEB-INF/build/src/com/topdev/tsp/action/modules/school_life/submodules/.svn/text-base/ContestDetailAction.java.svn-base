package com.topdev.tsp.action.modules.school_life.submodules;

import java.util.List;

import com.topdev.tsp.action.modules.school_life.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeContest;


public class ContestDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	SchoolLifeContest entry;
	List<ComplexEntryList> entries;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getContestList().getEntryList();
		entry = (SchoolLifeContest) getElementById(entries);
		if(entry==null) entry = new SchoolLifeContest();
	}
	
	public String insert() throws Exception
	{
		init("insert");
		entry = new SchoolLifeContest(getMaxId(entries));
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
		entry.setDeleted("1");
		getMainObject().saveDataContest(entry);
		setRtErrors(getMainObject().getErrors());
		entries.remove(entry);
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
			entry = new SchoolLifeContest(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		getMainObject().saveDataContest(entry);
		setRtErrors(getMainObject().getErrors());
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

	public SchoolLifeContest getEntry() {
		return entry;
	}

	public void setEntry(SchoolLifeContest entry) {
		this.entry = entry;
	}


}