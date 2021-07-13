package com.topdev.tsp.action.modules.medium.detail.overview;

import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjMedium;

public class DeleteAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;
	String id;
	String orgUser;
	String pts;

	public String delete() throws Exception
	{
		System.out.println("++++++ delete medium: orgUser="+orgUser+" user="+getUserName()+" id="+id+" pts="+pts);
		BobjMedium medium = new BobjMedium();
		medium.setOrgUser(orgUser);
		medium.setId(id);
		medium.setPts(pts);
		medium.setUser(getUserName());
		Client.deleteMedium(medium);
		return "success";
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getOrgUser()
	{
		return orgUser;
	}

	public void setOrgUser(String orgUser)
	{
		this.orgUser = orgUser;
	}

	public String getPts()
	{
		return pts;
	}

	public void setPts(String pts)
	{
		this.pts = pts;
	}

}