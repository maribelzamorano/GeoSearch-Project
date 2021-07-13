package com.topdev.tsp.model.aop;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class ConfigurationBean implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	public	Log		log						= LogFactory.getLog(this.getClass());
	private	List	testIPs					= new ArrayList(5);
	private	String	uploadDir_unchecked;
	private	String	uploadDir_checked;
	private	String	uploadDir_imported;
	private	String	uploadDir_infected;
	private	String	uploadDir_quarantine;
	private	int		commonFileMaxLength;
	private	List	commonFileValidExtensions;
	private	String	contextUrl;
	private	String	contextUrlNonssl;
	private int		sessionTimeout	= 60*60*2;	// angabe in Sekunden. Default=2h
	private String	realPath;
	private String getInitParameter(ServletContext sc, String name)
	{
		if(sc.getInitParameter(name)!=null) return sc.getInitParameter(name).trim();
		log.error("Konfigurationselement nicht gefunden: "+name);
		return "";
	}
	public void loadConfig(ServletContext sc)
	{
		if(sc==null) throw new NullPointerException("Der übergebene ServletContext darf bei der Konfigurationsinitialisierung nicht null sein.");
		uploadDir_unchecked			= getInitParameter(sc, "uploadDir_unchecked");
		uploadDir_checked			= getInitParameter(sc, "uploadDir_checked");
		uploadDir_imported			= getInitParameter(sc, "uploadDir_imported");
		uploadDir_infected			= getInitParameter(sc, "uploadDir_infected");
		uploadDir_quarantine		= getInitParameter(sc, "uploadDir_quarantine");
		commonFileMaxLength			= Integer.parseInt(getInitParameter(sc, "upload_maxsize"));
		commonFileValidExtensions	= Arrays.asList(getInitParameter(sc, "upload_valid_extensions").replaceAll(" ","").split(","));
		testIPs						= Arrays.asList(getInitParameter(sc, "testIPs").replaceAll(" ","").split(","));
		contextUrl					= getInitParameter(sc, "context-url");
		contextUrlNonssl			= getInitParameter(sc, "context-url_nonssl");
		realPath					= sc.getRealPath("/");
	}
	public int getCommonFileMaxLength()
	{
		return commonFileMaxLength;
	}
	public void setCommonFileMaxLength(int commonFileMaxLength)
	{
		this.commonFileMaxLength = commonFileMaxLength;
	}
	public List getCommonFileValidExtensions()
	{
		return commonFileValidExtensions;
	}
	public void setCommonFileValidExtensions(List commonFileValidExtensions)
	{
		this.commonFileValidExtensions = commonFileValidExtensions;
	}
	public String getContextUrl()
	{
		return contextUrl;
	}
	public void setContextUrl(String contextUrl)
	{
		this.contextUrl = contextUrl;
	}
	public String getContextUrlNonssl()
	{
		return contextUrlNonssl;
	}
	public void setContextUrlNonssl(String contextUrlNonssl)
	{
		this.contextUrlNonssl = contextUrlNonssl;
	}
	public int getSessionTimeout()
	{
		return sessionTimeout;
	}
	public void setSessionTimeout(int sessionTimeout)
	{
		this.sessionTimeout = sessionTimeout;
	}
	public List getTestIPs()
	{
		return testIPs;
	}
	public void setTestIPs(List testIPs)
	{
		this.testIPs = testIPs;
	}
	public String getUploadDir_checked()
	{
		return uploadDir_checked;
	}
	public void setUploadDir_checked(String uploadDir_checked)
	{
		this.uploadDir_checked = uploadDir_checked;
	}
	public String getUploadDir_imported()
	{
		return uploadDir_imported;
	}
	public void setUploadDir_imported(String uploadDir_imported)
	{
		this.uploadDir_imported = uploadDir_imported;
	}
	public String getUploadDir_infected()
	{
		return uploadDir_infected;
	}
	public void setUploadDir_infected(String uploadDir_infected)
	{
		this.uploadDir_infected = uploadDir_infected;
	}
	public String getUploadDir_quarantine()
	{
		return uploadDir_quarantine;
	}
	public void setUploadDir_quarantine(String uploadDir_quarantine)
	{
		this.uploadDir_quarantine = uploadDir_quarantine;
	}
	public String getUploadDir_unchecked()
	{
		return uploadDir_unchecked;
	}
	public void setUploadDir_unchecked(String uploadDir_unchecked)
	{
		this.uploadDir_unchecked = uploadDir_unchecked;
	}
	public String getRealPath()
	{
		return realPath;
	}
	public void setRealPath(String realPath)
	{
		this.realPath = realPath;
	}

}