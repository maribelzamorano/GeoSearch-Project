package com.topdev.tsp.action.modules.system.submodules;

import com.topdev.tsp.action.modules.system.DetailAction;
import com.topdev.tsp.model.aop.SessionBean;
import com.topdev.tsp.model.form.modules.system.PtsSearchForm;
import com.topdev.tsp.model.list.complex.SearchList;
import com.topdev.tsp.model.list.modules.system.Pts;
import com.topdev.tsp.model.view.SystemOverview;

public class PtsListAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	SearchList		complexList;
	String			page;
	String			id;
	String			GEPA_ID;
	String			PTS_VON;
	String			PTS_BIS;
	Pts				entry;
	String			preserve;
	PtsSearchForm	searchForm = new PtsSearchForm();
	public void init(String aktion) throws Exception
	{
		if(GEPA_ID==null && preserve==null)
		{
			String objectName	= SessionBean.mainObjectPrefix+getVsid()+"."+(new SystemOverview()).getClass().getName();
			getSessionBean().removeAttribute(getSessionId(), objectName);
		}
		super.init(aktion);
		if(page!=null || GEPA_ID!=null || id!=null)
		{
			if(GEPA_ID==null && preserve==null)
			{
				PtsSearchForm form = new PtsSearchForm();
				form.setPage(page);
				form.setVon(PTS_VON);
				form.setBis(PTS_BIS);
				getMainObject().setPtsSearchForm(form);
				if(getMainObject().getPtsList()==null || getMainObject().getPtsList().getEntryList().size()<1)
					getMainObject().loadDataPts(GEPA_ID);
			}
			
			if(GEPA_ID!=null) getMainObject().loadDataPts(GEPA_ID);
		}
		complexList = getMainObject().getPtsList();
		if(GEPA_ID!=null && id!=null)
		{
			complexList = getMainObject().getPtsDetailList();
			entry = (Pts) getMainObject().getPtsList().getElementByEntityId(GEPA_ID);
		}
		searchForm = getMainObject().getPtsSearchForm();
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

	public SearchList getComplexList()
	{
		return complexList;
	}

	public void setComplexList(SearchList complexList)
	{
		this.complexList = complexList;
	}

	public String getPage()
	{
		return page;
	}

	public void setPage(String page)
	{
		this.page = page;
	}

	public String getGEPA_ID()
	{
		return GEPA_ID;
	}

	public void setGEPA_ID(String gepa_id)
	{
		GEPA_ID = gepa_id;
	}

	public String getPTS_BIS()
	{
		return PTS_BIS;
	}

	public void setPTS_BIS(String pts_bis)
	{
		PTS_BIS = pts_bis;
	}

	public String getPTS_VON()
	{
		return PTS_VON;
	}

	public void setPTS_VON(String pts_von)
	{
		PTS_VON = pts_von;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public Pts getEntry()
	{
		return entry;
	}

	public void setEntry(Pts entry)
	{
		this.entry = entry;
	}

	public PtsSearchForm getSearchForm()
	{
		return searchForm;
	}

	public void setSearchForm(PtsSearchForm searchForm)
	{
		this.searchForm = searchForm;
	}

	public String getPreserve()
	{
		return preserve;
	}

	public void setPreserve(String preserve)
	{
		this.preserve = preserve;
	}


}