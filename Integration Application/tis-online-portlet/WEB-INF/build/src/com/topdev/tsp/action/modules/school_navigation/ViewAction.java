package com.topdev.tsp.action.modules.school_navigation;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.portlet.PortletRequest;

import org.apache.struts2.portlet.context.PortletActionContext;

import com.topdev.tsp.action.modules.school_search.SearchAction;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.db.psp_getSchule;

public class ViewAction extends com.topdev.tsp.action.modules.businesspartner.DetailAction
{
	private static final long	serialVersionUID	= 1L;
	psp_getSchule schoolEntry;
	public void initSchoolEntry(String id) throws PermissionException
	{
		String oName = this.getClass().getName()+".SchoolEntry";
		psp_getSchule t_entry = (psp_getSchule) getSessionObject(oName);
		if(t_entry!=null && t_entry.getID().equals(id))
			schoolEntry = t_entry;
		else
		{
			schoolEntry = new psp_getSchule();
			schoolEntry.setCC_PLZ_ORT(getMainObject().getCc_plz_ort());
			schoolEntry.setCC_STRASSE(getMainObject().getCc_strasse());
			schoolEntry.setCC_NAME_1_ORT(getMainObject().getCc_name_1_ort());
			schoolEntry.setID(getMainObject().getId());
			schoolEntry.setSCHULAMT( getMainObject().getSchulamt());
			schoolEntry.setSCHULART( getMainObject().getSchulart());
			schoolEntry.setSCHULNAME( getMainObject().getSchulname());
			schoolEntry.setSCHULNUMMER( getMainObject().getSchulnummer());
			schoolEntry.setSCHULTRAEGER( getMainObject().getSchultraeger());
			setSessionObject(oName, schoolEntry);
		}
	}
	@SuppressWarnings("unchecked")
	private void initData(String anwf, String option, String schoolId) throws SQLException, PermissionException
	{
		PortletRequest request	= PortletActionContext.getRequest();
		request.setAttribute("tspi",	schoolId);
		request.setAttribute("option",		option);
		request.setAttribute("anwf",		anwf);
		
		List<psp_getSchule> results = (List<psp_getSchule>)getSessionObject(SearchAction.class.getName()+"-searchResults");
		if(results!=null)
		{
			Iterator<psp_getSchule> it = results.iterator();
			while(it.hasNext())
			{
				psp_getSchule s = (psp_getSchule) it.next();
				if(s.getID()!=null && s.getID().equals(schoolId))
					setSchoolEntry(s);
			}
		}
		if(schoolEntry==null)
		{
			super.initData(true);
			initSchoolEntry(schoolId);
		}
	}
	boolean hierarch;
	String lastSchoolId;
	String lastSchoolName;
	public String execute() throws Exception
	{
//		System.out.println("Schulnavigation ViewAction execute()");
		setMode(2);
		lastSchoolId	= getSessionAttribute("lastSchoolId");
		lastSchoolName	= getSessionAttribute("lastSchoolName");
		hierarch = getTspm()!=null && ( getTspm().equals("hierarch1") || getTspm().equals("hierarch2") );
		if(hierarch)
		{
			initData(  getParm("anwf"), getParm("option"), getParm("tspi"));
		}
		else
		{
			initData(  getParm("anwf"), getParm("option"), getParm("tspi"));
			setSessionAttribute("lastSchoolId",		getParm("tspi"));
			setSessionAttribute("lastSchoolName",	getSchoolEntry().getCC_NAME_1_ORT());
		}
		if(schoolEntry==null && !hierarch) return "reinit";
		if(hierarch) return "hierarch";
		return SUCCESS;
	}

	public psp_getSchule getSchoolEntry()
	{
		return schoolEntry;
	}
	public void setSchoolEntry(psp_getSchule schoolEntry)
	{
		this.schoolEntry = schoolEntry;
	}

	public String getLastSchoolId()
	{
		return lastSchoolId;
	}
	public void setLastSchoolId(String lastSchoolId)
	{
		this.lastSchoolId = lastSchoolId;
	}
	public String getLastSchoolName()
	{
		return lastSchoolName;
	}
	public void setLastSchoolName(String lastSchoolName)
	{
		this.lastSchoolName = lastSchoolName;
	}
	
	
}
