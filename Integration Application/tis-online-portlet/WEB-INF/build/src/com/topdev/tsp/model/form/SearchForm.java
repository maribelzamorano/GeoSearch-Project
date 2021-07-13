package com.topdev.tsp.model.form;

import java.io.Serializable;

public class SearchForm implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	private String page;
	
	public SearchForm()
	{
		page = "1";
	}
	public String getPage()
	{
		return page;
	}
	public void setPage(String page)
	{
		this.page = page;
	}
	
}