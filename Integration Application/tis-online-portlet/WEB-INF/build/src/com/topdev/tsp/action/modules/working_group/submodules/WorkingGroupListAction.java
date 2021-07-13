package com.topdev.tsp.action.modules.working_group.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.working_group.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.working_group.WorkingGroup;

public class WorkingGroupListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;	
	List<ComplexEntryList> complexEntryList;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getSchoolWorkingGroup().getWorkinggroupList();
		complexEntryList = complexList.getEntryList();
		if(aktion.equals("view_filter"))
		{
			complexEntryList							= new ArrayList<ComplexEntryList>(20);
			List<WorkingGroup>		removeList			= new ArrayList<WorkingGroup>(20);
			String					filter				= getActionParameter("filter");
			WorkingGroup 			wg;
			
			complexEntryList.addAll(complexList.getEntryList());
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				wg = (WorkingGroup) it.next();
				if(wg.getKategorie_code() == null || !wg.getKategorie_code().equals(filter)) removeList.add(wg);
				
			}
			complexEntryList.removeAll(removeList);
		}
	}
		

	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		init("view");
		return SUCCESS;
	}
	public String view_filter() throws Exception
    {
		init("view_filter");
		return SUCCESS;
	}
	
	public String edit() throws Exception
    {
		init("edit");
		return SUCCESS;
    }
	public ComplexList getComplexList()
	{
		return complexList;
	}
	public void setComplexList(ComplexList complexList)
	{
		this.complexList = complexList;
	}


	public List<ComplexEntryList> getComplexEntryList() {
		return complexEntryList;
	}


	public void setComplexEntryList(List<ComplexEntryList> complexEntryList) {
		this.complexEntryList = complexEntryList;
	}

}