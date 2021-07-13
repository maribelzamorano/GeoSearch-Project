package com.topdev.aa.object;

import java.util.HashMap;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.data.DataObject;
import com.topdev.aa.exception.SessionEndException;
import com.topdev.aa.lib.Validator;

public class MainObject extends DataObject
{
	String name = "none";
	
	public void checkState() throws SessionEndException
	{
		if(ServletActionContext.getRequest().getSession()==null || ServletActionContext.getRequest().getSession().getAttribute("container")==null)
			throw new SessionEndException("Ihre Sitzung ist ausgelaufen.");
	}

	private static final long	serialVersionUID	= 1L;
	Map<String,String> errors = new HashMap<String,String>();
	
	public Map<String, String> getErrors()
	{
		return errors;
	}
	public void setErrors(Map<String, String> errors)
	{
		this.errors = errors;
	}
	public void clearErrors()
	{
		setErrors(new HashMap<String, String>());
	}
	public void defaultValidation(String name, String value)
	{
		if(Validator.isSQLInjected(value)) getErrors().put(name, "Es wurden ungültige Zeichen in der Eingabe erkannt.");
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
