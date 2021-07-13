package com.topdev.tsp.action.modules.system.submodules;

import java.util.List;

import javax.portlet.WindowState;

import org.apache.struts2.portlet.context.PortletActionContext;

import com.topdev.tsp.action.modules.system.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;

public class PtsDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	List<ComplexEntryList> entries;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		getMainObject().clearErrors();
		//if(getMainObject().getPtsList()==null) getMainObject().loadDataPts("1", null, null, null);
		//entries = getMainObject().getPtsList().getEntryList();
	}
	
	public String init_edit() throws Exception
    {
		try { if(!PortletActionContext.getRequest().getWindowState().equals(WindowState.MAXIMIZED)) return view(); } catch (Exception ex43) {}
		init("edit");
		return SUCCESS;
    }
	
	public String execute() throws Exception
	{
		return view();
	}
	public String edit() throws Exception
    {
		try { if(!PortletActionContext.getRequest().getWindowState().equals(WindowState.MAXIMIZED)) return view(); } catch (Exception ex43) {}
		init("edit");
		return SUCCESS;
    }
	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}


}