package com.topdev.tsp.action.modules.section_documents;

import java.sql.SQLException;

import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.view.SchoolDocuments;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolDocuments mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolDocuments)loadMainObject(getParm("tspi"), new SchoolDocuments(), "objectNamePrefixConvention_TBSH"));
		setRtErrors(mainObject.getErrors());
	}

	public String save() throws Exception
	{
		init("save");
		setRtErrors(getMainObject().saveData());
		return "saved";
	}

	public SchoolDocuments getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolDocuments mainObject)
	{
		this.mainObject = mainObject;
	}
}