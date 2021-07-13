package com.topdev.tsp.action.modules.school_intention.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.school_intention.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_intention.SchoolIntention;

public class IntentionListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList 			complexList;
	List<ComplexEntryList> 	complexEntryList;
	String					filter;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getIntentionList();
		if(aktion.equals("edit_filter") || getParameter("filter").length()>0)
		{
			complexEntryList					= new ArrayList<ComplexEntryList>(20);
			List<SchoolIntention>	removeList	= new ArrayList<SchoolIntention>(20);
									filter		= getParameter("filter");
			SchoolIntention 		cc;
			
			complexEntryList.addAll(complexList.getEntryList());
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				cc = (SchoolIntention) it.next();
				if (filter.equals("VORH") && "1".equals(cc.getSchw_id())) removeList.add(cc);
				if(cc.getSpar_code() == null || !cc.getSpar_code().equals(filter)) removeList.add(cc);
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
	public String edit_filter() throws Exception
    {
		init("edit_filter");
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

	public String getFilter()
	{
		return filter;
	}

	public void setFilter(String filter)
	{
		this.filter = filter;
	}
}