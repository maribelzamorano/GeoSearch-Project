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
import com.topdev.tsp.model.list.modules.cooperation.CooperationPartner;

public class SchoolCooperation extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			partnerList;
	private List<Category>		partnerSortList;
	private List<String>		errors = new ArrayList<String>(1);

	public SchoolCooperation()
	{
		partnerList = new ComplexList();
		partnerList.getHeadingList().add(new ComplexHeading("Partner"));
	}
	
	public void loadData() 
	{
		loadDataPartner();
	}

	void loadDataPartner()
	{
		partnerList.clearEntryList();
		clearErrors();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure(getMode()==1?"psp_KOOP":"psp_getSchuleKooperationspartner", getSessionId());
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);
			if(getMode()==1)	p.setOut(	"@KZ_INSERT",			Types.BIT);

			p.setInt(						"@GEPA_ID",				getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();

			String filter_decode, filter_code;
			partnerSortList	= new ArrayList<Category>(10);
			int i=0;
			while(rs!=null && rs.next())
			{
				filter_decode	= rs.getString("KOKA_DECODE");
				filter_code		= rs.getString("KOKA_CODE");
				Category category	= new Category(filter_code, filter_decode);
				if(!partnerSortList.contains(category)) partnerSortList.add(category);
				
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(++i));
				map.put("name",				rs.getString("KOOP_NAME"));				
				map.put("partnerart",		rs.getString("KOOA_BEZEICHNUNG"));			
				map.put("kategorie",		filter_decode);
				map.put("kategorie_code",	filter_code);
				map.put("strasse",			rs.getString("KOOP_STRASSE"));
				map.put("hausnummer",		rs.getString("KOOP_HAUSNR"));
				map.put("ort",				rs.getString("KOOP_ORT"));
				map.put("plz",				rs.getString("KOOP_PLZ"));
				map.put("land",				rs.getString("LAND_BEZEICHNUNG"));		
				map.put("schwerpunkt",		rs.getString("KOOP_SCHWERPUNKT_ZUSARB"));
				map.put("homepage",			rs.getString("KOOP_HOMEPAGE"));
				map.put("beginn",			rs.getString("KOOP_BEGINN_ZUSARB"));
				
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("KOOP_ID"));
					map.put("user",				rs.getString("KOOP_USER"));
					map.put("xpts",				rs.getString("KOOP_XPTS"));
					map.put("partnerart_code",	rs.getString("KOOA_ID"));
					map.put("land_code",		rs.getString("LAND_ID"));
				}
				
				partnerList.getEntryList().add(new CooperationPartner(map));
			}
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
			if(getMode()==1)	partnerList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
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
		List<ComplexEntryList>		list		= null;
		Iterator<ComplexEntryList>	it			= null;
	
//		____________________________________________________________________________________________________
//		xml_KOOP 

		Element	e	= null;
		xml			= new XML();
		list = (List<ComplexEntryList>) partnerList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			CooperationPartner entry = (CooperationPartner) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry.getDeleted()));
				e.appendChild(xml.createE("KOOP_ID",				entry.getId_entity()));
				e.appendChild(xml.createE("GEPA_ID",				getId()));
				e.appendChild(xml.createE("KOOP_USER",				entry.getUser()));
				e.appendChild(xml.createE("KOOP_XPTS",				entry.getXpts()));
				
				e.appendChild(xml.createE("KOOA_ID",				entry.getPartnerart_code()));
				e.appendChild(xml.createE("KOOP_NAME",				entry.getName()));
				e.appendChild(xml.createE("KOOP_PLZ",				entry.getPlz()));
				e.appendChild(xml.createE("KOOP_ORT",				entry.getOrt()));
				e.appendChild(xml.createE("KOOP_STRASSE",			entry.getStrasse()));
				e.appendChild(xml.createE("KOOP_HAUSNR",			entry.getHausnummer()));
				//e.appendChild(xml.createE("KOOP_HAUSNRZ",			entry.getHausnummerzusatz()));
				e.appendChild(xml.createE("LAND_ID",				entry.getLand_code()));
				e.appendChild(xml.createE("KOOP_BEGINN_ZUSARB",		entry.getBeginn()));
				e.appendChild(xml.createE("KOOP_SCHWERPUNKT_ZUSARB",entry.getSchwerpunkt()));
				e.appendChild(xml.createE("KOOP_HOMEPAGE",			entry.getHomepage()));
				xml.getRoot().appendChild(e);
			}
		}
		if(e==null) errors.add("Es wurde kein Datensatz geändert.");
		else
		{
			String xml_KOOP = xml.getEncodedString("unicode");
			try
			{
	//			____________________________________________________________________________________________________
	//			Speichern...
	
				connection 	= BasicActionSupport.getConnection();
				p			 = new SqlProcedure("xss_KOOP_IUD", getSessionId());		
				p.setString("@DATA",					xml_KOOP);
				
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
	
	
	public ComplexList getPartnerList() {
		return partnerList;
	}

	public void setPartnerList(ComplexList partnerList) {
		this.partnerList = partnerList;
	}


	public List<String> getErrors()
	{
		return errors;
	}

	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}

	public List<Category> getPartnerSortList()
	{
		return partnerSortList;
	}

	public void setPartnerSortList(List<Category> partnerSortList)
	{
		this.partnerSortList = partnerSortList;
	}
}
