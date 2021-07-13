package com.topdev.tsp.model.aop;

import java.util.MissingResourceException;
import java.util.ResourceBundle;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class TextBean
{
	public static final String 	TYPE_TEXT			="text";
	public static final String 	TYPE_HEADING		="heading";
	public static final String 	TYPE_LABEL			="label";
	public static final String 	TYPE_FIELD_INFO		="field_info";
	public static final String 	TYPE_ICON_INFO		="icon_info";
	public static final String 	TYPE_BUTTON_INFO	="button_info";
	private ResourceBundle 		msgResource			= null;
	public Log					log					= LogFactory.getLog(this.getClass());

	public TextBean()
	{
		log.info("Texte wurden initialisiert");
		initMsgData();
	}
	public String getHeading(String key)
	{
		return getText(key,TextBean.TYPE_HEADING);
	}
	public String getText(String key)
	{
		if(msgResource==null) initMsgData();
		try
		{
			return msgResource.getString(key);
			//return new String(msgResource.getString(key).getBytes(), "UTF-8");
		}
		catch(MissingResourceException mre)
		{
			throw mre;
		}
		catch(Exception e)
		{
			log.error(e.toString());
			return null;
		}
	}
	private void initMsgData()
	{
		String fileName = "messages";
		try
		{
			msgResource = ResourceBundle.getBundle(fileName);
		}
		catch(Exception e)
		{
			log.error("Fehler beim Laden der Datei "+fileName+"\n"+e.getLocalizedMessage());
			e.printStackTrace();
		}
	}
	
	
    public String getText(String key, String type)
    {
    	return getText(null, key, type);
    }

	public String getText(String ns, String key, String type)
    {
    	String result = "";
    	if(type!=null && key!=null) key=type+"-"+key;
    	try
    	{
    		try
    		{
    			if(ns==null)	result = getText("global."+key);
    			else			result = getText(ns+"."+key);
    		}
    		catch(MissingResourceException mre)
    		{
    			result = getText("global."+key);
    		}
    	}
    	catch(Exception e)
    	{
    		if(ns!=null)	log.error("Text ["+ns+"."+key+"] konnte nicht geladen werden: " +e.getLocalizedMessage());
    		else			log.error("Text [global."+key+"] konnte nicht geladen werden: " +e.getLocalizedMessage());
    	}
    	if(result==null || result.length()<1) result = "???"+ns+"."+key+"???";
    	
    	return result;//Converter.getUnicodeNotation(result);
    }
}