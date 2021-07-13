package com.topdev.tsp.action.modules.documents.submodules;

import java.util.ArrayList;
import java.util.List;

import com.topdev.tsp.action.modules.documents.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;

public class LinkListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	
	List<ComplexEntryList> complexEntryList;
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		
		complexList = getMainObject().getLinkList();
		complexEntryList = new ArrayList<ComplexEntryList>(10);
		complexEntryList.addAll(complexList.getEntryList());
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