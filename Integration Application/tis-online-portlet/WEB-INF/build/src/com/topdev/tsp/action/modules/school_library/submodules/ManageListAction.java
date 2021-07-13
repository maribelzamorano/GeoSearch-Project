package com.topdev.tsp.action.modules.school_library.submodules;

import com.topdev.tsp.action.modules.school_library.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexList;


public class ManageListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getLibraryList_manage();
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
	public ComplexList getComplexList() {
		return complexList;
	}
	public void setComplexList(ComplexList complexList) {
		this.complexList = complexList;
	}
}