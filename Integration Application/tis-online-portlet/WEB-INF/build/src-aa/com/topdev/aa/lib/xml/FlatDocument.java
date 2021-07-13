package com.topdev.aa.lib.xml;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class FlatDocument
{
	private Document	doc;
	private Element		root;
	private	boolean		debug	= false;		
    private Log			log		= LogFactory.getLog(this.getClass());

	public FlatDocument()
	{
		try
		{
			DocumentBuilder	builder	= DocumentBuilderFactory.newInstance().newDocumentBuilder();
			setDoc(builder.parse(new ByteArrayInputStream("<?xml version=\"1.0\" encoding=\"iso-8859-15\"?><root/>".getBytes("ISO-8859-15"))));
			setRoot((Element) doc.getFirstChild());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public void appendTextNode(String name, String content)
	{
		appendTextNode(name, content, false);
	}
	public void appendTextNode(String name, String content, boolean allowBreaks)
	{
		if(content==null) return;
		if(debug)
			System.out.println("Fuege "+name+" Wert ["+content+"] hinzu");
		try
		{
			if(allowBreaks)
			{
				Element node = getDoc().createElement(name);
				String[] contents = content.split("\n");
				for(int i=0; i<contents.length; i++)
				{
					Element node2 = getDoc().createElement("text");
					node2.setTextContent(contents[i]);
					node.appendChild(node2);
				}
				getRoot().appendChild(node);
			}
			else
			{
				Element node = getDoc().createElement(name);
				node.setTextContent(content);
				getRoot().appendChild(node);
			}
		}
		catch(DOMException e)
		{
			log.error("Fehler beim Einfuegen des XML-Element ["+name+"]\n"+e.getLocalizedMessage());
		}
	}

	public InputStream render() throws TransformerException
	{
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.transform(new DOMSource(getDoc()), new StreamResult(out));
		byte[] bytes = out.toString().getBytes();
		if(debug) System.out.println(new String(bytes));
		return (InputStream)(new ByteArrayInputStream(bytes));
	}

	public Document getDoc()
	{
		return doc;
	}

	public void setDoc(Document doc)
	{
		this.doc = doc;
	}

	public Element getRoot()
	{
		return root;
	}

	public void setRoot(Element root)
	{
		this.root = root;
	}

	public void transform(String path)
	{
		
	}
}