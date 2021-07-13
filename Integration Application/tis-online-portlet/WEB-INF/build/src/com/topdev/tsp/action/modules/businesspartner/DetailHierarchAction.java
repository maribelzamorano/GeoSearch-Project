package com.topdev.tsp.action.modules.businesspartner;

import java.sql.SQLException;

import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.view.SchoolOverview;

public class DetailHierarchAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	String gepa_id_traeger;
	
	public String getGepa_id_traeger() {
		return gepa_id_traeger;
	}

	public void setGepa_id_traeger(String gepa_id_traeger) {
		this.gepa_id_traeger = gepa_id_traeger;
	}
	SchoolOverview schoolOverview;
	SchoolOverview mainObject;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject(loadMainObject(getParm("tspi"), new SchoolOverview(),  "hierarch"));
		setSchoolOverview(getMainObject());
		setRtErrors(mainObject.getErrors());
		
	}
	public String view_ext() throws Exception
    {
	
		return "view";
	}

	public String hierarch() throws Exception
    {
		
		return "view";
	}
	public String edit_ext() throws Exception
    {
		return "edit";
    }

	public String save() throws Exception
	{
		initData(false);
		getSchoolOverview().setSchulnummer(getParameter("Schulnummer"));
		getSchoolOverview().setSchulname(getParameter("Schulname"));
		getSchoolOverview().setSchulart(getParameter("Schulart"));
		setRtErrors(getSchoolOverview().saveData());
		return "saved";
	}
	public SchoolOverview getSchoolOverview() {
		return schoolOverview;
	}
	public void setSchoolOverview(SchoolOverview schoolOverview) {
		this.schoolOverview = schoolOverview;
	}

	public SchoolOverview getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolOverview mainObject)
	{
		this.mainObject = mainObject;
	}


}