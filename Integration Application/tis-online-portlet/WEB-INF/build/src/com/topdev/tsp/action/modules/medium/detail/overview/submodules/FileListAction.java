package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.List;

import com.topdev.aa.model.action.Submodule;
import com.topdev.aa.model.action.SubmoduleImpl;
import com.topdev.aa.object.MainObject;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.presentation.medium.MediumEditObj;

public class FileListAction extends SubmoduleImpl implements Submodule
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	List<ComplexEntryList> complexEntryList;
	MediumEditObj mainObject;

	public void init(String aktion) throws Exception
	{
		complexList			= mainObject.getDatei_liste();
		complexEntryList	= complexList.getEntryList();
	}
	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		init("view");
		return "success";
	}
	public String edit() throws Exception
    {
		init("edit");
		return "success";
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

	public MainObject getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(MainObject mainObject)
	{
		this.mainObject = (MediumEditObj)mainObject;
	}
	public void setMainObject(MediumEditObj mainObject)
	{
		this.mainObject = mainObject;
	}
}