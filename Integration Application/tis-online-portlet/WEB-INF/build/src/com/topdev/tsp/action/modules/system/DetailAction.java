package com.topdev.tsp.action.modules.system;

import java.sql.SQLException;

import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.view.SystemOverview;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SystemOverview mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setPortalAttribute("tspi", "1");
		setTspi("1");
		setMainObject((SystemOverview)loadMainObject(getTspi(), new SystemOverview()));
		setRtErrors(mainObject.getErrors());
	}

	public SystemOverview getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SystemOverview mainObject)
	{
		this.mainObject = mainObject;
	}
}
