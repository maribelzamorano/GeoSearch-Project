package com.topdev.aa.object;

public class ListCell
{
	private String name; 		//Name
	private String value;		//Wert
	private String html;		//html
	
	private String convert(String s)
	{
		if(s!=null)
		{
			s=s.replaceAll("\"","\\\\\"");
			s=s.replaceAll("\n","\\\\"+"\\n");
			s=s.replaceAll("\r","\\\\"+"\\r");
		}
		return s;
	}
	public ListCell(String value)
	{
		this.value	= value;
		this.name	= "";
		this.html	= "";
	}
	/**
	 * @return Returns the html.
	 */
	public String getHtml()
	{
		return convert(this.html);
	}
	/**
	 * @param html The html to set.
	 */
	public void setHtml(String html)
	{
		this.html = html;
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
	 * @return Returns the value.
	 */
	public String getValue()
	{
		if(this.value!=null) return convert(this.value).replaceAll("<","&lt;").replaceAll(">","&gt;");
		else return null;
	}
	/**
	 * @param value The value to set.
	 */
	public void setValue(String value)
	{
		this.value = value;
	}
}