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

public class SchoolLearnerStructure extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	SimpleList					learnerList;

	public SchoolLearnerStructure()
	{
		learnerList = new SimpleList();
		learnerList.getHeadingList().add(new SimpleHeading("Klassenstufe"));
		learnerList.getHeadingList().add(new SimpleHeading("Anzahl der Klassen"));
		learnerList.getHeadingList().add(new SimpleHeading("Gesamt"));
		learnerList.getHeadingList().add(new SimpleHeading("Weiblich"));
	}
	
	public void loadData()
	{
		learnerList.clearEntryList();
		clearErrors();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleKlassenstufe", getSessionId());
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
				entry.getEntries().add(new SimpleEntry("Klassenstufe","1", 	rs.getString("SKLS_KLASSENSTUFE"),"textfield"));
				entry.getEntries().add(new SimpleEntry("Anzahl", "1",		rs.getString("SKLS_ANZAHL_KLASSE"),"textfield"));				
				entry.getEntries().add(new SimpleEntry("gesamt","1",	 	rs.getString("SKLS_ANZAHL_GESAMT"),"textfield"));
				entry.getEntries().add(new SimpleEntry("weiblich","1", 		rs.getString("SKLS_ANZAHL_WEIBLICH"),"textfield"));
				learnerList.getEntryList().add(entry);

			}
			p.finalizeResults();
			setPts(p.getStringParameter("@DATENSTAND"));
			setQuelle(p.getStringParameter("@QUELLE"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
		
	}


	public SimpleList getLearnerList() {
		return learnerList;
	}

	public void setLearnerList(SimpleList learnerList) {
		this.learnerList = learnerList;
	}



}