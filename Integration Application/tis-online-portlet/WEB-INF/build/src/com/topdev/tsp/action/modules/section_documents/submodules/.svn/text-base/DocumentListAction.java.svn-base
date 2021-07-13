package com.topdev.tsp.action.modules.section_documents.submodules;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.topdev.tsp.action.modules.section_documents.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.documents.Documents;

public class DocumentListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	ComplexList				complexList;
	List<ComplexEntryList>	complexEntryList;
	List<ComplexEntryList>	complexLinkEntryList;
	String					filter;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		complexList = getMainObject().getDocumentList();
		complexEntryList = new ArrayList<ComplexEntryList>(10);
		complexEntryList.addAll(complexList.getEntryList());
		
		complexLinkEntryList = getMainObject().getLinkList().getEntryList();
		if(aktion.equals("view_filter") || getParameter("filter").length()>0)
		{
			List<Documents>	removeList	= new ArrayList<Documents>(20);
							filter		= getParameter("filter");
			Documents 		cc;
			
			Iterator<ComplexEntryList> it = complexEntryList.iterator();
			while(it.hasNext())
			{
				cc = (Documents) it.next();
				if(cc.getDokumentart_code() == null || !cc.getDokumentart_code().equals(filter)) removeList.add(cc);
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
	public String edit() throws Exception
    {
		init("edit");
		return SUCCESS;
    }
	public String view_filter() throws Exception
    {
		init("view_filter");
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

	public String getFilter()
	{
		return filter;
	}

	public void setFilter(String filter)
	{
		this.filter = filter;
	}

	public List<ComplexEntryList> getComplexLinkEntryList() {
		return complexLinkEntryList;
	}

	public void setComplexLinkEntryList(List<ComplexEntryList> complexLinkEntryList) {
		this.complexLinkEntryList = complexLinkEntryList;
	}

}