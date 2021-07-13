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
import com.topdev.tsp.model.list.modules.media.MediaComputer;
import com.topdev.tsp.model.list.modules.media.MediaITRoom;
import com.topdev.tsp.model.list.modules.media.MediaInternet;
import com.topdev.tsp.model.list.simple.SimpleList;

public class SchoolMedia extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList		ITroomList;
	private ComplexList		internetList;
	private ComplexList		computerList;
	SimpleList				mediaList;	

	
	public SchoolMedia()
	{
		ITroomList				= new ComplexList();
		internetList			= new ComplexList();
		computerList			= new ComplexList();
		ITroomList.getHeadingList().add(		new ComplexHeading("EDV-Raum"));
		internetList.getHeadingList().add(		new ComplexHeading("Internetanschluss"));
		computerList.getHeadingList().add(		new ComplexHeading("Rechner"));
	}
	
	public void loadData()
	{
		clearErrors();
		loadDataEdvRaum();	
		loadDataRechner();
		loadDataInternet();
	}
	void loadDataEdvRaum()
	{
		ITroomList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleEDVRaum", getSessionId());
			p.setInt(	"@GEPA_ID",			getId());
			p.setOut(	"@DATENSTAND",	Types.VARCHAR);
			p.setOut(	"@QUELLE",		Types.VARCHAR);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("raumart",			rs.getString("EDVR_RAUMART"));
				map.put("anzahl",			rs.getString("EDVR_ANZ_RAEUME"));
				ITroomList.getEntryList().add(new MediaITRoom(map));
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
	void loadDataInternet()
	{
		internetList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleInternetanschluss", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("anschlussart",			rs.getString("INET_ANSCHLUSSART"));
				map.put("anzahl",				rs.getString("INET_ANZ_RECHNER"));
				internetList.getEntryList().add(new MediaInternet(map));
			}
			p.finalizeResults();
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}
	void loadDataRechner()
	{
		computerList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;	   	
		
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleRechner", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("rechnerart",			rs.getString("RECH_RECHNERART"));
				map.put("anzahl",				rs.getString("RECH_ANZ_GESAMT"));
				computerList.getEntryList().add(new MediaComputer(map));
			}
			p.finalizeResults();
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}

	public SimpleList getMediaList() {
		return mediaList;
	}

	public void setMediaList(SimpleList mediaList) {
		this.mediaList = mediaList;
	}

	public ComplexList getComputerList() {
		return computerList;
	}

	public void setComputerList(ComplexList computerList) {
		this.computerList = computerList;
	}

	public ComplexList getInternetList() {
		return internetList;
	}

	public void setInternetList(ComplexList internetList) {
		this.internetList = internetList;
	}

	public ComplexList getITroomList() {
		return ITroomList;
	}

	public void setITroomList(ComplexList troomList) {
		ITroomList = troomList;
	}






}