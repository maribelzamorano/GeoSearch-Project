package com.topdev.tsp.action.modules.activate_quality.submodules;

import com.topdev.tsp.action.modules.activate_quality.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexList;

public class ExpertiseListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getExpertiseList();
		if(complexList.getEntryList().size()>2)
			complexList.setKz_insert("0");
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

}