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
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.activate_quality.ActivateQualityExpertise;

public class SchoolActivateQuality extends BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	private ComplexList			expertiseList;
	private List<String>		errors = new ArrayList<String>(1);


	public SchoolActivateQuality()
	{
		expertiseList = new ComplexList();
		expertiseList.getHeadingList().add(new ComplexHeading("Ergebnisse"));
		expertiseList.getHeadingList().add(new ComplexHeading("Sortierfolge"));
	}

	public void loadData() 
	{
		loadDataExpertise();
	}

	void loadDataExpertise()
	{
		expertiseList.clearEntryList();
		errors = new ArrayList<String>(1);
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure(getMode()==1?"psp_WIQU":"psp_getSchuleWirkungsqualitaet", getSessionId());
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
				map.put("beschreibung",			rs.getString("WIQU_BESCHREIBUNG"));				
				
				if(getMode()==1)
				{
					map.put("kz_edit",			rs.getString("KZ_EDIT"));
					map.put("kz_delete",		rs.getString("KZ_DELETE"));
					map.put("id_entity",		rs.getString("WIQU_ID"));
					map.put("user",				rs.getString("WIQU_USER"));
					map.put("xpts",				rs.getString("WIQU_XPTS"));
					map.put("sortierung",		rs.getString("WIQU_SORT"));	

				}
				expertiseList.getEntryList().add(new ActivateQualityExpertise(map));
			}
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
			if(getMode()==1)	expertiseList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
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
	
//		____________________________________________________________________________________________________
//		xml_WIQU 

		xml = new XML();
		list = (List<ComplexEntryList>) expertiseList.getEntryList();
		it = list.iterator();			
		if(it!=null) while(it.hasNext())
		{
			ActivateQualityExpertise entry = (ActivateQualityExpertise) it.next();
			if(entry.isDeleted() || entry.isModified())
			{
				e = xml.createElement("entry");
				e.appendChild(xml.createE("KZ_IS_MODIFIED",			entry.getModified()));
				e.appendChild(xml.createE("KZ_IS_DELETED",			entry.getDeleted()));
				e.appendChild(xml.createE("WIQU_ID",				entry.getId_entity()));
				e.appendChild(xml.createE("GEPA_ID",				getId()));
				e.appendChild(xml.createE("WIQU_USER",				entry.getUser()));
				e.appendChild(xml.createE("WIQU_XPTS",				entry.getXpts()));
				
				e.appendChild(xml.createE("WIQU_BESCHREIBUNG",		entry.getBeschreibung()));
				e.appendChild(xml.createE("WIQU_SORT",				entry.getSortierung()));
				xml.getRoot().appendChild(e);
			}
		}
		String xml_WIQU = xml.getEncodedString("unicode");

		try
		{
//			____________________________________________________________________________________________________
//			Speichern...

			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("xss_WIQU_IUD", getSessionId());		
			p.setString("@DATA",					xml_WIQU);
			
			p.execute(	connection);
			p.finalizeResults();
			if(p.getErrorString()!=null) errors.add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { errors.add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) errors.add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return errors;
	}

	public List<String> getErrors()
	{
		return errors;
	}

	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}

	public ComplexList getExpertiseList() {
		return expertiseList;
	}

	public void setExpertiseList(ComplexList expertiseList) {
		this.expertiseList = expertiseList;
	}


}
