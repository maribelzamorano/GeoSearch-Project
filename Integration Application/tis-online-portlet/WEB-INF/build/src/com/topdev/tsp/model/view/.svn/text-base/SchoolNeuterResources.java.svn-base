package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Element;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesCabinet;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesHandicap;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesSport;


public class SchoolNeuterResources extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	
	private ComplexList		sportList;
	private ComplexList		handicapList;
	private ComplexList		cabinetList;
	private String			beschreibung_gebaeude;
	private String			xpts_gebaeude;
	private String			id_gebaeude;
	private String			beschreibung_weitere_gebaeude;
	private String			xpts_weitere_gebaeude;
	private String			id_weitere_gebaeude;
	private String			besonderheiten_beau;
	private String			xpts_beau;
	private String			id_beau;

	public SchoolNeuterResources()
	{
		sportList		= new ComplexList();
		handicapList	= new ComplexList();
		cabinetList		= new ComplexList();
		sportList.getHeadingList().add(		new ComplexHeading("sportstaette"));
		handicapList.getHeadingList().add(	new ComplexHeading("Behindertengerecht"));
		cabinetList.getHeadingList().add(	new ComplexHeading("Nutzungsprofil"));
	}
	

	public void loadData()
	{
		clearErrors();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_SARE":"psp_getSchuleSaechlicheRessourcen", getSessionId());

			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);

			p.setInt(	"@GEPA_ID",	getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null && rs.next())
			{
				setBeschreibung_gebaeude(			rs.getString("SARE_BESCHREIBUNG_GEBAEUDE"));
				setBeschreibung_weitere_gebaeude(	rs.getString("SARE_BESCHREIBUNG_WEITERE_GEBAEUDE"));
				setBesonderheiten_beau(				rs.getString("SARE_BESONDERHEITEN_BEAU"));

				if(getMode()==1)
				{
					setXpts_gebaeude(					rs.getString("SARE_XPTS_GEBAEUDE"));
					setId_gebaeude(						rs.getString("SARE_ID_GEBAEUDE"));
					setXpts_weitere_gebaeude(			rs.getString("SARE_XPTS_WEITERE_GEBAEUDE"));
					setId_weitere_gebaeude(				rs.getString("SARE_ID_WEITERE_GEBAEUDE"));
					setXpts_beau(						rs.getString("SARE_XPTS_BEAU"));
					setId_beau(							rs.getString("SARE_ID_BEAU"));
					setUser(							rs.getString("SARE_USER"));
					setXpts(							rs.getString("SARE_XPTS"));
				}
			}
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));

			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	

		loadDataSport();
		loadDataHandicap();
		loadDataCabinet();
	}
	
	void loadDataSport()
	{
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_SPST":"psp_getSchuleSportstaette", getSessionId());
								p.setInt(	"@GEPA_ID",		getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			int i = 0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				if(getMode()==1)
				{
					map.put("kz_edit",				rs.getString("KZ_EDIT"));
					map.put("kz_delete",			rs.getString("KZ_DELETE"));
					map.put("id_entity",			rs.getString("SPST_ID"));
					map.put("user",					rs.getString("SPST_USER"));
					map.put("xpts",					rs.getString("SPST_XPTS"));
				}
				map.put("beschreibung",			rs.getString("SPST_BESCHREIBUNG"));	
				map.put("entfernung",			rs.getString("SPST_ENTFERNUNG_SCHULE"));	
				map.put("ausstattung",			rs.getString("SPST_AUSSTATTUNG"));	
				map.put("groesse",				rs.getString("SPST_GROESSE"));	
				map.put("sportstaettenart",		rs.getString("SPAR_DECODE"));	
				map.put("sportstaettenart_code",rs.getString("SPAR_CODE"));
				map.put("erreichbarkeit",		rs.getString("SPST_ERREICHBARKEIT"));
									
				sportList.getEntryList().add(new NeuterResourcesSport(map));		
			}
			p.finalizeResults();
			if(getMode()==1)	sportList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}
	
	void loadDataHandicap()
	{
		HashMap<String, String> map;
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_BEAU":"psp_getSchuleBehindgerAusfuehr", getSessionId());
								p.setInt(	"@GEPA_ID",		getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			int i = 0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(++i));
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("BEAU_ID"));
					map.put("user",				rs.getString("BEAU_USER"));
					map.put("xpts",				rs.getString("BEAU_XPTS"));
				}			
				map.put("auar_code",		rs.getString("AUAR_CODE"));
				map.put("auar_decode",		rs.getString("AUAR_DECODE"));
				handicapList.getEntryList().add(new NeuterResourcesHandicap(map));
			}
			p.finalizeResults();
			if(getMode()==1)	handicapList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}

	void loadDataCabinet()
	{
		HashMap<String, String> map;
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_RAFA":"psp_getSchuleRaeume", getSessionId());
								p.setInt(	"@GEPA_ID",		getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			int i = 0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				if(getMode()==1)
				{
					map.put("kz_edit",				rs.getString("KZ_EDIT"));
					map.put("kz_delete",			rs.getString("KZ_DELETE"));
					map.put("id_entity",			rs.getString("RAFA_ID"));
					map.put("user",					rs.getString("RAFA_USER"));
					map.put("xpts",					rs.getString("RAFA_XPTS"));
				}
				
				map.put("nutzungsprofil",		rs.getString("RAFA_BEZEICHNUNG"));				
				map.put("anzahl",				rs.getString("RAFA_ANZAHL"));
				cabinetList.getEntryList().add(new NeuterResourcesCabinet(map));
			}
			p.finalizeResults();
			if(getMode()==1)	cabinetList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}



	public List<String> saveData() throws SQLException
	{
		clearErrors();
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
	
//		____________________________________________________________________________________________________
//		xml_SPST 

		xml = new XML();
		list = (List<ComplexEntryList>) sportList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			NeuterResourcesSport entry = (NeuterResourcesSport) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry.getDeleted()));
				e.appendChild(xml.createE("SPST_ID",				entry.getId_entity()));
				e.appendChild(xml.createE("SPST_BESCHREIBUNG",		entry.getBeschreibung()));
				e.appendChild(xml.createE("SPST_AUSSTATTUNG",		entry.getAusstattung()));
				e.appendChild(xml.createE("SPST_ENTFERNUNG_SCHULE",	entry.getEntfernung()));
				e.appendChild(xml.createE("SPST_GROESSE",			entry.getGroesse()));
				e.appendChild(xml.createE("SPAR_CODE",				entry.getSportstaettenart_code()));
				e.appendChild(xml.createE("SPST_ERREICHBARKEIT",	entry.getErreichbarkeit()));
				e.appendChild(xml.createE("SPST_USER",				entry.getUser()));
				e.appendChild(xml.createE("SPST_XPTS",				entry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_SPST = xml.getEncodedString("unicode");
		
//		____________________________________________________________________________________________________
// 		xml_RAFA 
		
		xml = new XML();
		list = (List<ComplexEntryList>) cabinetList.getEntryList();
		it = list.iterator();
		if(it!=null) while(it.hasNext())
		{
			NeuterResourcesCabinet entry = (NeuterResourcesCabinet) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		entry.getDeleted()));
				e.appendChild(xml.createE("RAFA_ID",			entry.getId_entity()));
				e.appendChild(xml.createE("RAFA_USER",			entry.getUser()));
				e.appendChild(xml.createE("RAFA_XPTS",			entry.getXpts()));
				
				e.appendChild(xml.createE("RAFA_BEZEICHNUNG",	entry.getNutzungsprofil()));
				e.appendChild(xml.createE("RAFA_ANZAHL",		entry.getAnzahl()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_RAFA = xml.getEncodedString("unicode");
//		____________________________________________________________________________________________________
//		xml_BEAU
		
		xml = new XML();
		list = (List<ComplexEntryList>) handicapList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			NeuterResourcesHandicap entry = (NeuterResourcesHandicap) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		entry.getDeleted()));
				e.appendChild(xml.createE("BEAU_ID",			entry.getId_entity()));
				e.appendChild(xml.createE("BEAU_USER",			entry.getUser()));
				e.appendChild(xml.createE("BEAU_XPTS",			entry.getXpts()));
				
				e.appendChild(xml.createE("AUAR_CODE",			entry.getAuar_code()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_BEAU = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_SARE_IUD", getSessionId());
			p.setString("@SARE_ID",								getId());
			p.setString("@SARE_USER",							getUser());
			p.setString("@SARE_XPTS",							getXpts());
			p.setString("@KZ_MODIFIED",							"1");
			p.setString("@KZ_DELETED",							"0");
			p.setInt(	"@GEPA_ID",								getId());
			p.setString("@SARE_BESCHREIBUNG_GEBAEUDE",			getBeschreibung_gebaeude());
			p.setString("@SARE_XPTS_GEBAEUDE",					getXpts_gebaeude());
			p.setString("@SARE_ID_GEBAEUDE",					getId_gebaeude());
			p.setString("@SARE_BESCHREIBUNG_WEITERE_GEBAEUDE",	getBeschreibung_weitere_gebaeude());
			p.setString("@SARE_XPTS_WEITERE_GEBAEUDE",			getXpts_weitere_gebaeude());
			p.setString("@SARE_ID_WEITERE_GEBAEUDE",			getId_weitere_gebaeude());
			p.setString("@SARE_BESONDERHEITEN_BEAU",			getBesonderheiten_beau());
			p.setString("@SARE_XPTS_BEAU",						getXpts_beau());
			p.setString("@SARE_ID_BEAU",						getId_beau());
			p.setString("@BEAU_DATA",							xml_BEAU);
			p.setString("@SPST_DATA",							xml_SPST);
			p.setString("@RAFA_DATA",							xml_RAFA);
			p.execute(	connection);

			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
		return getErrors();
	}

	public String getBeschreibung_gebaeude() {
		return beschreibung_gebaeude;
	}
	public void setBeschreibung_gebaeude(String beschreibung_gebaeude) {
		this.beschreibung_gebaeude = beschreibung_gebaeude;
	}
	public String getBesonderheiten_beau() {
		return besonderheiten_beau;
	}
	public void setBesonderheiten_beau(String besonderheiten_beau) {
		this.besonderheiten_beau = besonderheiten_beau;
	}
	public ComplexList getSportList()
	{
		return sportList;
	}
	public void setSportList(ComplexList sportList)
	{
		this.sportList = sportList;
	}

	public ComplexList getCabinetList() {
		return cabinetList;
	}
	public void setCabinetList(ComplexList cabinetList) {
		this.cabinetList = cabinetList;
	}
	public ComplexList getHandicapList()
	{
		return handicapList;
	}
	public void setHandicapList(ComplexList handicapList)
	{
		this.handicapList = handicapList;
	}

	public String getBeschreibung_weitere_gebaeude()
	{
		return beschreibung_weitere_gebaeude;
	}

	public void setBeschreibung_weitere_gebaeude(
			String beschreibung_weitere_gebaeude)
	{
		this.beschreibung_weitere_gebaeude = beschreibung_weitere_gebaeude;
	}

	public String getId_beau()
	{
		return id_beau;
	}

	public void setId_beau(String id_beau)
	{
		this.id_beau = id_beau;
	}

	public String getId_gebaeude()
	{
		return id_gebaeude;
	}

	public void setId_gebaeude(String id_gebaeude)
	{
		this.id_gebaeude = id_gebaeude;
	}

	public String getId_weitere_gebaeude()
	{
		return id_weitere_gebaeude;
	}

	public void setId_weitere_gebaeude(String id_weitere_gebaeude)
	{
		this.id_weitere_gebaeude = id_weitere_gebaeude;
	}

	public String getXpts_beau()
	{
		return xpts_beau;
	}

	public void setXpts_beau(String xpts_beau)
	{
		this.xpts_beau = xpts_beau;
	}

	public String getXpts_gebaeude()
	{
		return xpts_gebaeude;
	}

	public void setXpts_gebaeude(String xpts_gebaeude)
	{
		this.xpts_gebaeude = xpts_gebaeude;
	}

	public String getXpts_weitere_gebaeude()
	{
		return xpts_weitere_gebaeude;
	}

	public void setXpts_weitere_gebaeude(String xpts_weitere_gebaeude)
	{
		this.xpts_weitere_gebaeude = xpts_weitere_gebaeude;
	}
}