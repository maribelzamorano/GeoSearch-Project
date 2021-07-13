package com.topdev.tsp.action.modules.working_group.submodules;

import java.util.Iterator;

import com.topdev.tsp.action.modules.working_group.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.working_group.WorkingGroup;
 
public class WorkingGroupDetailAction extends DetailAction
{
		
	private static final long	serialVersionUID	= 1L;
	WorkingGroup workingEntry;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		Iterator<ComplexEntryList> it = getSchoolWorkingGroup().getWorkinggroupList().getEntryList().iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(getParameter("id")))
				workingEntry = (WorkingGroup) cel;
		}
		if(workingEntry==null) workingEntry = new WorkingGroup();
	}

	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}

	public WorkingGroup getWorkingEntry() {
		return workingEntry;
	}

	public void setWorkingEntry(WorkingGroup workingEntry) {
		this.workingEntry = workingEntry;
	}












}