package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Element;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.Category;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeContest;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeOffer;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeProject;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeTradition;

public class SchoolSchoolLife extends BasicViewModel 
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			contestList;
	private ComplexList			offerList;
	private ComplexList			projectList;
	private ComplexList			traditionList;
	private List<Category>		contestSortList;

	public SchoolSchoolLife()
	{
		contestList		= new ComplexList();
		projectList		= new ComplexList();
		traditionList	= new ComplexList();
		offerList		= new ComplexList();
		
		contestList.getHeadingList().add(new ComplexHeading("Wettbewerbe"));
		projectList.getHeadingList().add(new ComplexHeading("Projekte"));
		traditionList.getHeadingList().add(new ComplexHeading("Schultraditionen"));
		offerList.getHeadingList().add(new ComplexHeading("Foerderangebote"));
	}

	public void loadDataSublist2(ComplexEntryList entry, String TBSH, String ID_Name) throws SQLException
	{
		Connection			connection	= null;
	   	SqlProcedure		p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_"+TBSH, getSessionId());
			p.setString(	"@"+ID_Name+"_ID",entry.getId_entity());
			p.execute(		connection );
			ResultSet rs = p.getResultSet();
			int i=0;
			while(rs!=null && rs.next())
			{
				Template1EntryList tel = new Template1EntryList();
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id",					String.valueOf(i++));
				
				map.put("kz_edit",				rs.getString("KZ_EDIT"));
				map.put("kz_delete",			rs.getString("KZ_DELETE"));
				map.put("id_entity",			rs.getString(TBSH+"_ID"));
				map.put("user",					rs.getString(TBSH+"_USER"));
				map.put("xpts",					rs.getString(TBSH+"_XPTS"));
				map.put("bezeichnung",			rs.getString(TBSH+"_BEZEICHNUNG"));
				tel.setData(map);
				entry.getSub_list2().getEntryList().add(tel);
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		
	}
	public void loadDataSublist1(ComplexEntryList entry, String TBSH, String ID_Name) throws SQLException
	{
		Connection			connection	= null;
	   	SqlProcedure		p			= null;	

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_"+TBSH, getSessionId());
			p.setString(	"@"+ID_Name+"_ID",entry.getId_entity());
			p.execute(		connection );
			ResultSet rs = p.getResultSet();
			int i=0;
			while(rs!=null && rs.next())
			{
				Template1EntryList tel = new Template1EntryList();
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("id",					String.valueOf(i++));
				
				map.put("kz_edit",				rs.getString("KZ_EDIT"));
				map.put("kz_delete",			rs.getString("KZ_DELETE"));
				map.put("id_entity",			rs.getString(TBSH+"_ID"));
				map.put("user",					rs.getString(TBSH+"_USER"));
				map.put("xpts",					rs.getString(TBSH+"_XPTS"));
				map.put("bezeichnung",			rs.getString(TBSH+"_BEZEICHNUNG"));
				tel.setData(map);
				entry.getSub_list1().getEntryList().add(tel);
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadData()
	{
		List<String> errors = new ArrayList<String>(1);
		
		if(getMode()!=1)
		{
			Connection		connection	= null;
		   	SqlProcedure	p			= null;
			try
			{
				connection 	= BasicActionSupport.getConnection();
				p			 = new SqlProcedure("psp_getSchuleSchulleben", getSessionId());
				if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
				if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
	
				p.setInt(	"@GEPA_ID", getId());
				p.execute(	connection);
				p.finalizeResults();
				if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
				if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
				if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
				p.close();
			}
			catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
			finally { SqlProcedure.closeConnection(connection); }
		}

		if(getErrors().size()<1)
		{
			loadDataOffer();
			loadDataTradition();
			loadDataProject();
			loadDataContest();
		}
	}
	void loadDataOffer()
	{
		offerList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_FOAN":"psp_getSchuleFoerderangebot", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));

				map.put("foan_bezeichnung",			rs.getString("FOAN_KURZBEZEICHNUNG"));
				map.put("foan_beschreibung",		rs.getString("FOAN_BESCHREIBUNG"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("FOAN_ID"));
					map.put("user",				rs.getString("FOAN_USER"));
					map.put("xpts",				rs.getString("FOAN_XPTS"));
					
				}		
				
				offerList.getEntryList().add(new SchoolLifeOffer(map));
			}
			p.finalizeResults();
			if(getMode()==1) offerList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	void loadDataTradition()
	{	
		traditionList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_TRAD":"psp_getSchuleTradition", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));

				map.put("trad_bezeichnung",			rs.getString("TRAD_KURZBEZEICHNUNG"));
				map.put("trad_beschreibung",		rs.getString("TRAD_BESCHREIBUNG"));
				map.put("weitere_informationen",	rs.getString("TRAD_URL"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("TRAD_ID"));
					map.put("user",				rs.getString("TRAD_USER"));
					map.put("xpts",				rs.getString("TRAD_XPTS"));
		
				}

				traditionList.getEntryList().add(new SchoolLifeTradition(map));
			}
			p.finalizeResults();
			if(getMode()==1) traditionList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	void loadDataProject()
	{
		projectList.clearEntryList();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	HashMap<String, String> map;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_EIPR":"psp_getSchuleEigeneProjekte", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			int i=0;
			while(rs!=null && rs.next())
			{			
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));
				map.put("eipr_bezeichnung",			rs.getString("EIPR_KURZBEZEICHNUNG"));
				map.put("eipr_beschreibung",		rs.getString("EIPR_BESCHREIBUNG"));
				map.put("weitere_informationen",	rs.getString("EIPR_URL"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("EIPR_ID"));
					map.put("user",				rs.getString("EIPR_USER"));
					map.put("xpts",				rs.getString("EIPR_XPTS"));
				}
				projectList.getEntryList().add(new SchoolLifeProject(map));
			}
			p.finalizeResults();
			if(getMode()==1) projectList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	void loadDataContest()
	{
		contestList.clearEntryList();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	HashMap<String, String> map;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_WETE":"psp_getSchuleWettbewerbteiln", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			String filter_decode, filter_code;
			contestSortList = new ArrayList<Category>(10);
			
			int i=0;
			while(rs!=null && rs.next())
			{
				filter_decode	= rs.getString("WEKA_DECODE");
				filter_code		= rs.getString("WEKA_CODE");
				Category category	= new Category(filter_code, filter_decode);
				if(!contestSortList.contains(category)) contestSortList.add(category);

				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));
				map.put("wett_bezeichnung",				rs.getString("WETT_BEZEICHNUNG"));
				map.put("kategorie",				filter_decode);
				map.put("kategorie_code",			filter_code);
				
				if(getMode()==1)
				{
					map.put("kz_edit",					rs.getString("KZ_EDIT"));
					map.put("kz_delete",				rs.getString("KZ_DELETE"));
					map.put("id_entity",				rs.getString("WETE_ID"));
					map.put("wett_bezeichnung_code",	rs.getString("WETT_ID"));
					map.put("user",						rs.getString("WETE_USER"));
					map.put("xpts",						rs.getString("WETE_XPTS"));
				}
				contestList.getEntryList().add(new SchoolLifeContest(map));
			}
			p.finalizeResults();
			if(getMode()==1) contestList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public List<String> saveDataTradition(ComplexEntryList cel) throws SQLException
	{
		clearErrors();
		SchoolLifeTradition	entry		= (SchoolLifeTradition)cel;
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_Fach 

		xml = new XML();

		list = (List<ComplexEntryList>) entry.getSub_list1().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
	
			Template1EntryList entry_t = (Template1EntryList) it.next();
	
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("FJTR_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("FJTR_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("FJTR_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("FJTR_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
		}
		String xml_FACH = xml.getEncodedString("unicode");

//		____________________________________________________________________________________________________
//		xml_Klass

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getSub_list2().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Template1EntryList entry_t = (Template1EntryList) it.next();
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("KJTR_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("KJTR_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("KJTR_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("KJTR_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
		}
		String xml_KLST = xml.getEncodedString("unicode");
		
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_TRAD_IUD", getSessionId());
			p.setString("@TRAD_ID",					entry.getId_entity());		
			p.setString("@TRAD_USER",				entry.getUser());
			p.setString("@TRAD_XPTS",				entry.getXpts());
			
			p.setString("@KZ_IS_MODIFIED",			entry.getModified());
			p.setString("@KZ_IS_DELETED",			entry.getDeleted());
			p.setInt(	"@GEPA_ID",					getId());
			p.setString("@TRAD_KURZBEZEICHNUNG",	entry.getTrad_bezeichnung());
			p.setString("@TRAD_BESCHREIBUNG",		entry.getTrad_beschreibung());
			p.setString("@TRAD_URL",				entry.getWeitere_informationen());
	
			p.setString("@DATA_FACH",				xml_FACH);
			p.setString("@DATA_KLST",				xml_KLST);

			p.execute(	connection);
			HashMap<String, String> map; 
			ResultSet rs = p.getResultSet();
			
//			____________________________________________________________________________________________________
//			Neue Liste kommt
			traditionList.getEntryList().clear();
			int i=0;
	
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));

				map.put("trad_bezeichnung",				rs.getString("TRAD_KURZBEZEICHNUNG"));
				map.put("trad_beschreibung",				rs.getString("TRAD_BESCHREIBUNG"));
				map.put("weitere_informationen",	rs.getString("TRAD_URL"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("TRAD_ID"));
				map.put("user",						rs.getString("TRAD_USER"));
				map.put("xpts",						rs.getString("TRAD_XPTS"));

				traditionList.getEntryList().add(new SchoolLifeTradition(map));
			}
						
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return getErrors();
	}
	public List<String> saveDataProject(ComplexEntryList cel) throws SQLException
	{
		clearErrors();
		SchoolLifeProject	entry		= (SchoolLifeProject)cel;
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_Fach 

		xml = new XML();

		list = (List<ComplexEntryList>) entry.getSub_list1().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
	
			Template1EntryList entry_t = (Template1EntryList) it.next();
	
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("FJEI_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("FJEI_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("FJEI_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("FJEI_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
		}
		String xml_FACH = xml.getEncodedString("unicode");

//		____________________________________________________________________________________________________
//		xml_Klass

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getSub_list2().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Template1EntryList entry_t = (Template1EntryList) it.next();
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("KJEI_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("KJEI_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("KJEI_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("KJEI_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
		}
		String xml_KLST = xml.getEncodedString("unicode");
		
		
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_EIPR_IUD", getSessionId());
			p.setString("@EIPR_ID",					entry.getId_entity());		
			p.setString("@EIPR_USER",				entry.getUser());
			p.setString("@EIPR_XPTS",				entry.getXpts());
			
			p.setString("@KZ_IS_MODIFIED",			entry.getModified());
			p.setString("@KZ_IS_DELETED",			entry.getDeleted());
			p.setInt(	"@GEPA_ID",					getId());
			p.setString("@EIPR_KURZBEZEICHNUNG",	entry.getEipr_bezeichnung());
			p.setString("@EIPR_BESCHREIBUNG",		entry.getEipr_beschreibung());
			p.setString("@EIPR_URL",				entry.getWeitere_informationen());
	
			p.setString("@DATA_FACH",				xml_FACH);
			p.setString("@DATA_KLST",				xml_KLST);

			p.execute(	connection);
			
			HashMap<String, String> map; 
			ResultSet rs = p.getResultSet();
			
//			____________________________________________________________________________________________________
//			Neue Liste kommt
			projectList.getEntryList().clear();
			int i=0;
	
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));

				map.put("eipr_bezeichnung",				rs.getString("EIPR_KURZBEZEICHNUNG"));
				map.put("eipr_beschreibung",				rs.getString("EIPR_BESCHREIBUNG"));
				map.put("weitere_informationen",	rs.getString("EIPR_URL"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("EIPR_ID"));
				map.put("user",						rs.getString("EIPR_USER"));
				map.put("xpts",						rs.getString("EIPR_XPTS"));

				projectList.getEntryList().add(new SchoolLifeProject(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return getErrors();
	}
	public List<String> saveDataOffer(ComplexEntryList cel) throws SQLException
	{
		clearErrors();
		SchoolLifeOffer	entry		= (SchoolLifeOffer)cel;
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_Fach 

		xml = new XML();

		list = (List<ComplexEntryList>) entry.getSub_list1().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Template1EntryList entry_t = (Template1EntryList) it.next();
	
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("FJFO_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("FJFO_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("FJFO_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("FJFO_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
			
		}
		String xml_FACH = xml.getEncodedString("unicode");

//		____________________________________________________________________________________________________
//		xml_Klass

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getSub_list2().getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Template1EntryList entry_t = (Template1EntryList) it.next();
			if(entry_t.isDeleted() || entry_t.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry_t.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry_t.getDeleted()));
				e.appendChild(xml.createE("KJFO_ID",				entry_t.getId_entity()));
				e.appendChild(xml.createE("KJFO_USER",				entry_t.getUser()));
				e.appendChild(xml.createE("KJFO_XPTS",				entry_t.getXpts()));
				e.appendChild(xml.createE("KJFO_BEZEICHNUNG",		entry_t.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
			if (entry_t.isModified()) entry.setModified("1");
		}
		String xml_KLST = xml.getEncodedString("unicode");
		
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_FOAN_IUD", getSessionId());
			p.setString("@FOAN_ID",					entry.getId_entity());		
			p.setString("@FOAN_USER",				entry.getUser());
			p.setString("@FOAN_XPTS",				entry.getXpts());
			
			p.setString("@KZ_IS_MODIFIED",			entry.getModified());
			p.setString("@KZ_IS_DELETED",			entry.getDeleted());
			p.setInt(	"@GEPA_ID",					getId());
			p.setString("@FOAN_KURZBEZEICHNUNG",	entry.getFoan_bezeichnung());
			p.setString("@FOAN_BESCHREIBUNG",		entry.getFoan_beschreibung());
	
			p.setString("@DATA_FACH",				xml_FACH);
			p.setString("@DATA_KLST",				xml_KLST);

			p.execute(	connection);
			HashMap<String, String> map; 
			ResultSet rs = p.getResultSet();
//			____________________________________________________________________________________________________
//			Neue Liste kommt
			offerList.getEntryList().clear();
			int i=0;
	
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));

				map.put("foan_bezeichnung",				rs.getString("FOAN_KURZBEZEICHNUNG"));
				map.put("foan_beschreibung",				rs.getString("FOAN_BESCHREIBUNG"));
				map.put("faecher",					rs.getString("FACH_XBEZEICHNUNG"));
				map.put("klassenstufen",			rs.getString("KLST_XBEZEICHNUNG"));
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("FOAN_ID"));
				map.put("user",						rs.getString("FOAN_USER"));
				map.put("xpts",						rs.getString("FOAN_XPTS"));

				offerList.getEntryList().add(new SchoolLifeOffer(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return getErrors();
	}
	
	public List<String> saveDataContest(ComplexEntryList cel) throws SQLException
	{
		clearErrors();
		SchoolLifeContest	entry		= (SchoolLifeContest)cel;
		Connection			connection	= null;
	   	SqlProcedure		p			= null;
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_WETE_IUD", getSessionId());
			p.setString("@WETE_ID",					entry.getId_entity());		
			p.setString("@WETE_USER",				entry.getUser());
			p.setString("@WETE_XPTS",				entry.getXpts());
			
			p.setString("@KZ_IS_MODIFIED",			entry.getModified());
			p.setString("@KZ_IS_DELETED",			entry.getDeleted());
			p.setInt(	"@GEPA_ID",					getId());
			p.setString("@WETT_ID",					entry.getWett_bezeichnung_code());
			p.execute(	connection);
			HashMap<String, String> map; 
			ResultSet rs = p.getResultSet();
			
//			____________________________________________________________________________________________________
//			Neue Liste kommt
			contestList.getEntryList().clear();
			int i=0;
	
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(++i));

				map.put("wett_bezeichnung",				rs.getString("WETT_BEZEICHNUNG"));
				map.put("wett_bezeichnung_code",			rs.getString("WETT_ID"));
				
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("WETE_ID"));
				map.put("user",						rs.getString("WETE_USER"));
				map.put("xpts",						rs.getString("WETE_XPTS"));

				contestList.getEntryList().add(new SchoolLifeContest(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return getErrors();
	}

	public ComplexList getProjectList()
	{
		return projectList;
	}

	public void setProjectList(ComplexList projectList)
	{
		this.projectList = projectList;
	}

	public ComplexList getTraditionList()
	{
		return traditionList;
	}

	public void setTraditionList(ComplexList traditionList)
	{
		this.traditionList = traditionList;
	}

	public ComplexList getOfferList()
	{
		return offerList;
	}

	public void setOfferList(ComplexList offerList)
	{
		this.offerList = offerList;
	}

	public ComplexList getContestList() {
		return contestList;
	}

	public void setContestList(ComplexList contestList) {
		this.contestList = contestList;
	}

	public List<Category> getContestSortList()
	{
		return contestSortList;
	}

	public void setContestSortList(List<Category> contestSortList)
	{
		this.contestSortList = contestSortList;
	}

	
}