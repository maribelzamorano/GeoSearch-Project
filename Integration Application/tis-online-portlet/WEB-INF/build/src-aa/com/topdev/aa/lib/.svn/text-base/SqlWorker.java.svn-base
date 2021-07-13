package com.topdev.aa.lib;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 * @author hannesweichel
 */
public class SqlWorker
{
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setInt erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsInt(CallableStatement cs, int pos, String arg) throws SQLException
	{
		if(arg==null) cs.setString(pos,null);
		try
		{
			int i = Integer.parseInt(arg);
			cs.setInt(pos,i);
			return true;
		} catch (NumberFormatException nfe)
		{
			cs.setString(pos,null);
		}
		return false;
	}


	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setInt erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsInt(CallableStatement cs, String name, String arg) throws SQLException
	{
		if(arg==null) cs.setString(name,null);
		try
		{
			int i = Integer.parseInt(arg);
			cs.setInt(name,i);
			return true;
		} catch (NumberFormatException nfe)
		{
			cs.setString(name,null);
		}
		return false;
	}
	
	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setBoolean erfolgreich war | false wenn <code>false</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsBit(CallableStatement cs, int pos, String arg) throws SQLException
	{
		if(arg==null) 
		{
			cs.setBoolean(pos,false);
			return false;
		}

		boolean b = false;
		if(arg.trim().equals("1")) b=true;
		if(arg.trim().equals("true")) b=true;
		cs.setBoolean(pos,b);
		return true;
	}
	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setBoolean erfolgreich war | false wenn <code>false</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsBit(CallableStatement cs, String name, String arg) throws SQLException
	{
		if(arg==null) 
		{
			cs.setBoolean(name,false);
			return false;
		}

		boolean b = false;
		if(arg.trim().equals("1")) b=true;
		if(arg.trim().equals("true")) b=true;
		cs.setBoolean(name,b);
		return true;
	}
	
	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setString erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsString(CallableStatement cs, int pos, String arg) throws SQLException
	{
		arg=SqlProcedure.getUninjectedString(arg, "", null);
		if(arg==null) 
		{
			cs.setString(pos,null);
			return false;
		}

		cs.setString(pos,arg);
		return true;
	}

	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setString erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsString(CallableStatement cs, String name, String arg) throws SQLException
	{
		arg=SqlProcedure.getUninjectedString(arg, name, null);
		if(arg==null) 
		{
			cs.setString(name,null);
			return false;
		}

		cs.setString(name,arg);
		return true;
	}

	

	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setInt erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsLong(CallableStatement cs, int pos, String arg) throws SQLException
	{
		if(arg==null) cs.setString(pos,null);
		try
		{
			long l = Long.parseLong(arg);
			cs.setLong(pos,l);
			return true;
		} catch (NumberFormatException nfe)
		{
			cs.setString(pos,null);
		}
		return false;
	}
	
	/**
	 * @author hannesweichel
	 * @param cs
	 * @param arg Der an die sp zu uebergebene wert
	 * @param pos Position des Parameters im call
	 * @return true wenn setInt erfolgreich war | false wenn <code>null</code> geschrieben wurde
	 * @throws SQLException
	 */
	public static boolean setCsLong(CallableStatement cs, String name, String arg) throws SQLException
	{
		if(arg==null) cs.setString(name,null);
		try
		{
			long l = Long.parseLong(arg);
			cs.setLong(name,l);
			return true;
		} catch (NumberFormatException nfe)
		{
			cs.setString(name,null);
		}
		return false;
	}
	

	/**
	 * @param connection
	 * @param name Name der aufzurufenden stored procedure
	 * @param parameters anzahl von ein-/ausgabe parameter der procedure
	 * @return CallableStatement
	 * @throws SQLException
	 */
	public static CallableStatement prepareCs(Connection connection, String name, int parameters) throws SQLException
	{
		if(name==null) return null;
		if(connection==null) return null;
		
		String call = "{call "+name+"("+(parameters>0?"?":"");
		for(int i=0;i<(parameters-1);i++) call+=",?";
		call+=")}";
		return connection.prepareCall(call);
	}
	



	
	public static Object mergeToObject(ResultSet source, Object target) throws SQLException
	{
		Object result=target;
		ResultSetMetaData md = source.getMetaData();
		int cols = md.getColumnCount();

		String colName;
		Class c = result.getClass();
		
		for(int i=1;i<=cols;i++)
		{
			colName = md.getColumnName(i);
			try
			{
				c.getField(colName).set(result,source.getString(colName));
			} catch (IllegalArgumentException e)
			{
				return null;
			} catch (SecurityException e)
			{
				return null;
			} catch (IllegalAccessException e)
			{
				return null;
			} catch (NoSuchFieldException e)
			{
				throw new SQLException("Die Spalte \""+colName+"\" kann nicht im Object \""+c.getName()+"\" gefunden werden.");
			}
		}
		return result;
	}
	



	
	/**
	 * DB-Treiber muss getmoreresults und getupdatecount unterstuetzen. 
	 * (wie zb. der JTDS-Treiber)
	 * @param cs
	 * @throws SQLException
	 */
	public static void finalizeResults(CallableStatement cs) throws SQLException
	{
		if(cs!=null)
			while(!(!cs.getMoreResults() && (cs.getUpdateCount() == -1)));
	}
	
	
	
	
	
	/**
	 * @param cs
	 * @param mode 1=@RC,@SQL_ERROR,@RC_TEXT Behandlung
	 * @return errorString oder null
	 * @throws SQLException
	 */
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
		return error;
	}
}