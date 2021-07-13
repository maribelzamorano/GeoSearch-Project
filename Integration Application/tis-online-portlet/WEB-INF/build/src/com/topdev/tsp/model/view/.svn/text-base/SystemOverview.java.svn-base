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
import com.topdev.tsp.model.form.modules.system.PtsSearchForm;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.complex.SearchList;
import com.topdev.tsp.model.list.modules.system.Contest;
import com.topdev.tsp.model.list.modules.system.Instrument;
import com.topdev.tsp.model.list.modules.system.Project;
import com.topdev.tsp.model.list.modules.system.Pts;

public class SystemOverview extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			instrumentList;
	private ComplexList			contestList;
	private ComplexList			projectList;
	private SearchList			ptsList			= new SearchList();
	private SearchList			ptsDetailList	= new SearchList();;
	private PtsSearchForm		ptsSearchForm	= new PtsSearchForm();

	public SystemOverview()
	{
		contestList = new ComplexList();
		contestList.addHeading("Sortierung");
		contestList.addHeading("Bezeichnung");
		contestList.addHeading("Kategorie");
		contestList.addHeading("Veraltet");
		
		instrumentList = new ComplexList();
		instrumentList.addHeading("Sortierung");
		instrumentList.addHeading("lfd.Nr.");
		instrumentList.addHeading("Kurzbezeichnung");
		instrumentList.addHeading("Langbezeichnung");
		instrumentList.addHeading("Veraltet");
		
		projectList = new ComplexList();
		projectList.addHeading("Sortierung");
		projectList.addHeading("lfd.Nr.");
		projectList.addHeading("Art");
		projectList.addHeading("Bezeichnung");
		projectList.addHeading("Veraltet");
	}
	

	public void loadDataContest()
	{
		clearErrors();
		contestList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_WETT", getSessionId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(contestList.getEntryList().size())+1);
				map.put("kz_edit",			rs.getString("KZ_EDIT"));
				map.put("kz_delete",		rs.getString("KZ_DELETE"));
				map.put("id_entity",		rs.getString("WETT_ID"));
				map.put("kategorie_code",	rs.getString("WEKA_CODE"));
				map.put("kategorie",		rs.getString("WEKA_DECODE"));
				map.put("bezeichnung",		rs.getString("WETT_BEZEICHNUNG"));
				map.put("kz_veraltet",		rs.getString("WETT_KZ_VERALTET"));
				map.put("sort",				rs.getString("WETT_SORT"));
				map.put("user",				rs.getString("WETT_USER"));
				map.put("xpts",				rs.getString("WETT_XPTS"));
				contestList.getEntryList().add(new Contest(map));
			}
			p.finalizeResults();
			contestList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataPts(String GEPA_ID)
	{
		clearErrors();
		SearchList t_ptsList = new SearchList();
		t_ptsList.setPage(ptsSearchForm.getPage());
		if(GEPA_ID!=null)
		{
			t_ptsList.addHeading("Ort");
			t_ptsList.addHeading("Datum");
		}
		else
		{
			t_ptsList.addHeading("Schulnummer");
			t_ptsList.addHeading("Schulname");
			t_ptsList.addHeading("Ort");
			t_ptsList.addHeading("Datum");
		}

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_SPTS", getSessionId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.setInt(	"@ROWS",		t_ptsList.getMaxResults());
			p.setInt(	"@MAX_CHAR",	t_ptsList.getMaxTokens());
			p.setInt(	"@PAGE",		t_ptsList.getPage());
			p.setInt(	"@GEPA_ID",		GEPA_ID);
			if(GEPA_ID==null)
			{
				p.setString("@PTS_VON",		ptsSearchForm.getVon());
				p.setString("@PTS_BIS",		ptsSearchForm.getBis());
			}
			p.setOut(	"@ROWCOUNTER",	Types.INTEGER);

			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(t_ptsList.getEntryList().size()+1));
				map.put("id_entity",		rs.getString("GEPA_ID"));
				map.put("kz_edit",			rs.getString("KZ_EDIT"));
				map.put("kz_delete",		rs.getString("KZ_DELETE"));
				map.put("objekt",			rs.getString("CC_ANWENDUNGSFALL"));
				map.put("schulnummer",		rs.getString("SCHULNUMMER"));
				map.put("schulbezeichnung",	rs.getString("GEPA_XNAME_12"));
				map.put("letzte_aenderung",	rs.getString("CC_LETZTE_AENDERUNG"));
				map.put("gepa_id",			GEPA_ID);
				t_ptsList.getEntryList().add(new Pts(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			t_ptsList.setRowCounter(	p.getStringParameter("@ROWCOUNTER"));
			t_ptsList.setKz_insert(	p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		
		if(GEPA_ID!=null)	ptsDetailList = t_ptsList;
		else				ptsList =  t_ptsList;
	}
	public void loadDataInstrument()
	{
		clearErrors();
		instrumentList.clearEntryList();
		instrumentList.setKz_insert("1");
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_SEIA", getSessionId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(instrumentList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("SEIA_ID"));
				map.put("user",						rs.getString("SEIA_USER"));
				map.put("xpts",						rs.getString("SEIA_XPTS"));
				map.put("bezeichnung",				rs.getString("SEIA_KURZBEZEICHNUNG"));
				map.put("beschreibung",				rs.getString("SEIA_LANGBEZEICHNUNG"));
				map.put("url",						rs.getString("SEIA_URL"));
				map.put("sort",						rs.getString("SEIA_SORT"));
				map.put("kz_veraltet",				rs.getString("SEIA_KZ_VERALTET"));

				instrumentList.getEntryList().add(new Instrument(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			instrumentList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	public void loadDataProject()
	{
		clearErrors();
		projectList.clearEntryList();
		projectList.setKz_insert("1");
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_SCHW", getSessionId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(projectList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("SCHW_ID"));
				map.put("user",						rs.getString("SCHW_USER"));
				map.put("xpts",						rs.getString("SCHW_XPTS"));
				map.put("bezeichnung",				rs.getString("SCHW_BEZEICHNUNG"));
				map.put("art_code",					rs.getString("SWAR_CODE"));
				map.put("art",						rs.getString("SWAR_DECODE"));
				map.put("sort",						rs.getString("SCHW_SORT"));
				map.put("kz_veraltet",				rs.getString("SCHW_KZ_VERALTET"));

				projectList.getEntryList().add(new Project(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			projectList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	public void saveContest()
	{
		setErrors(new ArrayList<String>(1));
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_BJES

		xml = new XML();
		list = (List<ComplexEntryList>) contestList.getEntryList();
		it = list.iterator();
		if(it!=null) while(it.hasNext())
		{
			Contest tentry = (Contest) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("WETT_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("WEKA_CODE",				tentry.getKategorie_code()));
				e.appendChild(xml.createE("WETT_BEZEICHNUNG",		tentry.getBezeichnung()));
				e.appendChild(xml.createE("WETT_SORT",				tentry.getSort()));
				e.appendChild(xml.createE("WETT_KZ_VERALTET",		tentry.getKz_veraltet()));
				e.appendChild(xml.createE("WETT_USER",				tentry.getUser()));
				e.appendChild(xml.createE("WETT_XPTS",				tentry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_WETT = xml.getEncodedString("unicode");
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("xss_WETT_IUD", getSessionId());		
			p.setString("@DATA", xml_WETT);

			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		if(getErrors().size() < 1) contestList = null;
	}
	public void saveInstrument()
	{
		clearErrors();
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_BJES

		xml = new XML();
		list = (List<ComplexEntryList>) instrumentList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Instrument tentry = (Instrument) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("SEIA_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("SEIA_KURZBEZEICHNUNG",	tentry.getBezeichnung()));
				e.appendChild(xml.createE("SEIA_LANGBEZEICHNUNG",	tentry.getBeschreibung()));
//				e.appendChild(xml.createE("SEIA_URL",				tentry.getUrl()));
				e.appendChild(xml.createE("SEIA_SORT",				tentry.getSort()));
				e.appendChild(xml.createE("SEIA_KZ_VERALTET",		tentry.getKz_veraltet()));
				e.appendChild(xml.createE("SEIA_USER",				tentry.getUser()));
				e.appendChild(xml.createE("SEIA_XPTS",				tentry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
				
		String xml_SEIA = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("xss_SEIA_IUD", getSessionId());		
			p.setString("@DATA",			xml_SEIA);

			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		if(getErrors().size() < 1) instrumentList = null;
	}
	public void saveProject()
	{
		clearErrors();
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_BJES

		xml = new XML();
		list = (List<ComplexEntryList>) projectList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Project tentry = (Project) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("SCHW_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("SCHW_BEZEICHNUNG",		tentry.getBezeichnung()));
//				e.appendChild(xml.createE("SEIA_URL",				tentry.getUrl()));
				e.appendChild(xml.createE("SWAR_CODE",				tentry.getArt_code()));
				e.appendChild(xml.createE("SCHW_SORT",				tentry.getSort()));
				e.appendChild(xml.createE("SCHW_KZ_VERALTET",		tentry.getKz_veraltet()));
				e.appendChild(xml.createE("SCHW_USER",				tentry.getUser()));
				e.appendChild(xml.createE("SCHW_XPTS",				tentry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
				
		String xml_SCHW = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("xss_SCHW_IUD", getSessionId());		
			p.setString("@DATA",			xml_SCHW);

			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		if(getErrors().size() < 1) instrumentList = null;
	}
	public ComplexList getInstrumentList()
	{
		return instrumentList;
	}
	public void setInstrumentList(ComplexList instrumentList)
	{
		this.instrumentList = instrumentList;
	}
	public ComplexList getContestList()
	{
		return contestList;
	}
	public void setContestList(ComplexList contestList)
	{
		this.contestList = contestList;
	}
	public SearchList getPtsList()
	{
		return ptsList;
	}
	public void setPtsList(SearchList ptsList)
	{
		this.ptsList = ptsList;
	}
	public SearchList getPtsDetailList()
	{
		return ptsDetailList;
	}
	public void setPtsDetailList(SearchList ptsDetailList)
	{
		this.ptsDetailList = ptsDetailList;
	}
	public PtsSearchForm getPtsSearchForm()
	{
		return ptsSearchForm;
	}
	public void setPtsSearchForm(PtsSearchForm ptsSearchForm)
	{
		this.ptsSearchForm = ptsSearchForm;
	}


	public ComplexList getProjectList() {
		return projectList;
	}


	public void setProjectList(ComplexList projectList) {
		this.projectList = projectList;
	}

}