package com.topdev.aa.lib;

import java.io.File;
import java.lang.reflect.Method;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.topdev.aa.data.XMLDataObject;
import com.topdev.aa.data.XMLElementDataObject;

public class Converter
{
	/**
	 * @author hannesweichel
	 * @param request
	 * @param node - wie der dem Wurzeltag direkt untergeordnete tag heissen soll in dem die Liste in Form von Attributen gespeichert wird
	 * @return Kompletter XML-Code bestehend aus den root-Element und den in node spezifizierten Unterelementen (XMLDataObject fuer Ausgabe verwendet)
	 */
	public static String getXMLListRequest(HttpServletRequest request, String node)
	{
		XMLDataObject xdo = getXMLListRequestObject(request,node);
		return xdo.getXML();
	}

	@SuppressWarnings("unchecked")
	public static Object castWidthDeficit(Object o, Class c)
	{
		Object to = null;
		try 
		{
			to = c.newInstance();
			for(Method m : o.getClass().getMethods())
			{
				if(m.getName().startsWith("get") && m.getReturnType().getName().equals("java.lang.String"))
				{
					try
					{
						//Class[] c = [String.class];
						Method tm = (c.getMethod(m.getName().replaceFirst("get", "set"), new Class[]{String.class}));
						tm.invoke(to, m.invoke(o, new Class[]{}));
					}
					catch(Exception ex)
					{
					}
				}
			}
		}
		catch(Exception ex)
		{
			System.out.println(c+" is not instanciated. "+ex);
		}
		return to;
	}
	
	/**
	 * @author hannesweichel
	 * @param request
	 * @param node - wie der dem Wurzeltag direkt untergeordnete tag heissen soll in dem die Liste in Form von Attributen gespeichert wird
	 * @return Object mit den geparsten Objekten
	 */
	public static XMLDataObject getXMLListRequestObject(HttpServletRequest request, String node)
	{
		int i,n;
		int size = Integer.parseInt(request.getParameter("list_size"));
		List<XMLElementDataObject> list = new ArrayList<XMLElementDataObject>(size);
		for(i=0;i<size;i++) list.add(new XMLElementDataObject(node));
	
		Enumeration en = request.getParameterNames();
		while(en.hasMoreElements())
		{
			String s = String.valueOf(en.nextElement());
			String attributeName=s;

			if(s.indexOf("list_field")!=-1 && s.substring(9,s.length()).indexOf("_")!=-1)
			{
				s=s.replaceFirst("list_field","");
				n=Integer.parseInt(s.substring(0,s.indexOf("_")))-1;
				XMLElementDataObject e = list.get(n);
				e.getElement().setAttribute(s.substring(s.indexOf("_")+1,s.length()),request.getParameter(attributeName));
			}
		}
		Iterator<XMLElementDataObject> it = list.iterator();
		while(it.hasNext())
			if(it.next().getElement().getAttributes().size()<1)
				it.remove();
		
		XMLDataObject xdo = new XMLDataObject();
		xdo.setElements(list);
		return xdo;
	}
	
	/**
	 * @author hannesweichel
	 * @param pfad
	 * @return
	 */
	public static String getFileSize(String pfad)
	{
		double result=0;
		String postfix;

		long size = (new File(pfad)).length();
		if(size>(1024*1024)) 	{result =(double)size/(1024*1024);	postfix=" MB";	}
		else if(size>(1024)) 	{result =(double)size/1024; 		postfix=" KB";	}
		else 					{result =(double)size;				postfix=" Byte";}

		NumberFormat nf = NumberFormat.getInstance();
		nf.setMaximumFractionDigits(2);

		return nf.format(result)+postfix;
	}

	/**
	 * @author hannesweichel
	 * @param s
	 * @return
	 */
	public static String toMoney(String s)
	{
		if(s==null) return null;
		NumberFormat nf = NumberFormat.getNumberInstance();
		nf.setMinimumFractionDigits(2);
		nf.setMaximumFractionDigits(2);
		return nf.format( Double.valueOf(s.trim()) );
	}
	

	/**
	 * @author hannesweichel
	 * @param s
	 * @return
	 */
	public static String toXslString(String s)
	{
		String out = "";
		if(s==null) return out;

//		try
//		{
//			s = new String(s.getBytes(),"ISO-8859-15");
//		}
//		catch (UnsupportedEncodingException e) { e.printStackTrace(); }

		char[] ca = s.toCharArray();
		for(int i =0; i<ca.length;i++)
		{
			if(ca[i]>0)
			{
				if((ca[i]>=65 && ca[i]<=90) || (ca[i]>=97 && ca[i]<=122) || ca[i]<=13) out+=String.valueOf(ca[i]);
				else
				{
					switch(ca[i])
					{
						case 128:	ca[i]=8364;	break;
						case 130:	ca[i]=8218;	break;
						case 131:	ca[i]=402;	break;
						case 132:	ca[i]=8222;	break;
						case 133:	ca[i]=8230;	break;
						case 134:	ca[i]=8224;	break;
						case 135:	ca[i]=8225;	break;
						case 136:	ca[i]=710;	break;
						case 137:	ca[i]=8240;	break;
						case 138:	ca[i]=352;	break;
						case 139:	ca[i]=8249;	break;
						case 140:	ca[i]=338;	break;
						case 142:	ca[i]=381;	break;
						case 145:	ca[i]=8216;	break;
						case 146:	ca[i]=8217;	break;
						case 147:	ca[i]=8220;	break;
						case 148:	ca[i]=8221;	break;
						case 149:	ca[i]=8226;	break;
						case 150:	ca[i]=8211;	break;
						case 151:	ca[i]=8212;	break;
						case 152:	ca[i]=732;	break;
						case 153:	ca[i]=8482;	break;
						case 154:	ca[i]=353;	break;
						case 155:	ca[i]=8250;	break;
						case 156:	ca[i]=339;	break;
						case 158:	ca[i]=382;	break;
						case 159:	ca[i]=376;	break;
					}
					out+="&#"+(int)ca[i]+";";
				}
			}
		}
		return out;
	}
	

	public static String toJsString(String s)
	{
		if(s!=null)
		{
			s=s.replaceAll("\"","\\\\\"");
			s=s.replaceAll("\n","\\\\"+"\\n");
			s=s.replaceAll("\r","\\\\"+"\\r");
		} else s="";
		return s;
	}
	
	public static String unicodeQuotes(String s)
	{
		if(s!=null) return s.replaceAll("\"","&quot;").replaceAll("'","&#39;");
		else		return "";
	}
}