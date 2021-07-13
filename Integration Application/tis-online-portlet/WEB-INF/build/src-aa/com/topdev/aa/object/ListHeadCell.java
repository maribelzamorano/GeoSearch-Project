package com.topdev.aa.object;

public class ListHeadCell
{
	private String label; 		//Name
	private String width;		//Wert
	private String html;		//html
	private String align;		//horizontale Ausrichtung

	public ListHeadCell(String label)
	{
		this.label = label;
	}

	public ListHeadCell(String label, String width)
	{
		this.label = label;
		this.width = width;
	}
	
	public ListHeadCell(String label, String width, String align)
	{
		this.label = label;
		if(width!=null) this.width = width;
		this.align = align;
	}
	
	public String toString()
	{
		if(html!=null && html.length()>0) return html;
		else return label;
	}
	
	/**
	 * @return Returns the html.
	 */
	public String getHtml()
	{
		return html;
	}
	/**
	 * @param html The html to set.
	 */
	public void setHtml(String html)
	{
		this.html = html;
	}
	/**
	 * @return Returns the label.
	 */
	public String getLabel()
	{
		return label;
	}
	/**
	 * @param label The label to set.
	 */
	public void setLabel(String label)
	{
		this.label = label;
	}
	/**
	 * @return Returns the width.
	 */
	public String getWidth()
	{
		return width;
	}
	/**
	 * @param width The width to set.
	 */
	public void setWidth(String width)
	{
		this.width = width;
	}
	
	
	/**
	 * @return Returns the align.
	 */
	public String getAlign() {
		return align;
	}
	/**
	 * @param align The align to set.
	 */
	public void setAlign(String align) {
		this.align = align;
	}
}