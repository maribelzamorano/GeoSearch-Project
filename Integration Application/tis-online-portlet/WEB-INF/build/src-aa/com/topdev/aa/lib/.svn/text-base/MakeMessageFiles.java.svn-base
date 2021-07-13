package com.topdev.aa.lib;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

public class MakeMessageFiles
{
	public static void main(String[] args) throws Exception
	{
		String filename		= "../classes/messages";
		String SPRA_CODE	= "D";
		String encoding		= "UTF-8";
		String DBuser		= "internal";
		String DBpass		= "internal";
		String DBdriver		= "net.sourceforge.jtds.jdbc.Driver";
		String PROJ_CODE	= "TIS-O";
		PrintWriter out		= null;
		File f1 			= new File(filename+".properties");
		String DBurl 		= "jdbc:jtds:sqlserver://192.168.102.62:1433/msg01";

		if(args.length>0) filename	= args[0];
		if(args.length>1) SPRA_CODE	= args[1];
		if(args.length>2) PROJ_CODE	= args[2];
		if(args.length>3) DBurl		= args[3];
		if(args.length>4) DBuser	= args[4];
		if(args.length>5) DBpass	= args[5];
		if(args.length>6) DBdriver	= args[6];
		if(args.length>7) encoding	= args[7];

		Class.forName(DBdriver);
		Connection connection= DriverManager.getConnection(DBurl,DBuser,DBpass);
		if(f1.exists()) f1.delete();
		f1.createNewFile();
		try { out = new PrintWriter(new OutputStreamWriter( new FileOutputStream(f1), "UTF-8")); }
		catch (IOException ioe)  { System.out.println("Fehler beim Speichern folgender Dateien:"+f1.getAbsolutePath()+"\n"+ioe.getLocalizedMessage()); }

		try
		{
			String call;
			CallableStatement cs;
			ResultSet rs;
			String line;
			String _t;

//			___________________________________________________________________________________________
			call = "{call msgadm.psp_GetTexte (?,?)}";
			cs = connection.prepareCall(call);
			cs.setString("@SPRA_CODE", SPRA_CODE);
			cs.setString("@PROJ_BEZEICHNUNG", PROJ_CODE);
			cs.execute();
			
			rs = cs.getResultSet(); 
			while(rs.next())
			{
				line = rs.getString("text_objekt")+"="+rs.getString("tete_text");
				if(line==null) line="";
				if(rs.getString("spra_code").equals("D"))
					out.println( line.replaceAll(
							"ä", "&auml;").replaceAll(
							"ö", "&ouml;").replaceAll(
							"ü", "&uuml;").replaceAll(
							"Ä", "&Auml;").replaceAll(
							"Ö", "&Ouml;").replaceAll(
							"Ü", "&Uuml;").replaceAll(
							"ß", "&szlig;")
					);
			}
			rs.close();
			cs.close();
//			___________________________________________________________________________________________			
		}
		finally
		{
			connection.close();
			out.close();
		}
		System.out.println("SPRA_CODE: "+SPRA_CODE);
		System.out.println("PROJ_CODE: "+PROJ_CODE);
		if(f1.exists()) System.out.println("Erstellen der Datei "+f1.getAbsolutePath()+" war erfolgreich");
	}
}