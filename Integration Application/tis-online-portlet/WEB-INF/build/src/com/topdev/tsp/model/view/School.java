package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class School
{
	private static final long	serialVersionUID	= 1L;
	String					sessionId;
	String					gepaId;
	String					schoolId;
	String					schoolName;

	public School(String sessionId, String schoolId) throws SQLException
	{
		this.schoolId	= schoolId;
		this.sessionId	= sessionId;
		setGepaId(getGepaBySchoolId(schoolId));
		loadData();
	}
	private String getGepaBySchoolId(String schoolId)
	{
		String	GEPA_ID = "52545";
		return GEPA_ID;
	}
	private void loadData() throws SQLException
	{
	   	Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchule_Detail", getSessionId());
			p.setInt(	"@GEPA_ID",		getSchoolId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null && rs.next())
			{
				setSchoolName(rs.getString("SCHULNAME"));
			}
			p.finalizeResults();
			p.close();
		}
		finally { SqlProcedure.closeConnection(connection); }
	}

	
	public void setSchoolId(String schoolId)
	{
		this.schoolId = schoolId;
	}
	
	public String getSchoolName()
	{
		return schoolName;
	}
	public void setSchoolName(String schoolName)
	{
		this.schoolName = schoolName;
	}
	public String getGepaId()
	{
		return gepaId;
	}
	public void setGepaId(String gepaId)
	{
		this.gepaId = gepaId;
	}
	public String getSessionId()
	{
		return sessionId;
	}
	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}
	public String getSchoolId()
	{
		return schoolId;
	}
}