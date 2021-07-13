package com.topdev.tsp.action.modules.school_image;

import java.sql.SQLException;

import com.topdev.aa.model.action.DefaultImpl;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	String schoolId;
	String imageURL;
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setSchoolId( getParm("schoolId") );
		String	TBSH_ID			= schoolId;
		String	TBSH_SHORTNAME	= "GEBI";

		try { imageURL = DefaultImpl.initDownload(TBSH_ID, TBSH_SHORTNAME, getSessionId(), getUserName()); }
		catch (Exception e) { e.printStackTrace(); }
	}

	public String getSchoolId()
	{
		return schoolId;
	}

	public void setSchoolId(String schoolId)
	{
		this.schoolId = schoolId;
	}

	public String getImageURL()
	{
		return imageURL;
	}

	public void setImageURL(String imageURL)
	{
		this.imageURL = imageURL;
	}
}
