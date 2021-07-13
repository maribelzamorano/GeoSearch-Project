package com.topdev.tsp.action.modules.neuter_resources.submodules;

import com.topdev.tsp.action.modules.neuter_resources.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexList;


public class CabinetListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;

	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getCabinetList();
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