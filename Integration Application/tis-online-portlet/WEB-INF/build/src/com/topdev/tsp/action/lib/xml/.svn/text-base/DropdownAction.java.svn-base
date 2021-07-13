package com.topdev.tsp.action.lib.xml;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class DropdownAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	private String targetElement;
	private List<DropdownElement> elements = new ArrayList<DropdownElement>(20);

	public String getParameter(String parameter)
	{
		Map<String, String[]> paras = ActionContext.getContext().getParameters();
		if(paras.get(parameter)!=null) return paras.get(parameter)[0];
		return "";
	}
	public String execute() throws Exception
	{
		targetElement = getParameter("targetElement");
		
	   	Connection		connection	= null;
	   	SqlProcedure	p			= null; 
		try
		{
			connection 	= getDataSource().getConnection();
			p			= new SqlProcedure("psp_3Dot", getSessionId());
			p.setString("@TBSH_SHORTNAME",	getParameter("TBSH"));
			p.setString("@ANWF_SHORTNAME",	getParameter("ANWF"));
			p.setInt(	"@KZ_EXISTS",		"0");
			
			if(getParameter("p1")!=null) p.setString("@VALUE",	getParameter("p1"));
			if(getParameter("p2")!=null) p.setString("@VALUE2",	getParameter("p2"));

			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null) while(rs.next()) elements.add(new DropdownElement(rs.getString("CODE"), rs.getString("DECODE")));
			p.finalizeResults();
			p.close();
		}
		finally
		{
			SqlProcedure.closeConnection(connection);
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
}