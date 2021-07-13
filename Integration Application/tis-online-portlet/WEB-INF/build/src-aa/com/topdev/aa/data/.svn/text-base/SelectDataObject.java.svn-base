package com.topdev.aa.data;

import java.util.List;

public class SelectDataObject extends DataObject
{
	private static final long	serialVersionUID	= 1L;

	/**
	 * Darstellung in der liste*/
	public String label;

	/**
	 * Darstellung in der liste*/
	public List labelList;

	/**
	 * attribute in der liste*/
	public String attribute;

	/**
	 * Wert der sich hinter Darstellung verbirgt*/
	public String value;

	/**
	 * Selektiert?*/
	public String selected="0";


	public SelectDataObject(String label, String value)
	{
		this(label,value,null);
	}

	public SelectDataObject(String label, String value, String attribute)
	{
		this.label=label;
		this.value=value;
		this.attribute=attribute;
		this.ID=value;
	}



	public String getLabel()
	{
		return label;
	}

	public String getValue()
	{
		return value;
	}

	public void setLabel(String string)
	{
		label = string;
	}

	public void setValue(String string)
	{
		value = string;
	}

	public String getSelected()
	{
		return selected;
	}

	public void setSelected(String string)
	{
		selected = string;
	}

	/**
	 * @return
	 */
	public String getAttribute() {
		return attribute;
	}

	/**
	 * @param string
	 */
	public void setAttribute(String string) {
		attribute = string;
	}

	/**
	 * @return Returns the labelList.
	 */
	public List getLabelList()
	{
		return labelList;
	}
	/**
	 * @param labelList The labelList to set.
	 */
	public void setLabelList(List labelList)
	{
		this.labelList = labelList;
	}
}