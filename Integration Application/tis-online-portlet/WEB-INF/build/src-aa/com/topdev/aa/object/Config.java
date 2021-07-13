package com.topdev.aa.object;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class Config extends ValidatorForm
{
private static final long	serialVersionUID	= 1L;

	//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public boolean getBoolean(String s)
	{
		if(s==null) return false;
		if(s.equals("on") || s.equals("true") || s.equals("1")) return true;
		return false;
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public String checker(String s)
	{
		if(s==null) return "none";
		if(s.equals("on") || s.equals("true") || s.equals("1")) return "underline";
		return "none";
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public String decodeWest(String s)
	{
		int i=0;
		try { i=Integer.parseInt(s); } catch (NumberFormatException nfe) {}
		
		switch(i)
		{
			case 0:return "Standard";		
			case 1:return "Kursiv";
			case 2:return "Fett";
			case 3:return "Fett kursiv";
		}
		return null;
	}
	public String getFontStyle(String s)
	{
		if(s!=null)
		{
			if(s.equals("0"))
				return "none";
			else if(s.equals("1"))
				return "italic";
			else if(s.equals("2"))
				return "none";
			else if(s.equals("3"))
				return "italic";
		}
		return "none";
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public String getFontWeight(String s)
	{
		if(s!=null)
		{
			if(s.equals("0"))
				return "normal";
			else if(s.equals("1"))
				return "normal";
			else if(s.equals("2"))
				return "bolder";
			else if(s.equals("3"))
				return "bolder";
		}
		return "normal";
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public List<String> getNames()
	{
		List<String> l = new ArrayList<String>();
		l.add("defaultfontsize");
		l.add("defaultfontwest");
		l.add("defaultfontstyle");
		l.add("defaultfontfamily");
		l.add("defaultfontweight");
		l.add("defaultfontdecoration");
		l.add("listfontsize");
		l.add("listfontwest");
		l.add("listfontstyle");
		l.add("listfontfamily");
		l.add("listfontweight");
		l.add("listfontdecoration");
		l.add("listlettersmin");
		l.add("listlettersmax");
		l.add("listheadfontsize");
		l.add("listheadfontwest");
		l.add("listheadfontstyle");
		l.add("listheadfontfamily");
		l.add("listheadfontweight");
		l.add("listheadfontdecoration");
		l.add("listtablegrid");
		l.add("listresultsmax");
		return l;
	}

	public void set(String was, String wert)
	{
		if(was!=null)
		{
			if(was.equals("defaultfontsize"))		this.setdefaultfontsize(wert);
			if(was.equals("defaultfontwest"))		this.setdefaultfontwest(wert);
			if(was.equals("defaultfontstyle"))		this.setdefaultfontstyle(wert);
			if(was.equals("defaultfontfamily"))		this.setdefaultfontfamily(wert);
			if(was.equals("defaultfontweight"))		this.setdefaultfontweight(wert);
			if(was.equals("defaultfontdecoration")) this.setdefaultfontdecoration(wert);
			if(was.equals("listfontsize"))			this.setlistfontsize(wert);
			if(was.equals("listfontwest"))			this.setlistfontwest(wert);
			if(was.equals("listfontstyle"))			this.setlistfontstyle(wert);
			if(was.equals("listfontfamily"))		this.setlistfontfamily(wert);
			if(was.equals("listfontweight"))		this.setlistfontweight(wert);
			if(was.equals("listfontdecoration"))	this.setlistfontdecoration(wert);
			if(was.equals("listlettersmin"))		this.setlistlettersmin(wert);
			if(was.equals("listlettersmax"))		this.setlistlettersmax(wert);
			if(was.equals("listheadfontsize"))		this.setlistheadfontsize(wert);
			if(was.equals("listheadfontwest"))		this.setlistheadfontwest(wert);
			if(was.equals("listheadfontstyle"))		this.setlistheadfontstyle(wert);
			if(was.equals("listheadfontfamily"))	this.setlistheadfontfamily(wert);
			if(was.equals("listheadfontweight"))	this.setlistheadfontweight(wert);
			if(was.equals("listheadfontdecoration"))this.setlistheadfontdecoration(wert);
			if(was.equals("listtablegrid"))			this.setlisttablegrid(wert);
			if(was.equals("listresultsmax"))		this.setlistresultsmax(wert);
		}
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public String get(String was)
	{
		if(was!=null)
		{
			if(was.equals("defaultfontsize"))		return String.valueOf(this.getdefaultfontsize());
			if(was.equals("defaultfontwest"))		return String.valueOf(this.getdefaultfontwest());
			if(was.equals("defaultfontstyle"))		return String.valueOf(this.getdefaultfontstyle());
			if(was.equals("defaultfontfamily"))		return String.valueOf(this.getdefaultfontfamily());
			if(was.equals("defaultfontweight"))		return String.valueOf(this.getdefaultfontweight());
			if(was.equals("defaultfontdecoration")) return String.valueOf(this.getdefaultfontdecoration());
			if(was.equals("listfontsize"))			return String.valueOf(this.getlistfontsize());
			if(was.equals("listfontwest"))			return String.valueOf(this.getlistfontwest());
			if(was.equals("listfontstyle"))			return String.valueOf(this.getlistfontstyle());
			if(was.equals("listfontfamily"))		return String.valueOf(this.getlistfontfamily());
			if(was.equals("listfontweight"))		return String.valueOf(this.getlistfontweight());
			if(was.equals("listfontdecoration"))	return String.valueOf(this.getlistfontdecoration());
			if(was.equals("listlettersmin"))		return String.valueOf(this.getlistlettersmin());
			if(was.equals("listlettersmax"))		return String.valueOf(this.getlistlettersmax());
			if(was.equals("listheadfontsize"))		return String.valueOf(this.getlistheadfontsize());
			if(was.equals("listheadfontwest"))		return String.valueOf(this.getlistheadfontwest());
			if(was.equals("listheadfontstyle"))		return String.valueOf(this.getlistheadfontstyle());
			if(was.equals("listheadfontfamily"))	return String.valueOf(this.getlistheadfontfamily());
			if(was.equals("listheadfontweight"))	return String.valueOf(this.getlistheadfontweight());
			if(was.equals("listheadfontdecoration"))return String.valueOf(this.getlistheadfontdecoration());
			if(was.equals("listtablegrid"))			return String.valueOf(this.getlisttablegrid());
			if(was.equals("listresultsmax"))		return String.valueOf(this.getlistresultsmax());
		}
		return null;
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	private String defaultfontsize			= "12";
	private String defaultfontwest			= "0";			//Hilfsfeld : Setzt fontStyle und fontWeight
    private String defaultfontstyle			= "none";
    private String defaultfontfamily		= "helvetica";
	private String defaultfontweight		= "normal";
	private String defaultfontdecoration	= "none";		//unterstrichen?

	private String listfontsize				= "12";
    private String listfontwest				= "0";			//Hilfsfeld : Setzt fontStyle und fontWeight
    private String listfontstyle			= "none";
    private String listfontfamily			= "helvetica";
	private String listfontweight			= "normal";
    private String listfontdecoration		= "none";		//unterstrichen?

	private String listlettersmin			= "20";
    private String listlettersmax			= "50";
	private String listheadfontsize			= "12";

	private String listheadfontwest			= "2";			//Hilfsfeld : Setzt fontStyle und fontWeight
	private String listheadfontstyle		= "none";
	private String listheadfontfamily		= "helvetica";
	private String listheadfontweight		= "bolder";
	private String listheadfontdecoration	= "on";			//unterstrichen?
	private String listtablegrid			= "on";
	private String listresultsmax			= "20";
	
	public ConfigForm configForm 			= new ConfigForm();
	public ConfigList configList 			= new ConfigList();
	public ConfigText configText 			= new ConfigText();
	
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	void	setdefaultfontwest(String s)
	{
		this.defaultfontstyle	=getFontStyle(s);
		this.defaultfontweight	=getFontWeight(s);
		this.defaultfontwest	=s;
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	void	setlistfontwest(String s)
	{
		this.listfontstyle	=getFontStyle(s);
		this.listfontweight	=getFontWeight(s);
		this.listfontwest	=s;
	}
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	void	setlistheadfontwest(String s)
	{
		this.listheadfontstyle	=getFontStyle(s);
		this.listheadfontweight	=getFontWeight(s);
		this.listheadfontwest	=s;
	}

    public String getdefaultfontwestdecode()	{ return decodeWest(getdefaultfontwest()); }
    public String getlistfontwestdecode()		{ return decodeWest(getlistfontwest()); }
    public String getlistheadfontwestdecode()	{ return decodeWest(getlistheadfontwest()); }
    
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontwest() {	return this.configText.getFontwest(); }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontwest() {		return this.configList.getBodyfontwest(); }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontwest() { return this.configList.getHeadfontwest(); }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistresultsmax()										{ return (this.configList.getResultsmax()); }
    public	void	setlistresultsmax(String listresultsmax)				{ this.listresultsmax = listresultsmax; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlisttablegrid()										{ return (this.listtablegrid); }
    public	void	setlisttablegrid(String listtablegrid)					{ this.listtablegrid = listtablegrid; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontweight()									{ return (this.configText.getFontweight()); }
    public	void	setdefaultfontweight(String defaultfontweight)			{ this.defaultfontweight = defaultfontweight; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontdecoration()								{ return (this.configText.getFontdecoration()); }
    public	void	setdefaultfontdecoration(String p)						{ this.defaultfontdecoration=p; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontweight()										{ return (this.configList.getBodyfontweight()); }
    public	void	setlistfontweight(String listfontweight)				{ this.listfontweight = listfontweight; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontdecoration()									{ return (this.configList.getBodyfontdecoration()); }
    public	void	setlistfontdecoration(String p)							{ this.listfontdecoration=p; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontsize()									{ return (this.configList.getHeadfontsize()); }
    public	void	setlistheadfontsize(String listheadfontsize)			{ this.listheadfontsize = listheadfontsize; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontstyle()									{ return (this.configList.getHeadfontstyle()); }
    public	void	setlistheadfontstyle(String listheadfontstyle)			{ this.listheadfontstyle = listheadfontstyle; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontfamily()									{ return (this.configList.getHeadfontfamily()); }
    public	void	setlistheadfontfamily(String listheadfontfamily)		{ this.listheadfontfamily = listheadfontfamily; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontweight()									{ return (this.configList.getHeadfontweight()); }
    public	void	setlistheadfontweight(String listheadfontweight)		{ this.listheadfontweight = listheadfontweight; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistheadfontdecoration()								{ return (this.configList.getHeadfontdecoration()); }
    public	void	setlistheadfontdecoration(String p)						{ this.listheadfontdecoration=p; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontsize()									{ return (this.configText.getFontsize()); }
    public	void	setdefaultfontsize(String defaultfontsize)				{ this.defaultfontsize = defaultfontsize; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontstyle()									{ return (this.configText.getFontstyle()); }
    public	void	setdefaultfontstyle(String defaultfontstyle)			{ this.defaultfontstyle = defaultfontstyle; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getdefaultfontfamily()									{ return (this.configText.getFontfamily()); }
    public	void	setdefaultfontfamily(String defaultfontfamily)			{ this.defaultfontfamily = defaultfontfamily; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontsize()										{ return (this.configList.getBodyfontsize()); }
    public	void	setlistfontsize(String listfontsize)					{ this.listfontsize = listfontsize; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontstyle()										{ return (this.configList.getBodyfontstyle()); }
    public	void	setlistfontstyle(String listfontstyle)					{ this.listfontstyle = listfontstyle; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistfontfamily()										{ return (this.configList.getBodyfontfamily()); }
    public	void	setlistfontfamily(String listfontfamily)				{ this.listfontfamily = listfontfamily; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistlettersmin()										{ return (this.listlettersmin); }
    public	void	setlistlettersmin(String listlettersmin)				{ this.listlettersmin = listlettersmin; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public	String	getlistlettersmax()										{ return (this.configList.getLettersmax()); }
    public	void	setlistlettersmax(String listlettersmax)				{ this.listlettersmax = listlettersmax; }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    public void reset(ActionMapping mapping, HttpServletRequest request) 
	{
		this.listresultsmax			= null;
		this.listtablegrid			= null;
		this.defaultfontsize		= null;
		this.defaultfontstyle		= null;
		this.defaultfontfamily		= null;
		this.defaultfontweight		= null;
		this.defaultfontdecoration	= null;
		this.listfontsize			= null;
		this.listfontstyle			= null;
		this.listfontfamily			= null;
		this.listfontweight			= null;
		this.listfontdecoration		= null;
		this.listlettersmin			= null;
		this.listlettersmax			= null;
		this.listheadfontsize		= null;
		this.listheadfontstyle		= null;
		this.listheadfontfamily		= null;
		this.listheadfontweight		= null;
		this.listheadfontdecoration	= null;
    }
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
	public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) 
	{
		ActionErrors errors = super.validate(mapping, request);

//        if (!doza_id.equals("0")) 
//            errors.add("doza_id", new ActionError("error.password.match"));
		return errors;
	}
}