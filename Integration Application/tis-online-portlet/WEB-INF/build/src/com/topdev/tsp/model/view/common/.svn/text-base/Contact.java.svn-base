package com.topdev.tsp.model.view.common;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.object.TopdevPrincipal;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.modules.common.contact.Mail;

public class Contact extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private Mail				mail;
	private List<String>		errors = new ArrayList<String>(1);
	public Contact(String sessionId)
	{
		setSessionId(sessionId);
	}
	
	public void loadData()
	{
		clearErrors();
		if(errors.size()>0) log.error("Fehler beim Laden: "+errors);
	}
	

	public void sendMail(Mail entry, TopdevPrincipal principal)
	{
		errors						= new ArrayList<String>(1);
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("psp_SendMail", getSessionId());
			
			p.setString("@TBSH_SHORTNAME",		entry.getThemenbereich());
			p.setString("@MAIL_BETREFF",		entry.getBetreff());
			p.setString("@MAIL_TEXT",			entry.getMsg());
			p.setString("@MAIL_ABSENDER_NAME",	entry.getAbsender_name());
			p.setString("@MAIL_ABSENDER_EMAIL",	entry.getAbsender_mail());
			
			if(principal!=null && principal.getId()!=null)
				p.setString("@GEPA_ID",			principal.getId());
			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) errors.add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { errors.add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) errors.add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		if(errors.size()>0) log.error("Fehler beim senden: "+errors);
	}

	public List<String> saveData() throws SQLException
	{
		return errors;
	}

	public List<String> getErrors()
	{
		return errors;
	}

	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}

	public Mail getMail()
	{
		return mail;
	}

	public void setMail(Mail mail)
	{
		this.mail = mail;
	}


}