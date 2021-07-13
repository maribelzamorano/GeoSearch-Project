package com.topdev.aa.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class SiteGroupContainer implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	public List<SiteContainer> siteContainers;
	
	public SiteGroupContainer(List<SiteContainer> pList)	{this.siteContainers=pList;}
	public SiteGroupContainer()	{this.siteContainers=new ArrayList<SiteContainer>();}
	public SiteGroupContainer(SiteContainer pSiteContainer)	
	{
		this.siteContainers=new ArrayList<SiteContainer>();
		this.siteContainers.add(pSiteContainer);
	}
}