package com.topdev.aa.lib;

import java.io.InputStream;
import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.logging.LogFactory;


public class SqlProcedure
{
	String 				name;
	CallableStatement	cs;
	ResultSet			rs;
	String				sessionId;
	HashMap<String, Object> parameters;
	HashMap<String, String> parameterTypes;
	HashMap<String, Integer> outParameters;
	private static final boolean debug = false; 
	private int doubleDefinition = 0;
	private static final boolean checkInjection = true;

	public SqlProcedure(String name)
	{
		this.name			= name;
		this.parameters		= new HashMap<String, Object>(40);
		this.parameterTypes	= new HashMap<String, String>(40);
		this.outParameters	= new HashMap<String, Integer>(20);
	}
	
	public SqlProcedure(String name, String sessionId) throws SQLException
	{
		this.name			= name;
		this.parameters		= new HashMap<String, Object>(40);
		this.parameterTypes	= new HashMap<String, String>(40);
		this.outParameters	= new HashMap<String, Integer>(20);
		this.sessionId		= sessionId;
		if(sessionId!=null)
		{
			setString(	"@SESSION_ID", 		sessionId);
			setOut(		"@RC",				Types.INTEGER);
			setOut(		"@SQL_ERROR",		Types.INTEGER);
			setOut(		"@RC_TEXT",			Types.VARCHAR);
		}
	}
	private static List<String> whiteProcedures = new ArrayList<String>(10); 
	static
	{
		whiteProcedures.add("psp_T_INAN_ins");
	}

	private static List<String> blackChars = new ArrayList<String>(10); 
	static
	{
		if(checkInjection)
		{
			blackChars.add("´");
			blackChars.add("`");
			blackChars.add("--");
			blackChars.add("/*");
			blackChars.add("'");
		}
	}

	public static String getUninjectedString(String sql, String fieldName, String procedureName) throws UnsupportedOperationException
	{
		if(!checkInjection) return sql;
		if(sql==null) return null;
		boolean injection = false;

		if(procedureName==null || !whiteProcedures.contains(procedureName)) if(sql.indexOf("'")	>=0)	injection = true;
		if(fieldName==null || fieldName.toUpperCase().indexOf("DATA")<0)	if(sql.indexOf(";")	>=0)	injection = true; //macht &quot; kaputt
		if(sql.indexOf("´")	>=0)	injection = true;
		if(sql.indexOf("`")	>=0)	injection = true;
		if(sql.indexOf("--")>=0)	injection = true;
		if(sql.indexOf("/*")>=0)	injection = true;

		if(injection)
		{
			System.out.println("Sicherheitshinweis: Folgende Injection wurde unterbunden: "+sql);
			throw new UnsupportedOperationException("Es wurden ungültige Zeichen in den Eingaben erkannt. Bitte korrigieren Sie diese und senden Sie die Anfrage erneut. Bei Rückfragen wenden Sie sich bitte an Ihre/n Administrator/in.");
		}
		return sql;
	}
	public String getChecksum()
	{
		try
		{
			return MD5.createMD5HashCode(parameters);
		}
		catch (Exception e)
		{
			return null;
		}
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

	public void execute(Connection connection) throws SQLException
	{
		cs = prepareCs(connection, name, parameters.size() + outParameters.size() - doubleDefinition);
		Set keys = parameters.keySet();
		Iterator it = keys.iterator();
		int i=0;
		while(it.hasNext())
		{
			String key = (String) it.next();
			if(debug)
			{
				i++;
				System.out.println("Setze Parameter #"+i+" \t:"+key+ " \tmit Wert:"+parameters.get(key));
			}
			if(parameters.get(key)==null) cs.setNull(key, Types.NULL);
			else if(parameterTypes.get(key).equals("String"))		cs.setString(		key, (String) 				parameters.get(key));
			else if(parameterTypes.get(key).equals("Null"))			cs.setNull(			key, 						Types.NULL);
			else if(parameterTypes.get(key).equals("Integer"))		cs.setInt(			key, (Integer)				parameters.get(key));
			else if(parameterTypes.get(key).equals("Boolean"))		cs.setBoolean(		key, (Boolean)				parameters.get(key));
			else if(parameterTypes.get(key).equals("Float"))		cs.setFloat(		key, (Float)				parameters.get(key));
			else if(parameterTypes.get(key).equals("Long"))			cs.setLong(			key, (Long)					parameters.get(key));
			else if(parameterTypes.get(key).equals("BigDecimal"))	cs.setBigDecimal(	key, (BigDecimal)			parameters.get(key));
			else if(parameterTypes.get(key).equals("Date"))			cs.setDate(			key, new java.sql.Date(  ((java.util.Date)parameters.get(key)).getTime()  ));
			else if(parameterTypes.get(key).equals("BinaryStream"))
			{
				InputStream in = (InputStream) parameters.get(key);
				int size = 0;
				try { size = in!=null?in.available():0; } catch (Exception e) {}
				cs.setBinaryStream(	key, in, size);
			}
		}

		keys = outParameters.keySet();
		it = keys.iterator();
		i=0;
		while(it.hasNext())
		{
			String key = (String) it.next();
			if(debug)
			{
				i++;
				System.out.println("Setze Out-Parameter #"+i+" \t:"+key+ " \tmit Wert:"+parameters.get(key));
			}
			cs.registerOutParameter(key, outParameters.get(key));
		}

		cs.execute();
	}
	public void setOut(String parameterName, int sqlType) throws SQLException
	{
		if(parameters.get(parameterName)!=null) doubleDefinition++;
		outParameters.put(parameterName, new Integer(sqlType));
	}
	
	public String getStringParameter(String parameter) throws SQLException
	{
		return cs.getString(parameter);
	}
	
	public int getIntParameter(String parameter) throws SQLException
	{
		return cs.getInt(parameter);
	}
	
	public void close() throws SQLException
	{
		if(this.cs!=null) 
			cs.close();
	}
	
	public static void closeConnection(Connection connection)
	{
		try
		{
			if(connection!=null)
				connection.close();
		}
		catch(SQLException sqlEx) {}
	}
	
	public ResultSet getResultSet() throws SQLException
	{
		this.rs = cs.getResultSet();
		return this.rs;
	}
	public String getResultString(String p) throws SQLException
	{
		String result = null;
		if(rs!=null) result = rs.getString(p);
		return result==null?"":result;
	}
	
	public static CallableStatement prepareCs(Connection connection, String name, int parameters) throws SQLException
	{
		if(name==null) return null;
		if(connection==null) return null;
		
		String call = "{call "+name+"("+(parameters>0?"?":"");
		for(int i=0;i<(parameters-1);i++) call+=",?";
		call+=")}";
		return connection.prepareCall(call);
	}
	
	public void setInt(String key, Integer value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "Integer");
		
	}
	
