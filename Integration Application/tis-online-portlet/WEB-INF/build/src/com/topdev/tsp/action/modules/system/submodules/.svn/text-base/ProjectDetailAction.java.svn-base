package com.topdev.tsp.action.modules.system.submodules;

import java.util.List;

import javax.portlet.WindowState;

import org.apache.struts2.portlet.context.PortletActionContext;

import com.topdev.tsp.action.modules.system.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.system.Project;

public class ProjectDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	Project entry;
	List<ComplexEntryList> entries;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		getMainObject().clearErrors();
		if(getMainObject().getProjectList()==null) getMainObject().loadDataProject();
		entries = getMainObject().getProjectList().getEntryList();
		entry = (Project) getElementById(entries);
		if(entry==null) entry = new Project();
	}
	
	public String init_edit() throws Exception
    {
		try { if(!PortletActionContext.getRequest().getWindowState().equals(WindowState.MAXIMIZED)) return view(); } catch (Exception ex43) {}
		init("edit");
		entry.createClone();
		return SUCCESS;
    }
	
	public String save_final() throws Exception
    {
		init("save");
		getMainObject().saveProject();
		setRtErrors(getMainObject().getErrors());
		return "saved";
    }
	
	public String insert() throws Exception
	{
		init("insert");
		entry = new Project(getMaxId(entries));
		return SUCCESS;
		
	}
	public String execute() throws Exception
	{
		return view();
	}

	public String delete() throws Exception
	{
		init("delete");
		entry.createClone();
		entry.setDeleted("1");
		return "list";

	}
	public String undo() throws Exception
	{
		init("undo");
		if(entry.getId_entity().equals("0")) entries.remove(entry);
		else entry.reset();
		return "list";
	
	}
	
	public String edit() throws Exception
    {
		try { if(!PortletActionContext.getRequest().getWindowState().equals(WindowState.MAXIMIZED)) return view(); } catch (Exception ex43) {}
		init("edit");
		entry.createClone();
		return SUCCESS;
    }
	
	public String save() throws Exception
	{
		init("save");		
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new Project(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		return "list";
	}

	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}

	public Project getEntry()
	{
		return entry;
	}

	public void setEntry(Project entry)
	{
		this.entry = entry;
	}

}