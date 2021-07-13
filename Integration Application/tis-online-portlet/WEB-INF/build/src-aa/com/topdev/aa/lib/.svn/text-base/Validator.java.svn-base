package com.topdev.aa.lib;

import java.lang.reflect.Field;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/**
 * @author hannesweichel
 * Umfasst Methoden:
 * - zum prüfen auf Validität
 * - zum "valide machen"
 *
 */
public class Validator
{
	/**
	 * @param s
	 * @return Ob getrimmter übergebener String leer oder null ist 
	 */
	public static boolean empty(String s)
	{
		if(s!=null && s.trim().length()>0) return false;
		return true;
	}
	@SuppressWarnings("unchecked")
	public static boolean empty(List l)
	{
		if(l!=null && l.size()>0) return false;
		return true;
	}
	public static boolean isParameterListModified(List<HashMap<String, String>> list)
	{
		Iterator<HashMap<String, String>> it = list.iterator();
		while(it.hasNext())
		{
			HashMap<String, String> map = it.next();
			if(Validator.equals((String)map.get("modified"),"1") || Validator.equals((String)map.get("deleted"),"1"))
				return true;
		}
		return false;
	}
	
	
	/**
	 * @param s
	 * @return den orgnialen String oder einen Leerstring im falle das der org. String null ist.
	 */
	public static String unNull(String s)
	{
		if(s==null) return "";
		return s;
	}
	public static boolean isCorrectDateFormatOrEmty(String dateString)
	{
		if(dateString==null || dateString.trim().length() < 1) return true;
		try
		{
			DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
			Date date = df.parse(dateString);
			if((new SimpleDateFormat("dd.MM.yyyy")).format(date).equals(dateString)) return true;
		} catch(Exception ex) {}
		return false;
	}
	
	public static boolean isCorrectDateFormatOrEmtyYear(String dateString)
    {
        if(dateString==null || dateString.trim().length() < 1) return true;
        try
        {
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
            Date date = df.parse("01.01."+dateString);
            if((new SimpleDateFormat("dd.MM.yyyy")).format(date).equals("01.01."+dateString)) return true;
        } catch(Exception ex) {}
        return false;
    }
	
	public static boolean isCorrectTimeLine(String dateString1, String dateString2)
    {
        if(dateString1==null || dateString1.trim().length() < 1) return true;
        try
        {
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
            Date date1 = df.parse(dateString1);
            Date date2 = df.parse(dateString2);
            
            if(date2.after(date1)){return true;};
        } catch(Exception ex) {}
        return false;
    }
	
	public static boolean isCorrectTimeLineYear(String dateString1, String dateString2)
    {
        if(dateString1==null || dateString1.trim().length() < 1) return true;
        try
        {
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
            Date date1 = df.parse("01.01."+dateString1);
            Date date2 = df.parse("01.01."+dateString2);
            
            if(date2.equals(date1) || date2.after(date1)){return true;};
        } catch(Exception ex) {}
        return false;
    }
	
	public static boolean isEmpty(String s)
	{
		return empty(s);
	}
	
	/**
	 * Ist der Wert ein Leerstring, null oder 0?
	 * Bei Pruefung auf Leerstring werden fuehrende und nachstehende Whitespaces geloescht.
	 */
	public static boolean isEmpty0(String s)
	{
		if(s!=null && s.trim().length()>0 && !s.trim().equals("0") ) return false;
		return true;
	}
	
	public static boolean equals(String s1, String s2)
	{
		if(s1==null) s1="";
		if(s2==null) s2="";
		return s1.equals(s2);
	}
	
	/**
	 * Enthaelt string enthaelt content?
	 */
	public static boolean contains(String string, String content)
	{
		if(string==null)	string="";
		if(content==null)	content="";
		return string.indexOf(content)>-1;
	}
	/**
	 * Enthaelt String string entweder content1 oder content2?
	 */
	public static boolean containsOneOf(String string, String content1, String content2)
	{
		return contains(string,content1) || contains(string,content2);
	}
	
	public static boolean isMail(String s)
	{
		if(!empty(s) && s.indexOf("@") >= 0  && s.indexOf(".") >=0) return true;
		return false;
	}
	
	public static boolean isInt(String s)
	{
		if(s==null) return false;
		try { if(s.equals(String.valueOf(Integer.parseInt(s)))) return true; }
		catch(Exception e) { }
		return false;
	}

	public static boolean isSQLInjected(String s)
	{
		if(s==null) return false;
		Iterator<String> it = SqlProcedure.getBlackChars().iterator();
		while(it.hasNext()) if(s.indexOf(it.next())>=0) return true;
		return false;
	}
	
	public static void initValidation(Object o, String fieldName, String newValue) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException
	{
		try
		{
			if(fieldName==null) throw new NullPointerException("Das zu setzende Feld wurde nicht spezifiziert");
			Field field = o.getClass().getDeclaredField(fieldName);
			field.set(o, newValue);
		}
		catch (IllegalArgumentException iae)
		{
			throw new IllegalArgumentException("Bei der Validierung des Feldes ["+fieldName+"] mit dem Wert ["+newValue+"] ist ein Fehler aufgetreten:"+iae.getLocalizedMessage());
		}
	}

	public static boolean isNumeric(String value)
	{
		try
		{
			value = value.replaceAll(",","").replaceAll(".","");
			if(value.equals( String.valueOf(  Long.parseLong(value)  ))) return true;
		}
		catch(Exception e) { }
		return false;
	}

	
}