package com.topdev.tsp.action.modules.school_evolution.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.school_evolution.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionEmphasis;


public class EmphasisListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList complexList;
	List<ComplexEntryList> complexEntryList;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList			= getMainObject().getEmphasisList();
		complexEntryList	= complexList.getEntryList();

		if(aktion.equals("view_filter"))
		{
			complexEntryList						= new ArrayList<ComplexEntryList>(20);
			List<EvolutionEmphasis>	removeList		= new ArrayList<EvolutionEmphasis>(20);
			String						filter		= getActionParameter("filter");
			EvolutionEmphasis 			cc;
			
			complexEntryList.addAll(complexList.getEntryList());
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				cc = (EvolutionEmphasis) it.next();
				if(cc.getEntwicklungsschritt_code() == null || !cc.getEntwicklungsschritt_code().equals(filter)) removeList.add(cc);
			}
			complexEntryList.removeAll(removeList);
		}
		if(complexList.getEntryList().size()>=5)
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