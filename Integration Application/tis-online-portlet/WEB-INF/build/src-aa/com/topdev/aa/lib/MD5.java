package com.topdev.aa.lib;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Node;


public class MD5
{
	public static String createMD5HashCode(Node o) throws NoSuchAlgorithmException, NoSuchProviderException, IOException
	{
		Log log = LogFactory.getLog("MD5 - createMD5HashCode");
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try
		{
			Transformer transformer = TransformerFactory.newInstance().newTransformer();;
		    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			transformer.transform(new DOMSource(o), new StreamResult(baos));
		}
		catch(Exception ex)
		{
			log.error("Es ist ein Fehler bei der Hashwertberechnung aufgetreten\n"+ex.getLocalizedMessage());
		}
		String result = createMD5HashCode(baos.toByteArray());
		return result;
	}
	
	public static String createMD5HashCode(Object o)
	{
		try
		{
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream    oos  = new ObjectOutputStream(baos);
			oos.writeObject(o);
			oos.close();
			String result = createMD5HashCode(baos.toByteArray());
			return result;
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return null;
		}
	}
	public static String createMD5HashCode(byte[] byteArray) throws NoSuchAlgorithmException, NoSuchProviderException
	{
		MessageDigest	md5			= MessageDigest.getInstance("MD5");
		byte[]			md5Bytes	= md5.digest(byteArray);
		StringBuffer	hexValue	= new StringBuffer();

		for (int i=0; i<md5Bytes.length; i++)
		{
		    int val = ((int) md5Bytes[i] ) & 0xff; 
		    if (val < 16) hexValue.append("0");
		    hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();
	}
}