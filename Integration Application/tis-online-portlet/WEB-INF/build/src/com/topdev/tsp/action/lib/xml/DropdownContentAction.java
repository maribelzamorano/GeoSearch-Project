package com.topdev.tsp.action.lib.xml;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.service.client.KodierungClient;
import com.topdev.service.data.BobjKodierung;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DropdownContentAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	private String targetElement;
	private			List<DropdownElement>				elements	= new ArrayList<DropdownElement>(20);
	public static	Map<String, List<DropdownElement>>	lists		= new HashMap<String, List<DropdownElement>>(40);
	public static	Map<String, Date>					times		= new HashMap<String, Date>(40);
	private String	TBSH;
	private String	ANWF;
	private String	serviceClientClass;
	private String	value;
	private String	nullable;
	private String	compare_with_row;
	private String	p1;
	private String	p2;
	private String	noCache="false";
	
	public static DropdownElement getElementByCode(String key, String code)
	{
		if(lists.get(key)==null) return null;
		Iterator<DropdownElement> it = lists.get(key).iterator();
		while(it.hasNext())
		{
			DropdownElement e = it.next();
			if(e.getCODE()!=null && e.getCODE().equals(code))
				return e;
		}
		return null;
		
	}
	public static String getDecodeByCode(String key, String code)
	{
		DropdownElement e = getElementByCode(key, code);
		if(e!=null) return e.getDECODE();
		else return null;
	}

	@SuppressWarnings("unchecked")
	public String getParameter(String parameter)
	{
		Map<String, String> paras = ActionContext.getContext().getParameters();
		if(paras.get(parameter)!=null) return paras.get(parameter);
		return "";
	}

	public String execute() throws Exception
	{
		long	bufferTime	= 1000*60*5;	//5min
		Date	now			= new Date();
		String	key			= TBSH;
		if(ANWF!=null && ANWF.length()>0) key += "_"+ANWF;
		if(p1!=null && p1.length()>0) key += "_"+p1;
		if(p2!=null && p2.length()>0) key += "_"+p2;
		
		if(times.get(key)!=null && (now.getTime()-times.get(key).getTime() < bufferTime) && !noCache.equals("true"))
		{
			elements = lists.get(key);
			return SUCCESS;
		}

	   	String error = null;
		if(!Validator.isEmpty(serviceClientClass))
		{
		    try
			{
				Iterator<BobjKodierung> it = ((KodierungClient) Class.forName(serviceClientClass).getConstructor().newInstance()).getAllInstance(getUserName()).iterator();
				while(it.hasNext())
				{
					BobjKodierung tK = it.next();
					elements.add(new DropdownElement(tK.getCode(), tK.getDecode()) );
				}
			}
			catch(Exception ex2)
			{
				error = ex2.toString();
				log.error(error);
			}
		}
		else
		{
		   	Connection		connection	= null;
		   	SqlProcedure	p			= null;
			try
			{
				connection 	= getDataSource().getConnection();
				p			= new SqlProcedure("psp_3Dot", getSessionId());
				p.setString("@TBSH_SHORTNAME",	TBSH);
				p.setString("@ANWF_SHORTNAME",	ANWF);
				p.setInt(	"@KZ_EXISTS",		"0");
				
				if(p1!=null) p.setString("@VALUE",	p1);
				if(p2!=null) p.setString("@VALUE2",	p2);
	
				p.execute(	connection);
				ResultSet rs = p.getResultSet();
	
				if(rs!=null) while(rs.next())
					elements.add(
						new DropdownElement(
							rs.getString("CODE"),
							rs.getString("DECODE")));
				p.finalizeResults();
				error = p.getErrorString();
				p.close();
			}
			catch(Exception e)
			{
				error = "Ein Datenbankfehler ist aufgetreten:\n "+e.getLocalizedMessage();
				log.error(error);
			}
			finally
			{
				SqlProcedure.closeConnection(connection);
			}
		}
		if(error != null)
		{
			getRtErrors().add(error);
			return ERROR;
		}
		if(elements!=null)
		{
			lists.put(key, elements);
			times.put(key, now);
		}
		return SUCCESS;
	}
	
	public String getTargetElement()
	{
		return targetElement;
	}
	public void setTargetElement(String targetElement)
	{
		this.targetElement = targetElement;
	}
	public List<DropdownElement> getElements()
	{
		return elements;
	}
	public void setElements(List<DropdownElement> elements)
	{
		this.elements = elements;
	}

	public String getTBSH()
	{
		return TBSH;
	}

	public void setTBSH(String tbsh)
	{
		TBSH = tbsh;
	}

	public String getANWF()
	{
		return ANWF;
	}

	public void setANWF(String anwf)
	{
		ANWF = anwf;
	}

	public String getValue()
	{
		return value;
	}

	public void setValue(String value)
	{
		this.value = value;
	}

	public String getNullable()
	{
		return nullable;
	}

	public void setNullable(String nullable)
	{
		this.nullable = nullable;
	}

	public String getP1()
	{
		return p1;
	}

	public void setP1(String p1)
	{
		this.p1 = p1;
	}

	public String getP2()
	{
		return p2;
	}

	public void setP2(String p2)
	{
		this.p2 = p2;
	}

	public static Map<String, List<DropdownElement>> getLists()
	{
		return lists;
	}

	public static void setLists(Map<String, List<DropdownElement>> lists)
	{
		DropdownContentAction.lists = lists;
	}

	public static Map<String, Date> getTimes()
	{
		return times;
	}

	public static void setTimes(Map<String, Date> times)
	{
		DropdownContentAction.times = times;
	}
	public String getCompare_with_row()
	{
		return compare_with_row;
	}
	public void setCompare_with_row(String compare_with_row)
	{
		this.compare_with_row = compare_with_row;
	}
	public String getServiceClientClass()
	{
		return serviceClientClass;
	}
	public void setServiceClientClass(String serviceClientClass)
	{
		this.serviceClientClass = serviceClientClass;
	}
	public String getNoCache() {
		return noCache;
	}
	public void setNoCache(String noCache) {
		this.noCache = noCache;
	}


}