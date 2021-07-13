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
import com.topdev.tsp.model.list.modules.contributer.Contributer;



public class SchoolContributer extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			contributerList;
	private List<Category>		contributerSortList;
	private List<String>		errors = new ArrayList<String>(1);

	public SchoolContributer()
	{
	   	contributerList	= new ComplexList();
		contributerList.getHeadingList().add(new ComplexHeading("Name"));
		contributerList.getHeadingList().add(new ComplexHeading("Funktion"));
		contributerList.getHeadingList().add(new ComplexHeading("Erreichbarkeit"));
	}

	public void loadData()
	{
		loadDataContributers();
	}

	void loadDataContributers()
	{
		contributerList.clearEntryList();
		errors = new ArrayList<String>(1);		
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;


		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_FUTR":"psp_getSchuleFunktionstraeger", getSessionId());
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);

			p.setInt(						"@GEPA_ID",				getId());
			p.setString(					"@KZ_MITWIRKUNG",		"1");
			
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			String filter_decode, filter_code;
			contributerSortList = new ArrayList<Category>(10);
			int i=0;
			while(rs!=null && rs.next())
			{
				filter_decode	= rs.getString("FUKA_DECODE");
				filter_code		= rs.getString("FUKA_CODE");
				Category category	= new Category(filter_code, filter_decode);
				if(!contributerSortList.contains(category)) contributerSortList.add(category);

				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(++i));

				map.put("vorname",			rs.getString("FUTR_VORNAME"));
				map.put("nachname",			rs.getString("FUTR_NACHNAME"));
				map.put("titel",			rs.getString("FUTR_TITEL"));
				map.put("kategorie",		filter_decode);
				map.put("kategorie_code",	filter_code);
				map.put("funktion",			rs.getString("FUNK_BEZEICHNUNG"));
				map.put("erreichbarkeit",	rs.getString("FUTR_TELEFON"));

				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("FUTR_ID"));
					map.put("user",				rs.getString("FUTR_USER"));
					map.put("xpts",				rs.getString("FUTR_XPTS"));
					map.put("funktion_code",	rs.getString("FUNK_ID"));
				}
				contributerList.getEntryList().add( new Contributer(map));
			}
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
			if(getMode()==1)	contributerList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		catch(SQLException ex) { errors.add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) errors.add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}

	public List<String> saveData() throws SQLException
	{
		errors = new ArrayList<String>(1);
		Connection					connection	= null;
	   	SqlProcedure				p			= null;
		XML							xml			= null;
		Element						e			= null;
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
	
//	____________________________________________________________________________________________________
//		xml_FUTR 

		xml = new XML();
		list = (List<ComplexEntryList>) contributerList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			Contributer entry = (Contributer) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry.getDeleted()));
				e.appendChild(xml.createE("FUTR_ID",				entry.getId_entity()));
				e.appendChild(xml.createE("GEPA_ID",				getId()));
				e.appendChild(xml.createE("FUTR_USER",				entry.getUser()));
				e.appendChild(xml.createE("FUTR_XPTS",				entry.getXpts()));
				
				e.appendChild(xml.createE("FUNK_ID",				entry.getFunktion_code()));
				e.appendChild(xml.createE("FUTR_VORNAME",			entry.getVorname()));
				e.appendChild(xml.createE("FUTR_NACHNAME",			entry.getNachname()));
				e.appendChild(xml.createE("FUTR_TITEL",				entry.getTitel()));
				e.appendChild(xml.createE("FUTR_TELEFON",			entry.getErreichbarkeit()));

				//Leere Felder von Datenbank benoetigt
				e.appendChild(xml.createE("FUTR_EMAIL",				""));
				e.appendChild(xml.createE("FUTR_SPRECHZEITEN",		""));
				e.appendChild(xml.createE("FUTR_BEMERKUNG",			""));

				xml.getRoot().appendChild(e);
			}
		}
		if(e==null) errors.add("Es wurde kein Datensatz geändert.");
		else
		{
			String xml_FUTR = xml.getEncodedString("unicode");
			try
			{
	//			____________________________________________________________________________________________________
	//			Speichern...
	
				connection 	= BasicActionSupport.getConnection();
				p			 = new SqlProcedure("xss_FUTR_IUD", getSessionId());
				p.setString("@DATA",				xml_FUTR);
				
				p.execute(	connection);
				p.finalizeResults();
				if(p.getErrorString()!=null) errors.add(p.getErrorString());
				p.close();
			}	
			catch(SQLException ex) { errors.add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) errors.add(ex.getLocalizedMessage()); }
			finally { SqlProcedure.closeConnection(connection); }
		}
		return errors;
	}
	
	

	public ComplexList getContributerList() {
		return contributerList;
	}

	public void setContributerList(ComplexList contributerList) {
		this.contributerList = contributerList;
	}

	public List<String> getErrors()
	{
		return errors;
	}

	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}

	public List<Category> getContributerSortList()
	{
		return contributerSortList;
	}

	public void setContributerSortList(List<Category> contributerSortList)
	{
		this.contributerSortList = contributerSortList;
	}


}