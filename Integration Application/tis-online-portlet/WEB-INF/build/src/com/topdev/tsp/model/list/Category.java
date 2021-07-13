package com.topdev.tsp.model.list;

import java.io.Serializable;

public class Category implements Serializable
{
	private static final long	serialVersionUID	= 1L;

	@Override
	public boolean equals(Object obj)
	{
		if(obj.getClass().isInstance(this))
		{
			Category c = (Category)obj;
			if(c.getCode().equals(getCode()) && c.getDecode().equals(getDecode())) return true;
			else return false;
		}
		return super.equals(obj);
	}
	String code;
	String decode;
	
	public Category(String code, String decode)
	{
		this.code = code;
		this.decode = decode;
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
}