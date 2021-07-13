package com.topdev.tsp.action.modules.businesspartner.submodules;

import java.util.List;

import com.topdev.tsp.action.modules.businesspartner.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;

public class AddressListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	List<ComplexEntryList> complexEntryList;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList			= getMainObject().getAddressList();
		complexEntryList	= complexList.getEntryList();
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
	public List<ComplexEntryList> getComplexEntryList() {
		return complexEntryList;
	}
	public void setComplexEntryList(List<ComplexEntryList> complexEntryList) {
		this.complexEntryList = complexEntryList;
	}

}