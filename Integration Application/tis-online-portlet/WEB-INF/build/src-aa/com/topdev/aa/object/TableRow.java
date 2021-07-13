package com.topdev.aa.object;

import java.util.List;

public class TableRow
{
	public List 	cols;
	public List<String> 	hnames;
	public List<String> 	hvalues;
	public String 	ID;
	public Object 	object = null;
	
	public TableRow(List cols, List<String> hNames, List<String> hValues)
	{
		this.cols		= cols;
		this.hnames		= hNames;
		this.hvalues	= hValues;
		this.ID			= "0";
	}
	
	public TableRow(List cols, List<String> hNames, List<String> hValues, String ID)
	{
		this.cols		= cols;
		this.hnames		= hNames;
		this.hvalues	= hValues;
		this.ID			= ID;
	}
	
	public TableRow(List cols, List<String> hNames, List<String> hValues, String ID, Object object)
	{
		this.cols		= cols;
		this.hnames		= hNames;
		this.hvalues	= hValues;
		this.ID			= ID;
		this.object		= object;
	}
	
	/**
	 * @return Returns the cols.
	 */
	public List getCols()
	{
		return cols;
	}
	/**
	 * @param cols The cols to set.
	 */
	public void setCols(List cols)
	{
		this.cols = cols;
	}
	/**
	 * @return Returns the hnames.
	 */
	public List<String> getHnames()
	{
		return hnames;
	}
	/**
	 * @param hnames The hnames to set.
	 */
	public void setHnames(List<String> hnames)
	{
		this.hnames = hnames;
	}
	/**
	 * @return Returns the hvalues.
	 */
	public List<String> getHvalues()
	{
		return hvalues;
	}
	/**
	 * @param hvalues The hvalues to set.
	 */
	public void setHvalues(List<String> hvalues)
	{
		this.hvalues = hvalues;
	}
	/**
	 * @return Returns the iD.
	 */
	public String getID()
	{
		return ID;
	}
	/**
	 * @param id The iD to set.
	 */
	public void setID(String id)
	{
		ID = id;
	}
}