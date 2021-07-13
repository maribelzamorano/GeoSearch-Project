package com.topdev.tsp.model.view;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Element;

import com.topdev.aa.client.AnlaProxy;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.XML;
import com.topdev.aa.object.error.ValidationError;
import com.topdev.service.anla.Proxy;
import com.topdev.service.anla.data.BobjAnla;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.Category;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.complex.Template3EntryList;
import com.topdev.tsp.model.list.modules.documents.Documents;
import com.topdev.tsp.model.list.modules.documents.Link;

public class SchoolDocuments extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			documentList;
	private ComplexList			linkList;
	private List<Category>		documentSortList;
		
	public SchoolDocuments()
	{
		documentList = new ComplexList();
		documentList.getHeadingList().add(new ComplexHeading("Beschreibung"));
		documentList.getHeadingList().add(new ComplexHeading("Typ"));
		documentList.getHeadingList().add(new ComplexHeading("Größe"));
		documentList.getHeadingList().add(new ComplexHeading("Letzte Aktualisierung"));
		
		linkList = new ComplexList();
		linkList.getHeadingList().add(new ComplexHeading("Verweis"));
		linkList.getHeadingList().add(new ComplexHeading("Letzte Aktualisierung"));
	}

	public void loadLinks()
	{
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		linkList.clearEntryList();
		linkList.setKz_insert("1");
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_LINK":"psp_getLinks", getSessionId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			p.setInt(						"@GEPA_ID",				getId());
			if(getMode()!=1) p.setString(	"@ANVW_CODE",			getTbsh());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
	
			int i = 0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();

				map.put("id",					String.valueOf(++i));
				map.put("id_entity",			rs.getString("LINK_ID"));
				map.put("kz_download",			"0");
				
				if(getMode()==2)
				{
					map.put("text",			rs.getString("LINK_TEXT"));
					map.put("url",			rs.getString("LINK_URL"));
					map.put("datum",		rs.getString("CC_LETZTE_AENDERUNG"));
				}
				else
				{
					map.put("text",			rs.getString("LINK_TEXT"));
					map.put("url",			rs.getString("LINK_URL"));
					map.put("kz_edit",		rs.getString("KZ_EDIT"));
					map.put("kz_delete",	rs.getString("KZ_DELETE"));
					map.put("user",			rs.getString("LINK_USER"));
					map.put("xpts",			rs.getString("LINK_XPTS"));
					map.put("datum",		rs.getString("CC_LETZTE_AENDERUNG"));
				}
				linkList.getEntryList().add(new Link(map, 1));			
			}
			p.finalizeResults();
			if(getMode()==1)	linkList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}
	
	public void loadDocuments()
	{
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		documentList.clearEntryList();
		documentList.setKz_insert("1");

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_ANLA":"psp_getDokumente", getSessionId());
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);

			p.setInt(	(getMode()==1)?"@TBSH_ID":"@GEPA_ID",	getId());
			p.setString("@TBSH_SHORTNAME",						getTbsh());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
	
			String filter_decode, filter_code;
			documentSortList = new ArrayList<Category>(10);
			int i = 0;
			while(rs!=null && rs.next())
			{
				map				= new HashMap<String, String>();

				map.put("id",					String.valueOf(++i));
				map.put("id_entity",			rs.getString("ANLA_ID"));
				map.put("kz_download",			"1");
				
				filter_decode	= rs.getString("DAGR_BEZEICHNUNG");
				filter_code		= rs.getString("DAGR_ID");
				Category category	= new Category(filter_code, filter_decode);
				if(!documentSortList.contains(category)) documentSortList.add(category);
				
				if(getMode()==2)
				{
					map.put("name",					rs.getString("ANLA_NAME"));
					map.put("beschreibung",			rs.getString("ANLA_BEZEICHNUNG"));
					map.put("groesse",				formatFileSize(rs.getLong("ANLA_GROESSE")));
					map.put("dokumentart_code",		rs.getString("DAGR_ID"));
					map.put("dokumentart_decode",	rs.getString("DAGR_BEZEICHNUNG"));
					map.put("datum",				rs.getString("CC_LETZTE_AENDERUNG"));
					map.put("typ",					rs.getString("CC_DATEITYP"));
//					map.put("typ",					rs.getString("DATY_BEZEICHNUNG"));
				}
				else
				{
					map.put("name",					rs.getString("ANLA_NAME"));
					map.put("beschreibung",			rs.getString("ANLA_BEZEICHNUNG"));
					map.put("groesse",				formatFileSize(rs.getLong("ANLA_GROESSE")));
					map.put("dokumentart_code",		rs.getString("DAGR_ID"));
					map.put("dokumentart_decode",	rs.getString("DAGR_BEZEICHNUNG"));
					map.put("datum",				rs.getString("CC_LETZTE_AENDERUNG"));
					map.put("typ",					rs.getString("CC_DATEITYP"));
					map.put("kz_edit",				rs.getString("KZ_EDIT"));

					String geprueft	= rs.getString("ANLA_KZ_GEPRUEFT");
					String anlaId	= rs.getString("ANLA_ID");
					if(Validator.equals(geprueft,"1") && anlaId!=null)
						map.put("kz_delete", "1");
					else map.put("kz_delete", "0");

					map.put("user",					rs.getString("ANLA_USER"));
					map.put("xpts",					rs.getString("ANLA_XPTS"));
				}
				documentList.getEntryList().add(new Documents(map, 1));			
			}
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
			if(getMode()==1)	documentList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
	}
	
	public void loadData()
	{
		clearErrors();
		loadDocuments();
		loadLinks();
	}

	public void loadDataDocumentSublists(Documents entry)
	{
		entry.getGruppen_liste().setEntryList(	new ArrayList<ComplexEntryList>(3) );

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_ANVW", getSessionId());
			p.setInt(	"@ANLA_ID",		entry.getId_entity());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(entry.getGruppen_liste().getEntryList().size())+1);
				map.put("kz_edit",			"1");
				map.put("kz_delete",		"1");
				map.put("id_entity",		rs.getString("ANVW_ID"));
				map.put("user",				rs.getString("ANVW_USER"));
				map.put("xpts",				rs.getString("ANVW_XPTS"));
				map.put("code",				rs.getString("TBSH_SHORTNAME"));
				map.put("decode",			rs.getString("TBSH_SHORTNAME"));
				if(!"GEPA".equals(map.get("code"))) entry.getGruppen_liste().getEntryList().add(new Template3EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			entry.getGruppen_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	public void loadDataLinkSublists(Link entry)
	{
		entry.getGruppen_liste().setEntryList(	new ArrayList<ComplexEntryList>(3) );

		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_LIZU", getSessionId());
			p.setInt(	"@LINK_ID",		entry.getId_entity());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(entry.getGruppen_liste().getEntryList().size())+1);
				map.put("kz_edit",			"1");
				map.put("kz_delete",		"1");
				map.put("id_entity",		rs.getString("LIZU_ID"));
				map.put("user",				rs.getString("LIZU_USER"));
				map.put("xpts",				rs.getString("LIZU_XPTS"));
				map.put("code",				rs.getString("ANVW_CODE"));
				map.put("decode",			rs.getString("ANVW_CODE"));
				if(rs.getString("ANVW_CODE")!=null && !rs.getString("ANVW_CODE").equals("DOKU"))
					entry.getGruppen_liste().getEntryList().add(new Template3EntryList(map));
			}
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			entry.getGruppen_liste().setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	public void saveAnla(String userName, Documents entry, File file)
	{
		clearErrors();
	   	String ANLA_ID = entry.getId_entity();
	   	String ANLA_USER="";
	   	String ANLA_XPTS="";
	   	
	   	if(ANLA_ID==null) ANLA_ID = "0";
	   	log.debug("ANLA_ID1:"+ANLA_ID);

		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	ANLA_ID = entry.getId_entity();
	   	if(ANLA_ID==null) ANLA_ID = "0";
	   	log.debug("ANLA_ID2:"+ANLA_ID);

	   	
   		XML xml = new XML();
   		
		if(true)	//erste Zeile mit GEPA_ID anfuegen
		{
				Element e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		null));
				e.appendChild(xml.createE("KZ_IS_DELETED",		null));
				e.appendChild(xml.createE("ANVW_ID",			null));
				e.appendChild(xml.createE("ANVW_USER",			null));
				e.appendChild(xml.createE("ANVW_XPTS",			null));
				e.appendChild(xml.createE("ANLA_ID",			ANLA_ID));
				e.appendChild(xml.createE("TBSH_SHORTNAME",		"GEPA"));
				e.appendChild(xml.createE("TBSH_ID",			getId()));
				xml.getRoot().appendChild(e);
		}
		if(ANLA_ID.equals("0"))	//zweite Zeile mit referenz auf DOKU
		{
				Element e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		null));
				e.appendChild(xml.createE("KZ_IS_DELETED",		null));
				e.appendChild(xml.createE("ANVW_ID",			null));
				e.appendChild(xml.createE("ANVW_USER",			null));
				e.appendChild(xml.createE("ANVW_XPTS",			null));
				e.appendChild(xml.createE("ANLA_ID",			ANLA_ID));
				e.appendChild(xml.createE("TBSH_SHORTNAME",		"DOKU"));
				e.appendChild(xml.createE("TBSH_ID",			getId()));
				xml.getRoot().appendChild(e);
		}

		Iterator<ComplexEntryList>it = entry.getGruppen_liste().getEntryList().iterator();
		if(it!=null) while(it.hasNext())
		{
			Template3EntryList subEntry = (Template3EntryList) it.next();
			if(subEntry.isDeleted() || subEntry.isModified())
			{
				Element e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		subEntry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		subEntry.getDeleted()));
				e.appendChild(xml.createE("ANVW_ID",			subEntry.getId_entity()));
				e.appendChild(xml.createE("ANVW_USER",			subEntry.getUser()));
				e.appendChild(xml.createE("ANVW_XPTS",			subEntry.getXpts()));

				e.appendChild(xml.createE("ANLA_ID",			ANLA_ID));
				e.appendChild(xml.createE("TBSH_SHORTNAME",		subEntry.getCode()));
				e.appendChild(xml.createE("TBSH_ID",			getId()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANVW = xml.getEncodedString("unicode");
		
		
		try
		{
	   		connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_SCDO_IUD");
			
			p.setString("@SESSION_ID",				getSessionId());
			p.setString("@USER",					getUser());
			p.setOut(	"@ANLA_ID", 				Types.INTEGER);
			p.setInt(	"@ANLA_ID",					ANLA_ID);
			p.setString("@ANLA_USER",				entry.getUser());
			p.setString("@ANLA_XPTS",				entry.getXpts());
			p.setString("@AAKT_CODE",				"0".equals(ANLA_ID)?"10":"20");
//			p.setString("@TBSH_ID",					getId());
			p.setString("@ANVW_DATA",				xml_ANVW);

			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			if(rs!=null && rs.next())
			{
				System.out.println("ANLA_01: "+ANLA_ID);
				ANLA_ID = rs.getString("ANLA_ID");
				System.out.println("ANLA_02: "+ANLA_ID);
				ANLA_USER = rs.getString("ANLA_USER");
				ANLA_XPTS = rs.getString("ANLA_XPTS");
			}
			p.finalizeResults();
			if("0".equals(ANLA_ID)) ANLA_ID = p.getStringParameter("@ANLA_ID");
			System.out.println("ANLA_03: "+ANLA_ID);

			p.close();
			entry.setDokument_id(	ANLA_ID);
			entry.setId_entity(		ANLA_ID);
			
			
			
		   	try
			{
				BobjAnla a = new BobjAnla(file, entry.getDokumentFileName());
				a.setId(				ANLA_ID);
				System.out.println("ANLA_04: "+ANLA_ID);

				a.setOrgUser(			ANLA_USER);
				a.setOrgXPts(			ANLA_XPTS);
				a.setTbshId(			getId());
				a.setTbshCode(			"ANLA");
				a.setNutzerkreisCode(	"40");
				a.setTitel(				entry.getBeschreibung());
				a.setGruppeCode(		entry.getDokumentart_code());
				com.topdev.aa.data.BobjStandard result = Proxy.insert(userName, getSessionId(), a);
				if(result!=null)
				{
//						entry.setId_entity(		result.getId());
//						entry.setUser(			result.getOrgUser());
//						entry.setXpts(			result.getOrgXPts());
		
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
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	public void saveLink(Link entry)
	{
		clearErrors();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	String			Link_ID		= entry.getId_entity();
	   	
	   	if(Link_ID==null) Link_ID = "0";
	   	
   		XML xml = new XML();
   		

		if(Link_ID.equals("0"))	//zweite Zeile mit referenz auf DOKU
		{
				Element e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		"1"));
				e.appendChild(xml.createE("KZ_IS_DELETED",		"0"));
				e.appendChild(xml.createE("LIZU_ID",			null));
				e.appendChild(xml.createE("LIZU_USER",			null));
				e.appendChild(xml.createE("LIZU_XPTS",			null));
				e.appendChild(xml.createE("ANVW_CODE",			"DOKU"));
				xml.getRoot().appendChild(e);
		}

		Iterator<ComplexEntryList>it = entry.getGruppen_liste().getEntryList().iterator();
		if(it!=null) while(it.hasNext())
		{
			Template3EntryList subEntry = (Template3EntryList) it.next();
			if(subEntry.isDeleted() || subEntry.isModified())
			{
				Element e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		subEntry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		subEntry.getDeleted()));
				e.appendChild(xml.createE("LIZU_ID",			subEntry.getId_entity()));
				e.appendChild(xml.createE("LIZU_USER",			subEntry.getUser()));
				e.appendChild(xml.createE("LIZU_XPTS",			subEntry.getXpts()));
				e.appendChild(xml.createE("ANVW_CODE",			subEntry.getCode()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_ANVW = xml.getEncodedString("unicode");
		
	   	try
		{
			connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_LINK_IUD", getSessionId());

			p.setBit(	"@KZ_IS_DELETED",	false	);
			p.setBit(	"@KZ_IS_MODIFIED",	true	);
			p.setString("@GEPA_ID",			getId());
			p.setString("@LIZU_DATA",		xml_ANVW);

			p.setString("@LINK_TEXT",		entry.getText());
			p.setString("@LINK_URL",		entry.getUrl());
			p.setString("@LINK_ID",			entry.getId_entity());
			p.setString("@LINK_USER",		entry.getUser());
			p.setString("@LINK_XPTS",		entry.getXpts());

			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void deleteLink(Link entry)
	{
		clearErrors();
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
	   	try
		{
			connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_LINK_IUD", getSessionId());
			p.setBit(	"@KZ_IS_DELETED",		true	);
			p.setBit(	"@KZ_IS_MODIFIED",		false	);
			p.setString("@GEPA_ID",				getId());
			p.setString("@LINK_ID",				entry.getId_entity());
			p.setString("@LINK_USER",			entry.getUser());
			p.setString("@LINK_XPTS",			entry.getXpts());
			p.setString("@LINK_TEXT",			entry.getText());
			p.setString("@LINK_URL",			entry.getUrl());
			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		if(getErrors().size()==0)
		{
			getLinkList().removeElementByEntityId(entry.getId());
		}
	}
	public void deleteAnla(Documents entry, String userName)
	{
		System.out.println("deleteAnla:"+getSessionId()+":"+userName);
		clearErrors();
		BobjAnla anla = new BobjAnla();
		anla.setId(entry.getId_entity());
		anla.setOrgUser(entry.getUser());
		anla.setOrgXPts(entry.getXpts());
	   	try
		{
	   		AnlaProxy.delete(userName, getSessionId(), anla);
		}
		catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); }
		if(getErrors().size()==0)
		{
			getDocumentList().removeElementByEntityId(entry.getId());
		}
	}

	public List<String> saveData()
	{
		clearErrors();
		List<String> errors = new ArrayList<String>(1);

		String xml="<?xml version=\"1.0\" encoding=\"unicode\" ?> ";
		xml+="<root>";
		List<ComplexEntryList> list = (List<ComplexEntryList>) documentList.getEntryList();
		Iterator<ComplexEntryList> it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Documents entry = (Documents) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				xml+="<entry>";
				xml+="<KZ_IS_MODIFIED>"				+ (entry.isModified()?"1":"0")									+ "</KZ_IS_MODIFIED>";
				xml+="<KZ_IS_DELETED>"				+ (entry.isDeleted()?"1":"0")									+ "</KZ_IS_DELETED>";
				xml+="<DOKU_ID>"					+ (entry.isInserted()?"0":formatString(entry.getId_entity()))	+ "</EWSS_ID>";
				xml+="<ANLA_NAME>"					+ formatString(entry.getDokumentFileName())						+ "</ANLA_NAME>";
				xml+="<ANLA_ID>"					+ formatString(entry.getDokument_id())							+ "</ANLA_ID>";
				xml+="<DOAR_CODE>"					+ formatString(entry.getDokumentart_code())						+ "</DOAR_CODE>";
				xml+="<DOKU_USER>"					+ formatString(entry.getUser())									+ "</DOKU_USER>";
				xml+="<DOKU_XPTS>"					+ formatString(entry.getXpts())									+ "</DOKU_XPTS>";
				xml+="</entry>";
			}
		}
		xml+="</root>";
		
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("pss_DOKU_IUD", getSessionId());
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

		return errors;
	}

	public ComplexList getDocumentList() {
		return documentList;
	}

	public void setDocumentList(ComplexList documentList) {
		this.documentList = documentList;
	}

	public List<Category> getDocumentSortList()
	{
		return documentSortList;
	}

	public void setDocumentSortList(List<Category> documentSortList)
	{
		this.documentSortList = documentSortList;
	}

	public ComplexList getLinkList() {
		return linkList;
	}

	public void setLinkList(ComplexList linkList) {
		this.linkList = linkList;
	}


}