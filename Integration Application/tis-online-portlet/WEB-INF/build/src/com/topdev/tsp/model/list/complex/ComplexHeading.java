package com.topdev.tsp.model.list.complex;

import java.io.Serializable;


public class ComplexHeading implements Cloneable, Serializable
{
	private static final long	serialVersionUID	= 1L;
	String width;
	String align;
	String value;

	@Override 
	public ComplexHeading clone() 
	{ 
		try { return (ComplexHeading) super.clone(); } 
		catch ( CloneNotSupportedException e ) { throw new InternalError(); }
	}
	public ComplexHeading(String value)
	{
		setValue(value);
	}
	public ComplexHeading(String value, String align)
	{
		setValue(value);
		setAlign(align);
	}
	public String getAlign()
	{
		return align;
	}
	public void setAlign(String align)
	{
		this.align = align;
	}
	public String getValue()
	{
		return value;
	}
	public void setValue(String value)
	{
		this.value = value;
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