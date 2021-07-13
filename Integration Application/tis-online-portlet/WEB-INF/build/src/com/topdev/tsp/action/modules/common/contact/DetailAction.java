package com.topdev.tsp.action.modules.common.contact;

import java.sql.SQLException;
import java.util.HashMap;

import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.view.common.Contact;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	Contact mainObject;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject(new Contact(getSessionId()));
		//setMainObject((Contact)loadMainObject("1", new Contact()));
		setRtErrors(mainObject.getErrors());
	}

	public String save() throws Exception
    {
		init("save");
		HashMap map = getActionParameters();
		//mainObject.setBesonderheiten_beau(				(String) map.get("besonderheiten_beau"));
		setRtErrors(mainObject.saveData());
		return "saved";
		
    }
	public String edit() throws Exception
    {
		boolean reinit = getMode()==2;
		setMode(1);
		initData( reinit );
		return edit_ext();
    }
	public Contact getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(Contact mainObject)
	{
		this.mainObject = mainObject;
	}


}