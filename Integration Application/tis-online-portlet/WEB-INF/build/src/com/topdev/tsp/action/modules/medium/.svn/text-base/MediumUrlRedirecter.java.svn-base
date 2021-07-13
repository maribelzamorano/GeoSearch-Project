package com.topdev.tsp.action.modules.medium;

import java.io.IOException;
import java.util.Date;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.model.action.DefaultImpl;
import com.topdev.service.data.BobjStandard;
import com.topdev.service.medium.Client;
import com.topdev.tsp.action.lib.MediumTokenizer;

public class MediumUrlRedirecter extends DefaultImpl
{
	private static final long	serialVersionUID	= 1L;
	String mid;
	String did;
	String name;
	String usage;
	String type;
	
	public String downloadRedirect() throws Exception
	{
		BobjStandard request = new BobjStandard();
		request.setUser("");
		request.setId(mid);
		Client.incrementDownloadCounter(request);
		String databaseName = ServletActionContext.getServletContext().getInitParameter("databaseName");
		String mediaServerUrl = ServletActionContext.getServletContext().getInitParameter("mediaServerUrl");
		if(usage!=null) usage = usage.substring(0,1);
		String url =mediaServerUrl+"/get.aspx"
			+"?mid="+mid
			+"&file="+name+"."+type
			+"&usage="+usage
			+"&eid="+databaseName
//			+"&type="+type
			+"&token="+MediumTokenizer.getToken(new Date());
		ServletActionContext.getResponse().sendRedirect(url);
		return null;
	}
	public String uploadRedirect() throws IOException, IllegalBlockSizeException, BadPaddingException
	{
		String databaseName = ServletActionContext.getServletContext().getInitParameter("databaseName");
		String mediaServerUrl = ServletActionContext.getServletContext().getInitParameter("mediaServerUrl");

		if(usage!=null) usage = usage.substring(0,1);
		String url =mediaServerUrl+"/Upload.aspx"
			+"?mid="+mid
			+"&did="+did
			+"&name="+name
			+"&usage="+usage
			+"&eid="+databaseName
			+"&type="+type
			+"&token="+MediumTokenizer.getToken(new Date());
		ServletActionContext.getResponse().sendRedirect(url);
		return null;
	}

	public String getMid()
	{
		return mid;
	}
	public void setMid(String mid)
	{
		this.mid = mid;
	}
	public String getDid()
	{
		return did;
	}
	public void setDid(String did)
	{
		this.did = did;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getUsage()
	{
		return usage;
	}
	public void setUsage(String usage)
	{
		this.usage = usage;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
}