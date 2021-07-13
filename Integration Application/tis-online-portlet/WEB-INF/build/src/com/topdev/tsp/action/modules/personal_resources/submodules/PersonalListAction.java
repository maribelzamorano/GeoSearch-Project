package com.topdev.tsp.action.modules.personal_resources.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.personal_resources.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.personal_resources.PersonalResourcesPersonal;

public class PersonalListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;	
	List<ComplexEntryList> complexEntryList;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getPersonalList();
		complexEntryList = complexList.getEntryList();
		if(aktion.equals("view_filter"))
		{
			complexEntryList							= new ArrayList<ComplexEntryList>(20);
			List<PersonalResourcesPersonal>	removeList	= new ArrayList<PersonalResourcesPersonal>(20);
			String						filter			= getActionParameter("filter");
			PersonalResourcesPersonal 	prp;
			
			complexEntryList.addAll(complexList.getEntryList());
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				prp = (PersonalResourcesPersonal) it.next();
				if(prp.getKategorie_code() == null || !prp.getKategorie_code().equals(filter)) removeList.add(prp);
			
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