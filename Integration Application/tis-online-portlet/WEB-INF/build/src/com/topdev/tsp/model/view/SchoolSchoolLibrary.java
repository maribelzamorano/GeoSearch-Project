package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_library.SchoolLibrary;


public class SchoolSchoolLibrary extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList	libraryList_manage;
	private ComplexList	libraryList_equipe;

	public SchoolSchoolLibrary()
	{
		libraryList_manage = new ComplexList();
		libraryList_manage.getHeadingList().add(new ComplexHeading("Verwaltung"));

		libraryList_equipe = new ComplexList();
		libraryList_equipe.getHeadingList().add(new ComplexHeading("Ausstattung"));
	}

	@Override
	public void loadData()
	{
		clearErrors();
		loadData_manage();
		loadData_equipe();
	}
	
	void loadData_manage()
	{
		libraryList_manage.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleBibliothek", getSessionId());
			p.setInt(	"@GEPA_ID",			getId());
			p.setString("@KZ_ART_MERKMAL",	"0");
			p.setOut(	"@DATENSTAND",	Types.VARCHAR);
			p.setOut(	"@QUELLE",		Types.VARCHAR);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("merkmal",			rs.getString("BIBO_MERKMAL"));
				map.put("angabe",			rs.getString("BIBO_ANGABE"));
				libraryList_manage.getEntryList().add(new SchoolLibrary(map));
			}
			p.finalizeResults();
			setPts(p.getStringParameter("@DATENSTAND"));
			setQuelle(p.getStringParameter("@QUELLE"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	void loadData_equipe()
	{
		libraryList_equipe.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleBibliothek", getSessionId());
			p.setInt(	"@GEPA_ID",			getId());
			p.setString("@KZ_ART_MERKMAL",	"1");
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("merkmal",			rs.getString("BIBO_MERKMAL"));
				map.put("angabe",			rs.getString("BIBO_ANGABE"));
				libraryList_equipe.getEntryList().add(new SchoolLibrary(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}

	public ComplexList getLibraryList_equipe() {
		return libraryList_equipe;
	}

	public void setLibraryList_equipe(ComplexList libraryList_equipe) {
		this.libraryList_equipe = libraryList_equipe;
	}

	public ComplexList getLibraryList_manage() {
		return libraryList_manage;
	}

	public void setLibraryList_manage(ComplexList libraryList_manage) {
		this.libraryList_manage = libraryList_manage;
	}




}