	public void setNull(String key) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,"");
		parameterTypes.put(key, "Null");
	}
	
	public void setBinary(String key, InputStream value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "BinaryStream");
	}
	
	public void setInt(String key, String value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		try
		{
			parameters.put(key, new Integer(Integer.parseInt(value)));
		}
		catch(Exception ex)
		{
			parameters.put(key, null);
		}
		parameterTypes.put(key, "Integer");
	}
	
	public void setFloat(String key, Float value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "Float");
	}
	
	public void setLong(String key, Long value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "Long");
	}
	
	public void setBigDecimal(String key, BigDecimal value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "BigDecimal");
	}
	
	public void setBit(String key, Boolean value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "Boolean");
	}
	
	public void setString(String key, String value) throws SQLException
	{
		value = getUninjectedString(value, key, this.name);
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "String");
	}
	

	public void setDate(String key, Date value) throws SQLException
	{
		if(outParameters.get(key)!=null) doubleDefinition++;
		parameters.put(key,value);
		parameterTypes.put(key, "Date");
	}

	public static void finalizeResults(CallableStatement cs) throws SQLException
	{
		if(cs!=null)
			while(!(!cs.getMoreResults() && (cs.getUpdateCount() == -1)));
	}

	public void finalizeResults() throws SQLException
	{
		if(cs!=null)
			while(!(!cs.getMoreResults() && (cs.getUpdateCount() == -1)));
	}

	public static String getErrorString(CallableStatement cs, int mode) throws SQLException
	{
		String error = null;
		if(mode==1)
		{
			String rc = cs.getString("@RC");
			if(rc==null || !rc.trim().equals("0"))
			{
				String errorCode=cs.getString("@SQL_ERROR");
				error="";
				if(errorCode!=null && !errorCode.trim().equals("0"))
						error+="("+errorCode+"): ";
				error += cs.getString("@RC_TEXT");
			}
		}
		if(error!=null) if(error.trim().length()<1) error = null;
		return error;
	}

	public String getErrorString() throws SQLException
	{
		return getErrorString(cs, 1);
	}
	public Long getLongFromString(String s)
	{
		Long value=null;
		try { value = Long.parseLong(s); } catch(NumberFormatException e) { }
		return value;
	}

	public static List<String> getBlackChars()
	{
		return blackChars;
	}
}