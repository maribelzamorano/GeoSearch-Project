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

public class SchoolPersonalStatistic extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	SimpleList	personalList;	

	public SchoolPersonalStatistic()
	{
		personalList = new SimpleList();
		personalList.getHeadingList().add(new SimpleHeading("Gruppe (m/w)"));
//		personalList.getHeadingList().add(new SimpleHeading("Teilzeit"));
//		personalList.getHeadingList().add(new SimpleHeading("Vollzeit"));
		personalList.getHeadingList().add(new SimpleHeading("Anzahl"));
	}

	public void loadData()
	{
		clearErrors();
		personalList.clearEntryList();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchulePersonalgruppe", getSessionId());
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
				entry.getEntries().add(new SimpleEntry("gruppe","1", 		rs.getString("PEGR_GRUPPE")+" ("+ rs.getString("PEGR_GESCHLECHT")+")","textfield"));
				//entry.getEntries().add(new SimpleEntry("teilzeit","1", 		rs.getString("PEGR_TEILZEIT"),"textfield"));
				//entry.getEntries().add(new SimpleEntry("vollzeit","1",	 	rs.getString("PEGR_VOLLZEIT"),"textfield"));
				entry.getEntries().add(new SimpleEntry("gesamt","1",	 	rs.getString("PEGR_GESAMT"),"textfield"));
				personalList.getEntryList().add(entry);
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

	public SimpleList getPersonalList() {
		return personalList;
	}

	public void setPersonalList(SimpleList personalList) {
		this.personalList = personalList;
	}



}