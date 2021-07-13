package com.topdev.tsp.model.view;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.topdev.tsp.model.list.modules.school_intention.ForeignLanguage;
import com.topdev.tsp.model.list.modules.school_intention.SchoolIntention;

public class SchoolSchoolIntention extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			intentionList;
	private ComplexList			foreignlanguageList;

	public SchoolSchoolIntention()
	{
		intentionList	= new ComplexList();
		intentionList.getHeadingList().add(new ComplexHeading("Wir nehmen teil an:"));
		
		foreignlanguageList	= new ComplexList();
		foreignlanguageList.getHeadingList().add(new ComplexHeading("Wir bieten folgende Fremdsprachen an"));
	}

	public void loadData()
	{
		loadDataIntention();
		List<String> tErrors = new ArrayList<String>(10); tErrors.addAll(getErrors());
		loadDataForeignLanguage();
		if(getErrors().size()<1) setErrors(tErrors);
	}
	
	void loadDataForeignLanguage()
	{
		clearErrors();
		foreignlanguageList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_SFRS":"psp_getSchuleFremdsprachen", getSessionId());
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			
			p.setInt(						"@GEPA_ID",				getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			 
			int i=0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				map.put("code",					rs.getString("FRSP_ID"));
				map.put("decode",				rs.getString("FRSP_BEZEICHNUNG"));

				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("SFRS_ID"));
					map.put("user",				rs.getString("SFRS_USER"));
					map.put("xpts",				rs.getString("SFRS_XPTS"));
				}
				foreignlanguageList.getEntryList().add(new ForeignLanguage(map));
			}
			p.finalizeResults();
			if(getMode()==1)	foreignlanguageList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(getMode()!=1)	{
				DateFormat format = new SimpleDateFormat("dd.MM.yy HH:mm");
				String tmp = p.getStringParameter("@CC_LETZTE_AENDERUNG");
				if (getPts()!=null && !getPts().equals("")){
					try{
						Date date1 = (Date)format.parse(tmp);
						Date date2 = (Date)format.parse(getPts());
						if (date1.after(date2))setPts(tmp); 
					}
					catch(ParseException e){
						setPts(tmp);
					}
				}
				else setPts(tmp);
				if (getKz_edit()==null) setKz_edit(	p.getStringParameter("@KZ_EDIT"));
				if (getKz_edit()!=null && !getKz_edit().equals("1"))setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			}	
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	
	void loadDataIntention()
	{
		clearErrors();
		intentionList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_SCWT":"psp_getSchuleSchwerpunktteilnahmen", getSessionId());
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);

			p.setInt(						"@GEPA_ID",				getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			 
			int i=0;
			while(rs!=null && rs.next())
			{
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				map.put("spar_code",			rs.getString("SWAR_CODE"));
				map.put("spar_decode",			rs.getString("SWAR_DECODE"));
				map.put("schw_bezeichnung",		rs.getString("SCHW_BEZEICHNUNG"));
				map.put("schw_id",				rs.getString("SCHW_ID"));
				map.put("kz_artikel", 			rs.getString("SCHW_KZ_ARTIKEL"));
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("SCWT_ID"));
					map.put("user",				rs.getString("SCWT_USER"));
					map.put("xpts",				rs.getString("SCWT_XPTS"));
				}
				intentionList.getEntryList().add(new SchoolIntention(map));
			}
			p.finalizeResults();
			if(getMode()!=1)	{
				DateFormat format = new SimpleDateFormat("dd.MM.yy HH:mm");
				String tmp = p.getStringParameter("@CC_LETZTE_AENDERUNG");
				if (getPts()!=null && !getPts().equals("")){
					try{
						Date date1 = (Date)format.parse(tmp);
						Date date2 = (Date)format.parse(getPts());
						if (date1.after(date2))setPts(tmp); 
					}
					catch(ParseException e){
						setPts(tmp);
					}
				}
				else setPts(tmp);
				if (getKz_edit()==null) setKz_edit(	p.getStringParameter("@KZ_EDIT"));
				if (getKz_edit()!=null && !getKz_edit().equals("1"))setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			}	
			if(getMode()==1)	intentionList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
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
//		xml_SCWT 

		//Projekte etc..
		xml = new XML();
		list = (List<ComplexEntryList>) intentionList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			SchoolIntention entry = (SchoolIntention) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		entry.getDeleted()));
				e.appendChild(xml.createE("SCWT_ID",			entry.getId_entity()));
				e.appendChild(xml.createE("GEPA_ID",			getId()));
				e.appendChild(xml.createE("SCHW_ID",			entry.getSchw_id()));
				e.appendChild(xml.createE("SCWT_USER",			entry.getUser()));
				e.appendChild(xml.createE("SCWT_XPTS",			entry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_SCWT = xml.getEncodedString("unicode");

		//Fremdsprachen
		xml = new XML();
		list = (List<ComplexEntryList>) foreignlanguageList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			ForeignLanguage entry = (ForeignLanguage) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",		entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",		entry.getDeleted()));
				e.appendChild(xml.createE("GEPA_ID",			getId()));
				e.appendChild(xml.createE("FRSP_ID",			entry.getCode()));
				e.appendChild(xml.createE("SFRS_ID",			entry.getId_entity()));
				e.appendChild(xml.createE("SFRS_USER",			entry.getUser()));
				e.appendChild(xml.createE("SFRS_XPTS",			entry.getXpts()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_SFRS = xml.getEncodedString("unicode");
		try
		{
//			____________________________________________________________________________________________________
//			Speichern...
			
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("xss_SCWT_IUD", getSessionId());
			p.setString("@SCWT_DATA", xml_SCWT);
			p.setString("@SFRS_DATA", xml_SFRS);

			p.execute(	connection);		
			p.finalizeResults();
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return getErrors();
	}
	
	public ComplexList getIntentionList()
	{
		return intentionList;
	}

	public void setIntentionList(ComplexList intentionList)
	{
		this.intentionList = intentionList;
	}

	public ComplexList getForeignlanguageList() {
		return foreignlanguageList;
	}

	public void setForeignlanguageList(ComplexList foreignlanguageList) {
		this.foreignlanguageList = foreignlanguageList;
	}

	
}