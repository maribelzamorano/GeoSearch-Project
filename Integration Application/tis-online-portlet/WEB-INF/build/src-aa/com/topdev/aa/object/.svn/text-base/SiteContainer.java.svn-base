package com.topdev.aa.object;

import java.io.Serializable;

public class SiteContainer implements Serializable
{
	private static final long serialVersionUID = 3257002159558963507L;
	public boolean foldBox	=false;
	public boolean fold		=false;
	public String mapping;
	public String url;
	public String label;

	public SiteContainer()
	{
	}

	public SiteContainer(String pMapping)
	{
		this.mapping=pMapping;
	}

	public SiteContainer(String pMapping, boolean pFold)
	{
		this.mapping=pMapping;
		this.foldBox=true;
		this.fold	=pFold;
	}

	public SiteContainer(String pMapping, boolean pFold, String pLabel)
	{
		this.label=pLabel;
		this.mapping=pMapping;
		this.foldBox=true;
		this.fold	=pFold;
	}

	public SiteContainer(String pMapping, String pUrl)
	{
		this.mapping=pMapping;
		this.url	=pUrl;
	}
}