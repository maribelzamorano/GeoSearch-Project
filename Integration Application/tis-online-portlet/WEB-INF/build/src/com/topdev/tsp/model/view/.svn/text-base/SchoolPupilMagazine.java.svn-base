package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.simple.SimpleEntry;
import com.topdev.tsp.model.list.simple.SimpleEntryList;
import com.topdev.tsp.model.list.simple.SimpleHeading;
import com.topdev.tsp.model.list.simple.SimpleList;

public class SchoolPupilMagazine extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	SimpleList	pupilmagazineList;	

	public SchoolPupilMagazine()
	{
		pupilmagazineList = new SimpleList();
		pupilmagazineList.getHeadingList().add(new SimpleHeading("Ausgabezyklus"));
		pupilmagazineList.getHeadingList().add(new SimpleHeading("Auflagenhöhe"));
	}

	public void loadData()
	{
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleZeitung", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			p.setOut(	"@DATENSTAND",	Types.VARCHAR);
			p.setOut(	"@QUELLE",		Types.VARCHAR);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			while(rs!=null && rs.next())
			{
				SimpleEntryList entry = new SimpleEntryList();
				entry.setKz_edit("1");
				entry.setKz_delete("1");
				entry.getEntries().add(new SimpleEntry("auflagezyklus","1", 	rs.getString("ZEIT_AUFLAGEZYKLUS"),"textfield"));
				entry.getEntries().add(new SimpleEntry("auflagehoehe","1",	 	rs.getString("ZEIT_AUFLAGENHOEHE"),"textfield"));
				pupilmagazineList.getEntryList().add(entry);
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

	public SimpleList getPupilmagazineList() {
		return pupilmagazineList;
	}

	public void setPupilmagazineList(SimpleList pupilmagazineList) {
		this.pupilmagazineList = pupilmagazineList;
	}
}