package com.topdev.tsp.model.aop;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.LogFactory;

public class DataSourceBean
{
	private DataSource dataSource = null;
	public DataSourceBean()
	{
		System.out.println("initializing DataSourceBean");
		try
		{
			Context initCtx	= new InitialContext();
			Context envCtx	= (Context)		initCtx.lookup("java:comp/env");
			dataSource		= (DataSource)	envCtx.lookup("jdbc/TDS");
			if(dataSource==null)
				throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		}
		catch (Exception ex)
		{
			LogFactory.getLog("getDataSource()").error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); 
		}
	}

	public DataSource getDataSource()
	{
		return dataSource;
	}
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}
}