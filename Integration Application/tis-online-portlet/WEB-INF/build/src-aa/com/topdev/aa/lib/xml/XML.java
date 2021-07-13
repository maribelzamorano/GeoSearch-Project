package com.topdev.aa.lib.xml;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

public class XML
{
	private Document	doc;
	private Element		root;
	private String		encoding = "UTF-8";
	public	Log			log = LogFactory.getLog(this.getClass());

	public boolean empty(String s)
	{
		if(s!=null && s.length()>0) return false;
		return true;
	}
	
	public XML(String encoding)
	{
		if(encoding == null) encoding = this.encoding;
		try
		{
			DocumentBuilder	builder	= DocumentBuilderFactory.newInstance().newDocumentBuilder();
			setDoc(builder.parse(new ByteArrayInputStream(("<?xml version=\"1.0\" encoding=\""+encoding+"\"?><root/>").getBytes(encoding))));
			setRoot((Element) doc.getFirstChild());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	public XML()
	{
		this(null);
	}
	public void appendPdfTextChildToRoot(String textElementName, String content, String attributeName, String attributeValue)
	{
		if (empty(content)) return;
		Element block;
		Element e = doc.createElement(textElementName);
		String[] lines = content.split("\\n");
		for(int i=0; i< lines.length; i++)
		{
			block = doc.createElement("block");
			block.setTextContent(lines[i]);
			e.appendChild(block);
		}
		if(attributeName!=null)
			e.setAttribute(attributeName, attributeValue);
		root.appendChild(e);
	}
	public Element createContentElement(String name, String content)
	{
		Element e = doc.createElement(name);
		e.setTextContent(content);
		return e;
	}
	public Element createE(String name, String content)	//kurzform
	{
		return createContentElement(name, content);
	}
	public Element createContentElement(String name, String content, String attributeName, String attributeValue)
	{
		Element e = createContentElement(name, content);
		e.setAttribute(attributeName, attributeValue);
		return e;
	}

	public InputStream render() throws TransformerException
	{
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Transformer transformer = TransformerFactory.newInstance().newTransformer();
		transformer.setOutputProperty( OutputKeys.INDENT,	"no");
		transformer.setOutputProperty( OutputKeys.ENCODING,	encoding);
		transformer.setOutputProperty( OutputKeys.METHOD,	"xml");
		transformer.transform(new DOMSource(getDoc()), new StreamResult(out));
		byte[] bytes = out.toString().getBytes();
		return (InputStream)(new ByteArrayInputStream(bytes));
	}
	
	public String getEncodedString(String encoding)
	{
		String result = new String(getBytes());
		result =
			"<?xml version=\"1.0\" encoding=\""+encoding+"\"?>" +
			result.substring(result.indexOf("?>")+2);
		return result;
	}

	public byte[] getBytes() 
	{
		try
		{
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			Transformer transformer = TransformerFactory.newInstance().newTransformer();
			transformer.transform(new DOMSource(getDoc()), new StreamResult(out));
			return out.toString().getBytes();
		}
		catch(TransformerException e)
		{
			log.error("Fehler bei Transformation von XML-Daten:"+e.getLocalizedMessage());
			e.printStackTrace();
			return null;
		}
	}
	
	public Element createElement(String name)
	{
		return getDoc().createElement(name);
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
}