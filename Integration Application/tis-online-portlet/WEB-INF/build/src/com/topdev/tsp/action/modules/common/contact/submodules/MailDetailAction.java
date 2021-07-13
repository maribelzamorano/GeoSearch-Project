package com.topdev.tsp.action.modules.common.contact.submodules;

import java.util.ArrayList;
import java.util.Date;

import com.topdev.tsp.action.modules.common.contact.DetailAction;
import com.topdev.tsp.model.list.modules.common.contact.Mail;

public class MailDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	Mail	entry;
	String	betreff;
	String	msg;
	String	absender_name;
	String	absender_mail;
	String	themenbereich_code;
	Boolean reinit;

	public void init(String aktion) throws Exception
	{
		if(aktion==null) aktion = "";
		setRtErrors(new ArrayList<String>(1));
		setAktion(aktion);
		if(aktion.indexOf("view")==-1) setMode(1);
		else setMode(2);
		initData();

		if(reinit==null || !reinit)
		{
			getMainObject().setMail(new Mail());
			getMainObject().clearErrors();
			setRtErrors(new ArrayList<String>(1));
		}
		entry = getMainObject().getMail();
		if(entry==null) entry = new Mail();
	}
	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}

		
	public String edit() throws Exception
    {
		init("edit");
		return SUCCESS;
    }
	

	public String save() throws Exception
	{
		init("save");
		entry = new Mail();
		entry.setAbsender_mail(absender_mail);
		entry.setAbsender_name(absender_name);
		entry.setBetreff(betreff);
		entry.setMsg(msg);
		entry.setThemenbereich(themenbereich_code);
		getMainObject().setMail(entry);
		
		if( absender_mail==null || absender_mail.indexOf("@")==-1 || +absender_mail.indexOf(".")==-1 )
		{
			getRtErrors().add("Bitte geben Sie eine gültige E-Mail Adresse ein.");
			return "error";
		}
		getMainObject().sendMail(entry, getPrincipal());
		setRtErrors(getMainObject().getErrors());
		if(getRtErrors().size()>0) return "error";
		return "sended";
	}
	
	public Mail getEntry()
	{
		return entry;
	}
	public void setEntry(Mail entry)
	{
		this.entry = entry;
	}
	public String getAbsender_mail()
	{
		return absender_mail;
	}
	public void setAbsender_mail(String absender_mail)
	{
		this.absender_mail = absender_mail;
	}
	public String getAbsender_name()
	{
		return absender_name;
	}
	public void setAbsender_name(String absender_name)
	{
		this.absender_name = absender_name;
	}
	public String getBetreff()
	{
		return betreff;
	}
	public void setBetreff(String betreff)
	{
		this.betreff = betreff;
	}
	public String getMsg()
	{
		return msg;
	}
	public void setMsg(String msg)
	{
		this.msg = msg;
	}
	public String getThemenbereich_code() {
		return themenbereich_code;
	}
	public void setThemenbereich_code(String themenbereich_code) {
		this.themenbereich_code = themenbereich_code;
	}


}