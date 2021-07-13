package com.topdev.aa.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.jdom.Document;

public class GlobalContainer implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	public  boolean     		js;					public boolean getJs()						{return  this.js; }  
	public 	String 				absoluteUrl;	 	public String getAbsoluteUrl() 				{ return this.absoluteUrl; }
	public 	long 				timeStamp;	 		public String getTimeStamp() 				{ return String.valueOf(this.timeStamp); }
	public 	String				browser;			public String getBrowser()					{ return this.browser; }
	public 	String 				path;	 			public String getPath() 					{ return this.path; }
	public	Locale 				locale;

	public 	Properties 					p;					public String getProperty(String pString)	{ return p!=null?p.getProperty(pString):null; }
	public 	List<SiteGroupContainer>	siteGroupContainers;
	public 	List<Attribute>				attributes;
	private	Document					xmlObjectTree;
	
	class Attribute implements Serializable
	{
		private static final long	serialVersionUID	= 4049635711173013810L;
		Attribute(String s1, Object o1)
		{
			this.attribute		=o1;
			this.attributeName	=s1;
		}
		public String attributeName=null;
		public Object attribute=null;
	}

	public GlobalContainer(ServletContext sc,Locale locale) throws Exception
	{
		this.locale = locale;
		this.siteGroupContainers=(new ConfigLoader()).getSiteConfigs(sc);
		this.attributes = new ArrayList<Attribute>();
	}

	public SiteContainer getSiteContainer(String pMapping)
	{
		Iterator<SiteGroupContainer> groupIterator=this.siteGroupContainers.iterator();
		while(groupIterator.hasNext())
		{
			List<SiteContainer> tempList=groupIterator.next().siteContainers;
			Iterator<SiteContainer> SiteContainerIterator = tempList.iterator();
			while(SiteContainerIterator.hasNext())
			{
				SiteContainer sc=SiteContainerIterator.next();
				if(sc.mapping.equals(pMapping)) return sc;
			}
		}
		return null;
	}


	public boolean setSiteContainer(SiteContainer pSiteContainer) throws Exception
	{
		Iterator<SiteGroupContainer> groupIterator=this.siteGroupContainers.iterator();
		while(groupIterator.hasNext())
		for(int n=0; n<siteGroupContainers.size();n++)
		{
			List<SiteContainer> tempList=siteGroupContainers.get(n).siteContainers;
			for(int i=0; i<tempList.size();i++)
			{
				if(tempList.get(i).mapping.equals(pSiteContainer.mapping))
				{
					tempList.set(i,pSiteContainer);
					SiteGroupContainer sgc = siteGroupContainers.get(n);
					sgc.siteContainers=tempList;
					siteGroupContainers.set(n,sgc);
					return true;
				}
			}
		}
		return false;
	}
	
	
	public boolean setAttribute(String s1, Object o1)
	{
		Iterator<Attribute> it=this.attributes.iterator();
		while(it.hasNext())
		{
			Attribute a=it.next();
			if(a.attributeName.equals(s1))
			{
				a.attribute=o1;
				return true;
			}
		}
		attributes.add(new Attribute(s1,o1));
		return true;
	}
	
	
	public Object getAttribute(String s1)
	{
		Iterator<Attribute> it=this.attributes.iterator();
		while(it.hasNext())
		{
			Attribute a=it.next();
			if(a.attributeName.equals(s1))
				return a.attribute;
		}
		return null;	
	}
	
	
	public List<String> getAttributes()
	{
		List<String> elements =null;
		
		Iterator<Attribute> it=this.attributes.iterator();
		while(it.hasNext())
		{
			Attribute a=it.next();
			elements.add(a.attributeName);
		}
		return elements;
	}
	
	
	public boolean removeAttribute(String s1)
	{
		Iterator<Attribute> it=this.attributes.iterator();
		while(it.hasNext())
		{
			Attribute a=it.next();
			if(a.attributeName.equals(s1))
			{
				attributes.remove(a);
				return true;
			}
		}
		return false;
	}
	
	
	public Document getXmlObjectTree()
	{
		return xmlObjectTree;
	}
	
	public void setXmlObjectTree(Document xmlObjectTree) throws Exception
	{
		if(xmlObjectTree==null) throw new Exception("XML-Object-Baum wurde nicht initialisiert.\n");
		if(!xmlObjectTree.hasRootElement()) throw new Exception("XML-Object-Baum wurde nicht initialisiert.\n");
		this.xmlObjectTree = xmlObjectTree;
	}
}