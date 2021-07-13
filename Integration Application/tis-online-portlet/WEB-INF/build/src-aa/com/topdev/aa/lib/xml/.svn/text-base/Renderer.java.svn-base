package com.topdev.aa.lib.xml;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

public class Renderer
{
	public static HashMap<String, Templates> templates	= new HashMap<String, Templates>();
	public final static int		MODE_XML	= 1;
	public final static int		MODE_HTML	= 2;
	public final static int		MODE_PDF	= 3;
	private static boolean debug = false;

	public static InputStream transform(InputStream xmlStream, String xslPath) throws ParserConfigurationException, SAXException, IOException, TransformerException
	{
		return new ByteArrayInputStream(transformToBytes(xmlStream, xslPath));
	}
	
	public static byte[] transformToBytes(InputStream xmlStream, String xslPath) throws ParserConfigurationException, SAXException, IOException, TransformerException
	{
		return transformToBytes(xmlStream, xslPath, MODE_XML);
	}
	
	public static byte[] transformToBytes(InputStream xmlStream, String xslPath, int mode) throws ParserConfigurationException, SAXException, IOException, TransformerException
	{
		if(debug)
		{
			System.out.println("Beginne transform ("+(new Date()).getTime()+")");
			if(templates.get(xslPath)!=null)
				System.out.println("Verwende gepuffertes Template");
		}
		ByteArrayOutputStream	out			= new ByteArrayOutputStream();
		TransformerFactory		tFactory	= TransformerFactory.newInstance();
    	Templates				template	= templates.get(xslPath);
//    	if(!debug && template==null)		
    		template	= tFactory.newTemplates(new StreamSource(new File(xslPath)));
		DocumentBuilder			builder		= DocumentBuilderFactory.newInstance().newDocumentBuilder();
		Document				doc			= builder.parse(xmlStream);
		if(debug) System.out.println("XML-parsing abgeschlossen ("+(new Date()).getTime()+")");

		Transformer				transformer	= template.newTransformer();

		if(templates.get(xslPath)==null) templates.put(xslPath, template);
		transformer.setOutputProperty( OutputKeys.INDENT,	"no");
		transformer.setOutputProperty( OutputKeys.ENCODING,	"ISO-8859-15");
		transformer.setOutputProperty( OutputKeys.METHOD,	mode==MODE_HTML?"html":"xml");

		if(mode==MODE_HTML || mode==MODE_XML)
		{
			transformer.transform(	new DOMSource(doc),	new StreamResult(out));
		}
		else if(mode==MODE_PDF)
		{
			FopFactory		fopFactory	= FopFactory.newInstance();
			FOUserAgent		foUserAgent	= fopFactory.newFOUserAgent();
	        try
	        {
	            Fop fop = fopFactory.newFop(MimeConstants.MIME_PDF, foUserAgent, out);
	            transformer.setParameter("versionParam", "2.0");
	            Result res = new SAXResult(fop.getDefaultHandler());
	            transformer.transform(new DOMSource(doc), res);
	        }
	        finally { out.close(); }
		}
		xmlStream.close();

		if(debug) System.out.println("Transform beendet ("+(new Date()).getTime()+")");
		return out.toByteArray();
	}
}