package com.topdev.tsp.model.form.modules.system;

import com.topdev.tsp.model.form.SearchForm;

public class PtsSearchForm extends SearchForm
{
	private static final long	serialVersionUID	= 1L;
	private String von;
	private String bis;
	
	
	
	public String getBis()
	{
		return bis;
	}
	public void setBis(String bis)
	{
		this.bis = bis;
	}
	public String getVon()
	{
		return von;
	}
	public void setVon(String von)
	{
		this.von = von;
	}
}