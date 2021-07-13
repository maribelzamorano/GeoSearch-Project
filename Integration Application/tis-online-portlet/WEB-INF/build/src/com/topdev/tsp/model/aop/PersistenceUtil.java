package com.topdev.tsp.model.aop;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.aa.lib.SqlProcedure;

public class PersistenceUtil
{
	public static List<Object> getResultList(String dataObject, Map<String, Object> parameters, Object resultType) throws SQLException
	{
		Log log = LogFactory.getLog("getResultList");
		List<Object> resultList = new ArrayList<Object>(20);
	   	Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= getConnection();
			p			 = new SqlProcedure(dataObject, "@"+parameters.get("SESSION_ID"));
			Iterator it = parameters.entrySet().iterator();
			while(it.hasNext())
			{
				Entry e = (Entry) it.next();
				p.setString("@"+e.getKey(), (String)e.getValue());
			}
			p.execute(	connection);
			ResultSet			rs		= p.getResultSet();
			ResultSetMetaData	meta	= rs.getMetaData();
			
			Map<String, Method> methodMap = new HashMap<String, Method>(30);
			for(int i=0; i<meta.getColumnCount(); i++)
			{
				String fieldName = meta.getCatalogName(i).toUpperCase();
				try
				{
					Method m = resultType.getClass().getMethod("set"+(fieldName), new Class[0]);
					methodMap.put(fieldName, m);
				}
				catch(Exception ex2)
				{
					log.warn("Das Feld "+fieldName+" konnte nicht in die Anwendungsobjekte uebernommen werden");
				}
			}
			
			if(methodMap!=null && methodMap.size()>0 && rs!=null) while(rs.next())
			{
				Object o = new Object(); 
				o = resultType.getClass().cast(o);
				Iterator<Entry<String, Method>> it2 = methodMap.entrySet().iterator();
				while(it2.hasNext())
				{
					Entry<String, Method> e = it2.next();
					String[] s = new String[1];
					s[0] = rs.getString(e.getKey());
					try
					{
						e.getValue().invoke(o, (Object[])s);
					}
					catch(Exception ex2)
					{
						log.warn("Die setter-Methode fuer "+e.getKey()+" konnte nicht ausgefurhrt werden");
					}
				}
				resultList.add(o);
			}
			p.finalizeResults();
			p.close();
		}
		finally { SqlProcedure.closeConnection(connection); }
	
		return resultList;
	}

	public static String getGepaBySchoolId(String schoolId)
	{
		String	GEPA_ID = "52545";
		return GEPA_ID;
	}

	public static DataSource getDataSource()
	{
		DataSource ds = null;
		try
		{
			Context initCtx	= new InitialContext();
			Context envCtx	= (Context)		initCtx.lookup("java:comp/env");
			ds 				= (DataSource)	envCtx.lookup("jdbc/TDS");
			if(ds==null) throw new NullPointerException("Resourcenanfrage [jdbc/TDS] ergab [null].");
		} catch (Exception ex)
		{ LogFactory.getLog("getDataSource()").error("Fehler bei Anfrage einer Datenbankverbindung.\n"+ex.toString()); }
		return ds;
	}
	
	public static Connection getConnection() throws SQLException
	{
		return getDataSource().getConnection();
	}

}