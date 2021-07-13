package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.working_group.WorkingGroup;

public class SchoolWorkingGroup extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			workinggroupList;
	private Map<String, String>	workinggroupSortList;

	public SchoolWorkingGroup()
	{
		workinggroupList = new ComplexList();
		workinggroupList.getHeadingList().add(new ComplexHeading("Arbeitsgemeinschaften"));
	}
	public void loadData()
	{
		loadDataWorkingGroup();
	}
	void loadDataWorkingGroup()
	{
		clearErrors();
		workinggroupList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleArbeitsgemeinschaft", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			p.setOut(	"@DATENSTAND",	Types.VARCHAR);
			p.setOut(	"@QUELLE",		Types.VARCHAR);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			String filter_decode, filter_code;
			workinggroupSortList = new HashMap<String, String>(10);
	
			
			while(rs!=null && rs.next())
			{
				filter_decode	= rs.getString("SCAG_ART_DER_LEITUNG");
				filter_code		= rs.getString("SCAG_CODE");
				if(filter_code!=null && !workinggroupSortList.containsKey(filter_code)) workinggroupSortList.put(filter_code, filter_decode);
				
				map = new HashMap<String, String>();
				map.put("kategorie",				filter_decode);
				map.put("kategorie_code",			filter_code);
				map.put("inhalt",					rs.getString("SCAG_INHALT"));
				map.put("anzahl_wochenstunden",		rs.getString("SCAG_ANZ_WOCHENSTUNDEN"));
				map.put("anzahl_gruppen",			rs.getString("SCAG_ANZ_GRUPPEN"));
				map.put("anzahl_schueler",			rs.getString("SCAG_ANZ_GESAMT"));
				map.put("anzahl_weiblich",			rs.getString("SCAG_ANZ_WEIBLICH"));
				workinggroupList.getEntryList().add( new WorkingGroup(map));		
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

	public List<String> saveData() throws SQLException
	{
		return getErrors();
	}

	public ComplexList getWorkinggroupList() {
		return workinggroupList;
	}

	public void setWorkinggroupList(ComplexList workinggroupList) {
		this.workinggroupList = workinggroupList;
	}

	public Map<String, String> getWorkinggroupSortList() {
		return workinggroupSortList;
	}

	public void setWorkinggroupSortList(Map<String, String> workinggroupSortList) {
		this.workinggroupSortList = workinggroupSortList;
	}
}