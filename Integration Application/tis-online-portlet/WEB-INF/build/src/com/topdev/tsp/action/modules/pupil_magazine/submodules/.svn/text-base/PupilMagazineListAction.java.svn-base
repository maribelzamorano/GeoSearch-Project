package com.topdev.tsp.action.modules.pupil_magazine.submodules;

import com.topdev.tsp.action.modules.pupil_magazine.DetailAction;
import com.topdev.tsp.model.list.simple.SimpleList;

public class PupilMagazineListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	SimpleList simpleList;

	public void init(String action) throws Exception
	{
		super.init(action);
		simpleList = getMainObject().getPupilmagazineList();
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
	public SimpleList getSimpleList()
	{
		return simpleList;
	}
	public void setSimpleList(SimpleList simpleList)
	{
		this.simpleList = simpleList;
	}
}