package com.topdev.tsp.action.modules.system.submodules;

import com.topdev.tsp.action.modules.system.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexList;

public class InstrumentListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		getMainObject().clearErrors();
		if(getMainObject().getInstrumentList()==null || getMainObject().getInstrumentList().getEntryList().size()<1)
			getMainObject().loadDataInstrument();
		complexList = getMainObject().getInstrumentList();
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
}