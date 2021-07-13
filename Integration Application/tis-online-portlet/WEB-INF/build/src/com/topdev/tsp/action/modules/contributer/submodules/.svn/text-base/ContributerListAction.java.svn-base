package com.topdev.tsp.action.modules.contributer.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.contributer.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.contributer.Contributer;

public class ContributerListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	List<ComplexEntryList> complexEntryList;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getContributerList();
		if(aktion.equals("view_filter"))
		{
			complexEntryList							= new ArrayList<ComplexEntryList>(20);
			List<Contributer>	removeList				= new ArrayList<Contributer>(20);
			String				filter					= getActionParameter("filter");
			Contributer 			cc;
			
			complexEntryList.addAll(complexList.getEntryList());
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				cc = (Contributer) it.next();
				if(cc.getKategorie_code() == null || !cc.getKategorie_code().equals(filter)) removeList.add(cc);
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
	public String delete() throws Exception
	{
//		init("delete");
//		SimpleEntryList e = getCurrentElement();
//		if(e.isInserted()) simpleList.getEntryList().remove(e);
//		else e.setDeleted("1");
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

	public List<ComplexEntryList> getComplexEntryList()
	{
		return complexEntryList;
	}
	public void setComplexEntryList(List<ComplexEntryList> complexEntryList)
	{
		this.complexEntryList = complexEntryList;
	}
}