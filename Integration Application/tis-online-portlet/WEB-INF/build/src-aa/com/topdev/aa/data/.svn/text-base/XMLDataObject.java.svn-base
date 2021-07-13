package com.topdev.aa.data;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.XMLOutputter;

public class XMLDataObject implements Serializable
{
	private static final long	serialVersionUID	= 1L;
	private List<XMLElementDataObject> 	elements;
	private String	node;
	private String 	encoding="unicode";
	private String 	rootName="root";

	/**
	 * @param xml - Ein xml Dokument als String (mit nur einen Wurzelelement)
	 * @param node - Unterobjekte der wurzel die die Liste darstellen sollen
	 * @throws JDOMException
	 */
	public XMLDataObject(String xml, String node) throws JDOMException
	{
		setXML(xml, node);
	}
	
	public XMLDataObject()
	{
		this.elements = new ArrayList<XMLElementDataObject>();
	}
	
	
	/**
	 * @return XML-Code der enthaltenen Elemente mit "root" als Wurzelelement
	 */
	public String getXML()
	{
		return getXML(this.encoding);
	}
	
	/**
	 * @param encoding - Zeichensatz wie z.B. ("unicode"|"utf-8"|"ISO-8859-15"|...)
	 * @return XML-Code der enthaltenen Elemente mit dem angegebenen encoding und "root" als Wurzelelement
	 */
	public String getXML(String encoding)
	{
		Document doc 	= new Document(new Element(rootName));
		Element root 	= doc.getRootElement();
		Element e;
		Iterator<XMLElementDataObject> it		= this.elements.iterator();
		

		while(it.hasNext())
		{
			e = it.next().getElement();
			e.detach();
			root.addContent(e);
		}
		
		XMLOutputter out = new XMLOutputter();
		out.setEncoding(encoding);
		return out.outputString(doc);
	}
	
	/**
	 * @param xml - Ein xml Dokument als String (mit nur einen Wurzelelement)
	 * @param node - Unterobjekte der wurzel die die Liste darstellen sollen
	 * @throws JDOMException
	 */
	public void setXML(String xml, String node) throws JDOMException
	{
		if(node!=null) this.node=node;
		if(xml!=null && node!=null && xml.length()>0 && node.length()>0)
		{
			xml=xml.replaceAll("'","&#39;");
			xml=xml.replaceAll("Ä","&#196;");
			xml=xml.replaceAll("Ö","&#214;");
			xml=xml.replaceAll("Ü","&#220;");
			xml=xml.replaceAll("ä","&#228;");
			xml=xml.replaceAll("ö","&#246;");
			xml=xml.replaceAll("ü","&#252;");
			xml=xml.replaceAll("ß","&#223;");
			
			try
			{
				SAXBuilder builder = new SAXBuilder();
				Document doc = builder.build((InputStream) new ByteArrayInputStream(xml.getBytes()));
				Element e;
				List list = doc.getRootElement().getChildren(node);
				if(list==null) return;
				this.elements=new ArrayList<XMLElementDataObject>();
				Iterator it=list.iterator();
				
				while(it.hasNext())
				{
					e = (Element)it.next();
					this.elements.add(new XMLElementDataObject(e));
				}
				return;
			} 
			catch (IOException e) 
			{
			}
		}
		this.elements=new ArrayList<XMLElementDataObject>(1);
		return;
	}
	
	/**
	 * @return Returns the encoding.
	 */
	public String getEncoding()
	{
		return encoding;
	}
	
	/**
	 * @param encoding The encoding to set.
	 */
	public void setEncoding(String encoding)
	{
		this.encoding = encoding;
	}
	
	/**
	 * @return Returns the node.
	 */
	public String getNode()
	{
		return node;
	}
	
	/**
	 * @param node The node to set.
	 */
	public void setNode(String node)
	{
		this.node = node;
	}
	
	/**
	 * @return Returns the root.
	 */
	public String getRootName()
	{
		return rootName;
	}

	/**
	 * @param root The root to set.
	 */
	public void setRootName(String rootName)
	{
		this.rootName = rootName;
	}

	/**
	 * @return gibt ein List-Object mit Element-Objekten zur�ck.
	 */
	public List<XMLElementDataObject> getElements() 
	{
		return elements;
	}
	
	/**
	 * @param elements The elements to set.
	 */
	public void setElements(List<XMLElementDataObject> elements)
	{
		this.elements = elements;
	}

}