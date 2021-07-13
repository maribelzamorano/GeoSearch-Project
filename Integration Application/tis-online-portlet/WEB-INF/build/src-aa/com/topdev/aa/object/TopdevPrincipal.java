package com.topdev.aa.object;

import java.io.Serializable;
import java.security.Principal;

public class TopdevPrincipal implements Principal, Serializable
{
	private static final long	serialVersionUID	= 1L;
	public String	dienId;
	public String	loginId;
	public String	name12;
	public String	id;
	public String	gparCode;	
	
	public TopdevPrincipal(Principal p)
	{
		if(p!=null) setLoginId(p.getName());
	}
	public TopdevPrincipal(String loginId)
	{
		setLoginId(loginId);
	}
	
	
	public String getName()
	{
		return loginId;
	}

	public String getGparCode()
	{
		return gparCode;
	}

	public void setGparCode(String gparCode)
	{
		this.gparCode = gparCode;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getLoginId()
	{
		return loginId;
	}

	public void setLoginId(String loginId)
	{
		this.loginId = loginId;
	}

	public String getName12()
	{
		return name12;
	}

	public void setName12(String name12)
	{
		this.name12 = name12;
	}

	public String getDienId()
	{
		return dienId;
	}

	public void setDienId(String dienId)
	{
		this.dienId = dienId;
	}
}