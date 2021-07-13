package com.topdev.aa.lib;

import java.util.ResourceBundle;

public class Message
{
	private static ResourceBundle	msg;
	private static String			msgFileName = "messages";
	static
	{
		try { msg = ResourceBundle.getBundle(msgFileName); }
		catch (Exception e)
		{
			System.out.println("Die Datei "+msgFileName+" konnte nicht geladen werden.");
			e.printStackTrace();
		}
	}
	public static String getText(String key)
	{
		String result = null;
		try { result = msg.getString(key); } catch(Exception ex) {}
		try 
		{ 
			if(result==null && key.indexOf("#")>-1) 
				result = msg.getString(key.substring(key.indexOf("#")+1, key.length())); 
		}
		catch(Exception ex) {}
		try 
		{
			if(result==null && key.indexOf("#")>-1) 
				result = msg.getString("global."+key.substring(key.indexOf("#")+1, key.length())); 
		}
		catch(Exception ex) {}
		if(result==null) result="???"+key+"???";
		return result;
	}
}