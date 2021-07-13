package com.topdev.aa.object;

public class ListField
{
	public String name; 		//zB. PGPK_ID
	public String value;		//Wert
	public boolean hidden;		//hidden-field?
	public boolean link; 		//ist ein Link?
	public String linkAction;	//z.B. javascript:make();
	public int row;				//zeile
	public int column;			//spalte
	public boolean primary;		//ist es das rbare prim ID-Feld?
	public boolean alterable;	//ist dynamisch aerbar?
	public String HTMLBefore;	//
	public String HTMLAfter;	//
	public String width;	//

	
	/**
	 * @param name
	 * @param value
	 * @param hidden
	 * @param link
	 * @param linkAction
	 * @param row
	 * @param column
	 * @param primary
	 */
	public ListField(String name, String value, boolean hidden, boolean link, String linkAction, int row, int column, boolean primary, boolean alterable)
	{
		this.name = name;
		this.value = value;
		this.hidden = hidden;
		this.link = link;
		this.linkAction = linkAction;
		this.row = row;
		this.column = column;
		this.primary = primary;
		this.alterable = alterable;
	}
	/**
	 * @return Returns the alterable.
	 */
	public boolean isAlterable()
	{
		return alterable;
	}
	/**
	 * @param alterable The alterable to set.
	 */
	public void setAlterable(boolean alterable)
	{
		this.alterable = alterable;
	}
	/**
	 * @return Returns the column.
	 */
	public int getColumn()
	{
		return column;
	}
	/**
	 * @param column The column to set.
	 */
	public void setColumn(int column)
	{
		this.column = column;
	}
	/**
	 * @return Returns the hidden.
	 */
	public boolean isHidden()
	{
		return hidden;
	}
	/**
	 * @param hidden The hidden to set.
	 */
	public void setHidden(boolean hidden)
	{
		this.hidden = hidden;
	}
	/**
	 * @return Returns the link.
	 */
	public boolean isLink()
	{
		return link;
	}
	/**
	 * @param link The link to set.
	 */
	public void setLink(boolean link)
	{
		this.link = link;
	}
	/**
	 * @return Returns the linkAction.
	 */
	public String getLinkAction()
	{
		return linkAction;
	}
	/**
	 * @param linkAction The linkAction to set.
	 */
	public void setLinkAction(String linkAction)
	{
		this.linkAction = linkAction;
	}
	/**
	 * @return Returns the name.
	 */
	public String getName()
	{
		return name;
	}
	/**
	 * @param name The name to set.
	 */
	public void setName(String name)
	{
		this.name = name;
	}
	/**
	 * @return Returns the primary.
	 */
	public boolean isPrimary()
	{
		return primary;
	}
	/**
	 * @param primary The primary to set.
	 */
	public void setPrimary(boolean primary)
	{
		this.primary = primary;
	}
	/**
	 * @return Returns the row.
	 */
	public int getRow()
	{
		return row;
	}
	/**
	 * @param row The row to set.
	 */
	public void setRow(int row)
	{
		this.row = row;
	}
	/**
	 * @return Returns the value.
	 */
	public String getValue()
	{
		return value;
	}
	/**
	 * @param value The value to set.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}
	public String getHTMLAfter()
	{
		return HTMLAfter;
	}
	public void setHTMLAfter(String after)
	{
		HTMLAfter = after;
	}
	public String getHTMLBefore()
	{
		return HTMLBefore;
	}
	public void setHTMLBefore(String before)
	{
		HTMLBefore = before;
	}
	public String getWidth()
	{
		return width;
	}
	public void setWidth(String width)
	{
		this.width = width;
	}
}