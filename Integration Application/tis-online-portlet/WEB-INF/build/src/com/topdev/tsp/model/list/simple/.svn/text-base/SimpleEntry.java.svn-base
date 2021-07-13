package com.topdev.tsp.model.list.simple;

import java.io.Serializable;


public class SimpleEntry implements Cloneable, Serializable
{
	private static final long	serialVersionUID	= 1L;
	String code;
	String decode;
	String type		= "textfield";	//checkbox | textfield
	String visible	= "true";		//1==sichtbar 2==versteckt
	String name		= "";			//

	@Override 
	public SimpleEntry clone() 
	{ 
		try { return (SimpleEntry) super.clone(); } 
		catch ( CloneNotSupportedException e ) { throw new InternalError(); }
	}
	public SimpleEntry(String name, String type)
	{
		setName(name);
		setType(type);
	}
	public SimpleEntry(String name, String decode, String type)
	{
		setName(name);
		setDecode(decode);
		setType(type);
	}
	public SimpleEntry(String name, String code, String decode, String type)
	{
		setName(name);
		setCode(code);
		setDecode(decode);
		setType(type);
	}
	public String getCode()
	{
		return code;
	}
	public void setCode(String code)
	{
		this.code = code;
	}
	public String getDecode()
	{
		return decode;
	}
	public void setDecode(String decode)
	{
		this.decode = decode;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getVisible()
	{
		return visible;
	}
	public void setVisible(String visible)
	{
		this.visible = visible;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}
}