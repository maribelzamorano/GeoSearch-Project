package com.topdev.aa.data;

import org.jdom.Element;

public class XMLElementDataObject extends DataObject
{
	private static final long	serialVersionUID	= 1L;
	public Element element;

	public XMLElementDataObject(Element pElement)
	{
		this.element = pElement;
	}

	/**
	 * @param node - Tagname
	 */
	public XMLElementDataObject(String node)
	{
		this.element = new Element(node);
		
	}

	public String getID() 
	{
		return this.element.getAttributeValue("ID");
	}

	public String getKZ_EDIT() 
	{
		return this.element.getAttributeValue("KZ_EDIT");
	}
	
	/**
	 * @return KZ_DELETE aus dem jdom-Element objekt heraus zur�ck
	 */
	public String getKZ_DELETE() 
	{
		return this.element.getAttributeValue("KZ_DELETE");
	}
	
	public String getKZ_BROWSE() 
	{
		return this.element.getAttributeValue("KZ_BROWSE");
	}
	
	public String getKZ_DOWNLOAD()
	{
		return this.element.getAttributeValue("KZ_DOWNLOAD");
	}

	/**
	 * @return Returns the element.
	 */
	public Element getElement() 
	{
		return element;
	}

	/**
	 * @param element The element to set.
	 */
	public void setElement(Element element) 
	{
		this.element = element;
	}
}