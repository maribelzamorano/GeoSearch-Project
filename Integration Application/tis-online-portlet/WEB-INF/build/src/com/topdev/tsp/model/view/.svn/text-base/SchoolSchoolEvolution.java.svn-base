package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.w3c.dom.Element;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.xml.XML;
import com.topdev.aa.object.error.ValidationError;
import com.topdev.service.anla.Proxy;
import com.topdev.service.anla.data.BobjAnla;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.complex.Template2EntryList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionEmphasis;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionInstrument;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionIntention;

public class SchoolSchoolEvolution extends BasicViewModel
{
	private static final long		serialVersionUID	= 1L;
	private ComplexList				instrumentList;	
	private Map<String, String>		instrumentSortList;
	private ComplexList				emphasisList;
	private Map<String, String>		emphasisSortList;
	private EvolutionIntention		intention;
	
	public SchoolSchoolEvolution()
	{
		emphasisList = new ComplexList();
		emphasisList.getHeadingList().add(new ComplexHeading("Schwerpunkt"));
		instrumentList = new ComplexList();
		instrumentList.getHeadingList().add(new ComplexHeading("Instrument"));
	}

	public void loadData()
	{
		clearErrors();
		if(getMode()!=1)
		{
			Connection		connection	= null;
		   	SqlProcedure	p			= null;
			try
			{
				connection	= BasicActionSupport.getConnection();
				p			= new SqlProcedure("psp_getSchuleSchulentwicklung", getSessionId());
				p.setOut(	"@KZ_EDIT",				Types.BIT);
				p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
				p.setInt(	"@GEPA_ID",				getId());

				p.execute(connection);
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
			loadDataIntention();
			loadDataEmphasis();
			loadDataInstrument();
		}
	}
	public void loadDataIntention()
	{
		intention = new EvolutionIntention();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_EWSE":"psp_getSchuleEntwicklungsvorhaben", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				Set<String> set = new HashSet<String>(20);
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("beschluss",			rs.getString("EWSE_DATUM_SCHULKONFERENZ"));
				map.put("expertenbesuch",		rs.getString("EWSE_DATUM_EXPERTENBESUCH"));
				map.put("wiederholungsbesuch",	rs.getString("EWSE_DATUM_WIEDERHOLUNGSBESUCH"));
				map.put("abschluss",			rs.getString("EWSE_DATUM_ZIELVEREINBARUNG"));
				map.put("teilnahme",			rs.getString("EWSE_KZ_BETEILIGUNG"));
				map.put("anlagen_labels",		rs.getString("ANLA_XBEZEICHNUNG"));
				map.put("anlagen_ids",			rs.getString("ANLA_XID"));
				if(getMode()==1)
				{
					map.put("kz_edit",		rs.getString("KZ_EDIT"));
					map.put("kz_delete",	rs.getString("KZ_DELETE"));
					map.put("id_entity",	rs.getString("EWSE_ID"));
					map.put("user",			rs.getString("EWSE_USER"));
					map.put("xpts",			rs.getString("EWSE_XPTS"));
				}
				intention = new EvolutionIntention(map);
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataEmphasis()
	{
	   	emphasisList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_EWSS":"psp_getSchuleEntwicklungsschritt", getSessionId());
			p.setInt(	"@GEPA_ID",		getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				Set<String> set = new HashSet<String>(20);
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("schwerpunkt",				rs.getString("EWSS_SCHWERPUNKTE"));
				map.put("entwicklungsschritt",		rs.getString("SESA_DECODE"));
				map.put("beteiligte",				rs.getString("BJES_XBEZEICHNUNG"));
				map.put("anlagen_labels",			rs.getString("ANLA_XBEZEICHNUNG"));
				map.put("anlagen_ids",				rs.getString("ANLA_XID"));
				if(getMode()==1)
				{
					map.put("kz_edit",					rs.getString("KZ_EDIT"));
					map.put("kz_delete",				rs.getString("KZ_DELETE"));
					map.put("id_entity",				rs.getString("EWSS_ID"));
					map.put("user",						rs.getString("EWSS_USER"));
					map.put("xpts",						rs.getString("EWSS_XPTS"));
					map.put("entwicklungsschritt_code",	rs.getString("SESA_CODE"));
				}
				EvolutionEmphasis ee = new EvolutionEmphasis(map);
				emphasisList.getEntryList().add(ee);
			}
			p.finalizeResults();
			if(getMode()==1)	emphasisList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataInstrument()
	{
	   	instrumentList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_EWSI":"psp_getSchuleInstrument", getSessionId());
								p.setInt(	"@GEPA_ID",		getId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				Set<String> set = new HashSet<String>(20);
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(instrumentList.getEntryList().size())+1);
				map.put("beschreibung",				rs.getString("EWSI_INSTRUMENTE"));
				map.put("instrument_art",			rs.getString("SEIA_BEZEICHNUNG"));
				map.put("instrument_art_code",		rs.getString("SEIA_ID"));
				map.put("beteiligte",				rs.getString("BJEI_XBEZEICHNUNG"));
				map.put("anlagen_labels",			rs.getString("ANLA_XBEZEICHNUNG"));
				map.put("anlagen_ids",				rs.getString("ANLA_XID"));
				map.put("kz_artikel",				rs.getString("SEIA_KZ_ARTIKEL"));
				if(getMode()==1)
				{
					map.put("kz_edit",					rs.getString("KZ_EDIT"));
					map.put("kz_delete",				rs.getString("KZ_DELETE"));
					map.put("id_entity",				rs.getString("EWSI_ID"));
					map.put("user",						rs.getString("EWSI_USER"));
					map.put("xpts",						rs.getString("EWSI_XPTS"));					
					map.put("art_code",					rs.getString("SEIA_ID"));
				}
				EvolutionInstrument ei = new EvolutionInstrument(map);
				instrumentList.getEntryList().add(ei);
			}
			p.finalizeResults();
			if(getMode()==1)	instrumentList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataIntentionSublists()
	{
		if(intention==null) return;
		intention.setIntention_anla_liste(new ComplexList());
		intention.getIntention_anla_liste().getHeadingList().add(new ComplexHeading("Dokument"));

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_ANLA", getSessionId());
			p.setInt(	"@TBSH_ID",			intention.getId_entity());
			p.setString("@TBSH_SHORTNAME",	"EWSE");
			p.setOut(	"@KZ_INSERT",		Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("ANLA_ID"));
				map.put("user",						rs.getString("ANLA_USER"));
				map.put("xpts",						rs.getString("ANLA_XPTS"));
				map.put("bezeichnung",				rs.getString("ANLA_BEZEICHNUNG"));
				intention.getIntention_anla_liste().getEntryList().add(new Template2EntryList(map));
			}

			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			intention.getIntention_anla_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataInstrumentSublists(EvolutionInstrument ei)
	{
		ei.getInstrument_beteiligte_liste().setEntryList(	new ArrayList<ComplexEntryList>(3) );
		ei.getInstrument_anla_liste().setEntryList(		new ArrayList<ComplexEntryList>(3) );

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_BJEI", getSessionId());
			p.setInt(	"@EWSI_ID",		ei.getId_entity());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("BJEI_ID"));
				map.put("user",						rs.getString("BJEI_USER"));
				map.put("xpts",						rs.getString("BJEI_XPTS"));
				map.put("bezeichnung",				rs.getString("BJEI_BEZEICHNUNG"));
				ei.getInstrument_beteiligte_liste().getEntryList().add(new Template1EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			ei.getInstrument_beteiligte_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_ANLA", getSessionId());
			p.setInt(	"@TBSH_ID",			ei.getId_entity());
			p.setString("@TBSH_SHORTNAME",	"EWSI");
			p.setOut(	"@KZ_INSERT",		Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("ANLA_ID"));
				map.put("user",						rs.getString("ANLA_USER"));
				map.put("xpts",						rs.getString("ANLA_XPTS"));
				map.put("bezeichnung",				rs.getString("ANLA_BEZEICHNUNG"));
				ei.getInstrument_anla_liste().getEntryList().add(new Template2EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			ei.getInstrument_anla_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataEmphasisSublists(EvolutionEmphasis ee)
	{
		ee.getBeteiligte_liste().setEntryList(	new ArrayList<ComplexEntryList>(3) );
		ee.getAnla_liste().setEntryList(		new ArrayList<ComplexEntryList>(3) );

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_BJES", getSessionId());
			p.setInt(	"@EWSS_ID",		ee.getId_entity());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("BJES_ID"));
				map.put("user",						rs.getString("BJES_USER"));
				map.put("xpts",						rs.getString("BJES_XPTS"));
				map.put("bezeichnung",				rs.getString("BJES_BEZEICHNUNG"));
				ee.getBeteiligte_liste().getEntryList().add(new Template1EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			ee.getBeteiligte_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_ANLA", getSessionId());
			p.setInt(	"@TBSH_ID",			ee.getId_entity());
			p.setString("@TBSH_SHORTNAME",	"EWSS");
			p.setOut(	"@KZ_INSERT",		Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",						String.valueOf(emphasisList.getEntryList().size())+1);
				map.put("kz_edit",					rs.getString("KZ_EDIT"));
				map.put("kz_delete",				rs.getString("KZ_DELETE"));
				map.put("id_entity",				rs.getString("ANLA_ID"));
				map.put("user",						rs.getString("ANLA_USER"));
				map.put("xpts",						rs.getString("ANLA_XPTS"));
				map.put("bezeichnung",				rs.getString("ANLA_BEZEICHNUNG"));
				ee.getAnla_liste().getEntryList().add(new Template2EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			ee.getAnla_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public HashMap<String, String> saveIntention()
	{
		clearErrors();
		HashMap<String, String> anlaIds = new HashMap<String, String>(2);
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;

//		____________________________________________________________________________________________________
//		xml_ANLA

		xml = new XML();
		list = (List<ComplexEntryList>) intention.getIntention_anla_liste().getEntryList();
		it = list.iterator();			
		if(!intention.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template2EntryList tentry = (Template2EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				if(!tentry.isDeleted())
				{
				   	try
					{
						BobjAnla a = new BobjAnla(tentry.getFile(), tentry.getFileName());
						a.setTbshId(	getId());
						a.setTbshCode(	"EWSE");
						a.setNutzerkreisCode(	"40");
						a.setTbshId(			getId());
						a.setTitel(		tentry.getBezeichnung());
						com.topdev.aa.data.BobjStandard result = Proxy.insert(getUser(), getSessionId(), a);
						if(result!=null)
						{
							tentry.setId_entity(	result.getId());
							tentry.setUser(			result.getOrgUser());
							tentry.setXpts(			result.getOrgXPts());
				
							if(result.getValidationErrors()!=null)
							{
								String es = "";
								for(ValidationError ve :result.getValidationErrors()) es+=ve.getText()+" \n";
								if(es.length()>0) getErrors().add(es);
							}
						}
						else getErrors().add("Beim Einfügen des Bildes ist ein Fehler aufgetreten. (EC157)");
					}
					catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); log.error(ex.getLocalizedMessage()); }
				}				
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("ANLA_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("ANLA_BEZEICHNUNG",		tentry.getBezeichnung()));
				e.appendChild(xml.createE("ANLA_GROESSE",			tentry.getGroesse()));
				e.appendChild(xml.createE("ANLA_USER",				tentry.getUser()));
				e.appendChild(xml.createE("ANLA_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("CLIENT_ID",				tentry.getId()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANLA = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_EWSE_IUD", getSessionId());		

			p.setString("@GEPA_ID",				getId());
			p.setString("@EWSE_ID",				intention.getId_entity());
			p.setString("@EWSE_USER",			intention.getUser());
			p.setString("@EWSE_XPTS",			intention.getXpts());
			p.setString("@KZ_IS_MODIFIED",		"1");
			p.setString("@KZ_IS_DELETED",		intention.getDeleted());

			p.setString("@EWSE_DATUM_SCHULKONFERENZ",		intention.getBeschluss());
			p.setString("@EWSE_DATUM_EXPERTENBESUCH",		intention.getExpertenbesuch());
			p.setString("@EWSE_DATUM_WIEDERHOLUNGSBESUCH",	intention.getWiederholungsbesuch());
			p.setString("@EWSE_DATUM_ZIELVEREINBARUNG",		intention.getAbschluss());
			p.setString("@EWSE_KZ_BETEILIGUNG",				intention.getTeilnahme());
			p.setString("@ANLA_DATA",						xml_ANLA);

			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null)
			{
				while(rs.next()) anlaIds.put(rs.getString("CLIENT_ID"), rs.getString("ANLA_ID"));
				rs.close();
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }

		return anlaIds;
	}
	public HashMap<String, String> saveEmphasis(String userName, EvolutionEmphasis entry)
	{
		clearErrors();
		HashMap<String, String> anlaIds = new HashMap<String, String>(2);
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_BJES

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getBeteiligte_liste().getEntryList();
		it = list.iterator();			
		if(!entry.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template1EntryList tentry = (Template1EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getDeleted().equals("1")?"0":"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("BJES_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("BJES_USER",				tentry.getUser()));
				e.appendChild(xml.createE("BJES_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("BJES_BEZEICHNUNG",		tentry.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_BJES = xml.getEncodedString("unicode");
//		____________________________________________________________________________________________________
//		xml_ANLA

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getAnla_liste().getEntryList();
		it = list.iterator();			
		if(!entry.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template2EntryList tentry = (Template2EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				if(!tentry.isDeleted())
				{
				   	try
					{
						BobjAnla a = new BobjAnla(tentry.getFile(), tentry.getFileName());
						a.setTbshId(			entry.getId_entity());
						a.setTbshCode(			"EWSS");
						a.setNutzerkreisCode(	"40");
						a.setTbshId(			getId());
						a.setTitel(		tentry.getBezeichnung());
						com.topdev.aa.data.BobjStandard result = Proxy.insert(userName, getSessionId(), a);
						if(result!=null)
						{
							tentry.setId_entity(	result.getId());
							tentry.setUser(			result.getOrgUser());
							tentry.setXpts(			result.getOrgXPts());
				
							if(result.getValidationErrors()!=null)
							{
								String es = "";
								for(ValidationError ve :result.getValidationErrors()) es+=ve.getText()+" \n";
								if(es.length()>0) getErrors().add(es);
							}
						}
						else getErrors().add("Beim Einfügen des Bildes ist ein Fehler aufgetreten. (EC157)");
					}
					catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); log.error(ex.getLocalizedMessage()); }
				}
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getDeleted().equals("1")?"0":"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("ANLA_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("ANLA_BEZEICHNUNG",		tentry.getBezeichnung()));
				e.appendChild(xml.createE("ANLA_GROESSE",			tentry.getGroesse()));
				e.appendChild(xml.createE("ANLA_USER",				tentry.getUser()));
				e.appendChild(xml.createE("ANLA_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("CLIENT_ID",				tentry.getId()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANLA = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_EWSS_IUD", getSessionId());		

			p.setString("@GEPA_ID",				getId());
			p.setString("@EWSS_ID",				entry.getId_entity());
			p.setString("@EWSS_USER",			entry.getUser());
			p.setString("@EWSS_XPTS",			entry.getXpts());
			p.setString("@KZ_IS_MODIFIED",		"1");
			p.setString("@KZ_IS_DELETED",		entry.getDeleted());
			p.setString("@EWSS_SCHWERPUNKTE",	entry.getSchwerpunkt());
			p.setString("@SESA_CODE",			entry.getEntwicklungsschritt_code());
			p.setString("@ANLA_DATA",			xml_ANLA);
			p.setString("@BJES_DATA",			xml_BJES);

			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null)
			{
				while(rs.next()) anlaIds.put(rs.getString("CLIENT_ID"), rs.getString("ANLA_ID"));
				rs.close();
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }

		return anlaIds;
	}	
	public HashMap<String, String> saveInstrument(String userName, EvolutionInstrument entry)
	{
		clearErrors();
		HashMap<String, String> anlaIds = new HashMap<String, String>(2);
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
//		____________________________________________________________________________________________________
//		xml_BJES

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getInstrument_beteiligte_liste().getEntryList();
		it = list.iterator();			
		if(!entry.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template1EntryList tentry = (Template1EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getDeleted().equals("1")?"0":"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("BJEI_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("BJEI_USER",				tentry.getUser()));
				e.appendChild(xml.createE("BJEI_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("BJEI_BEZEICHNUNG",		tentry.getBezeichnung()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_BJEI = xml.getEncodedString("unicode");
		
		
		
		
				
		
		
//		____________________________________________________________________________________________________
//		xml_ANLA

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getInstrument_anla_liste().getEntryList();
		it = list.iterator();			
		if(!entry.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template2EntryList tentry = (Template2EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				if(!tentry.isDeleted())
				{
				   	try
					{
						BobjAnla a = new BobjAnla(tentry.getFile(), tentry.getFileName());
						a.setTbshId(	entry.getId_entity());
						a.setTbshCode(	"EWSI");
						a.setNutzerkreisCode(	"40");
						a.setTbshId(			getId());
						
						a.setTitel(		tentry.getBezeichnung());
						com.topdev.aa.data.BobjStandard result = Proxy.insert(userName, getSessionId(), a);
						if(result!=null)
						{
							tentry.setId_entity(	result.getId());
							tentry.setUser(			result.getOrgUser());
							tentry.setXpts(			result.getOrgXPts());
				
							if(result.getValidationErrors()!=null)
							{
								String es = "";
								for(ValidationError ve :result.getValidationErrors()) es+=ve.getText()+" \n";
								if(es.length()>0) getErrors().add(es);
							}
						}
						else getErrors().add("Beim Einfügen des Bildes ist ein Fehler aufgetreten. (EC157)");
					}
					catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); log.error(ex.getLocalizedMessage()); }
				}
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getDeleted().equals("1")?"0":"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("ANLA_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("ANLA_BEZEICHNUNG",		tentry.getBezeichnung()));
				e.appendChild(xml.createE("ANLA_GROESSE",			tentry.getGroesse()));
				e.appendChild(xml.createE("ANLA_USER",				tentry.getUser()));
				e.appendChild(xml.createE("ANLA_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("CLIENT_ID",				tentry.getId()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANLA = xml.getEncodedString("unicode");
		
		
		
		/*
//		____________________________________________________________________________________________________
//		xml_ANLA

		xml = new XML();
		list = (List<ComplexEntryList>) entry.getInstrument_anla_liste().getEntryList();
		it = list.iterator();			
		if(!entry.isDeleted()) if(it!=null) while(it.hasNext())
		{
			Template2EntryList tentry = (Template2EntryList) it.next();
			if(tentry.isDeleted() || tentry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			tentry.getDeleted().equals("1")?"0":"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",			tentry.getDeleted()));
				e.appendChild(xml.createE("ANLA_ID",				tentry.getId_entity()));
				e.appendChild(xml.createE("ANLA_BEZEICHNUNG",		tentry.getBezeichnung()));
				e.appendChild(xml.createE("ANLA_GROESSE",			tentry.getGroesse()));
				e.appendChild(xml.createE("ANLA_USER",				tentry.getUser()));
				e.appendChild(xml.createE("ANLA_XPTS",				tentry.getXpts()));
				e.appendChild(xml.createE("CLIENT_ID",				tentry.getId()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANLA = xml.getEncodedString("unicode");
*/
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_EWSI_IUD", getSessionId());

			p.setString("@GEPA_ID",				getId());
			p.setString("@EWSI_ID",				entry.getId_entity());
			p.setString("@EWSI_USER",			entry.getUser());
			p.setString("@EWSI_XPTS",			entry.getXpts());
			p.setString("@KZ_IS_MODIFIED",		"1");
			p.setString("@KZ_IS_DELETED",		entry.getDeleted());
			p.setString("@EWSI_INSTRUMENTE",	entry.getBeschreibung());
			p.setString("@SEIA_BEZEICHNUNG",	entry.getInstrument_art());
			p.setString("@ANLA_DATA",			xml_ANLA);
			p.setString("@BJEI_DATA",			xml_BJEI);

			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null)
			{
				while(rs.next()) anlaIds.put(rs.getString("CLIENT_ID"), rs.getString("ANLA_ID"));
				rs.close();
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }

		return anlaIds;
	}
	public List<String> saveData()
	{
		List<String> errors = new ArrayList<String>(1);
/*		

		String xml="<?xml version=\"1.0\" encoding=\"unicode\" ?> ";
		xml+="<root>";
		List<ComplexEntryList> list = (List<ComplexEntryList>) emphasisList.getEntryList();
		Iterator<ComplexEntryList> it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			EvolutionEmphasis entry = (EvolutionEmphasis) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				xml+="<entry>";
				xml+="<KZ_IS_MODIFIED>"				+ (entry.isModified()?"1":"0")									+ "</KZ_IS_MODIFIED>";
				xml+="<KZ_IS_DELETED>"				+ (entry.isDeleted()?"1":"0")									+ "</KZ_IS_DELETED>";
				xml+="<EWSS_ID>"					+ (entry.isInserted()?"0":formatString(entry.getId_entity()))	+ "</EWSS_ID>";
				xml+="<EWSS_NAME_ERGEBNISDOK>"		+ formatString(entry.getDatei_ergebnisFileName())				+ "</EWSS_NAME_ERGEBNISDOK>";
				xml+="<EWSS_NAME_MATERIALDOK>"		+ formatString(entry.getDatei_materialFileName())				+ "</EWSS_NAME_MATERIALDOK>";
				xml+="<EWSS_ID_ERGEBNISDOK>"		+ formatString(entry.getDatei_ergebnis_id())					+ "</EWSS_ID_ERGEBNISDOK>";
				xml+="<EWSS_ID_MATERIALDOK>"		+ formatString(entry.getDatei_material_id())					+ "</EWSS_ID_MATERIALDOK>";
				xml+="<SESA_CODE>"					+ formatString(entry.getEntwicklungsschritt_code())				+ "</SESA_CODE>";
				xml+="<EWSS_USER>"					+ formatString(entry.getUser())									+ "</EWSS_USER>";
				xml+="<EWSS_XPTS>"					+ formatString(entry.getXpts())									+ "</EWSS_XPTS>";
				xml+="</entry>";
			}
		}
		xml+="</root>";
		
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_SCEN_IUD", getSessionId());
			p.setString("@SCEN_ID",					getId());
			p.setString("@SCEN_USER",				getUser());
			p.setString("@SCEN_XPTS",				getXpts());
			p.setString("@KZ_MODIFIED",				"1");
			p.setString("@KZ_DELETED",				"0");
			p.setInt(	"@GEPA_ID",					getId());
			p.setString("@SESA_DATA",				xml);
			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) errors.add(p.getErrorString());
			p.close();
		}	
		catch(SQLException e)
		{
			errors.add(e.getLocalizedMessage());
			while((e = e.getNextException())!=null) errors.add(e.getLocalizedMessage());
		}
		finally { SqlProcedure.closeConnection(connection); }
*/
		return errors;
	}

	public ComplexList getEmphasisList()
	{
		return emphasisList;
	}

	public void setEmphasisList(ComplexList emphasisList)
	{
		this.emphasisList = emphasisList;
	}

	public Map<String, String> getEmphasisSortList()
	{
		return emphasisSortList;
	}

	public void setEmphasisSortList(Map<String, String> emphasisSortList)
	{
		this.emphasisSortList = emphasisSortList;
	}

	public ComplexList getInstrumentList()
	{
		return instrumentList;
	}

	public void setInstrumentList(ComplexList instrumentList)
	{
		this.instrumentList = instrumentList;
	}

	public Map<String, String> getInstrumentSortList()
	{
		return instrumentSortList;
	}

	public void setInstrumentSortList(Map<String, String> instrumentSortList)
	{
		this.instrumentSortList = instrumentSortList;
	}
	public EvolutionIntention getIntention()
	{
		return intention;
	}
	public void setIntention(EvolutionIntention intention)
	{
		this.intention = intention;
	}


}