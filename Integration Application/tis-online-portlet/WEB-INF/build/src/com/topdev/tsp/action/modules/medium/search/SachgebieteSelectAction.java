package com.topdev.tsp.action.modules.medium.search;

import java.util.List;

import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.data.BobjKodierung;

public class SachgebieteSelectAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;
	String sublistName;
	String ajaxId;
	List<BobjKodierung> results;

	public String view() throws Exception
	{
	    results = com.topdev.service.mediumsachgebiet.Client.getAll(getUserName());
		return "success";
	}

	public List<BobjKodierung> getResults()
	{
		return results;
	}

	public void setResults(List<BobjKodierung> results)
	{
		this.results = results;
	}

	public String getSublistName()
	{
		return sublistName;
	}

	public void setSublistName(String sublistName)
	{
		this.sublistName = sublistName;
	}

	public String getAjaxId()
	{
		return ajaxId;
	}

	public void setAjaxId(String ajaxId)
	{
		this.ajaxId = ajaxId;
	}
}