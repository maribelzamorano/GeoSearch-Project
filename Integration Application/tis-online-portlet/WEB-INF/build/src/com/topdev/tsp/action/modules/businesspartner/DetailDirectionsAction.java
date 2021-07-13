package com.topdev.tsp.action.modules.businesspartner;

import java.sql.SQLException;

import javax.portlet.WindowState;

import org.apache.struts2.portlet.context.PortletActionContext;

import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.view.SchoolOverview;

public class DetailDirectionsAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolOverview schoolOverview;
	SchoolOverview mainObject;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject(loadMainObject(getParm("tspi"), new SchoolOverview(), "directions"));
		setRtErrors(mainObject.getErrors());
	}
	public String view() throws Exception
    {
		if(!PortletActionContext.getRenderRequest().getWindowState().equals(WindowState.MAXIMIZED)) return "overview";
		return super.view();
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