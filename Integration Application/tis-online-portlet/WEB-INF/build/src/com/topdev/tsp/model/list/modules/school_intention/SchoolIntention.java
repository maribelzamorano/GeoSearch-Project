package com.topdev.tsp.model.list.modules.school_intention;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;


public class SchoolIntention extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String schw_bezeichnung;
	String schw_id;
	String spar_code;
	String spar_decode;
	String kz_artikel;
	
	public String getKz_artikel() {
		return kz_artikel;
	}
	public void setKz_artikel(String kz_artikel) {
		this.kz_artikel = kz_artikel;
	}
	public SchoolIntention()							{				}
	public SchoolIntention(String id)					{ setId(id);	}
	public SchoolIntention(HashMap<String, String> map)	{ setData(map);	}

	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		SimpleEntry se = new SimpleEntry("entry","textfield");
		if(getSpar_decode()!=null)	se.setDecode(getSpar_decode()+" "+getSchw_bezeichnung());
		else						se.setDecode(getSchw_bezeichnung());

		getEntries().add(se);
	}

	public String getSchw_bezeichnung()
	{
		return schw_bezeichnung;
	}
	public void setSchw_bezeichnung(String schw_bezeichnung)
	{
		this.schw_bezeichnung = schw_bezeichnung;
	}
	public String getSchw_id()
	{
		return schw_id;
	}
	public void setSchw_id(String schw_id)
	{
		this.schw_id = schw_id;
	}
	public String getSpar_decode()
	{
		return spar_decode;
	}
	public void setSpar_decode(String spar_decode)
	{
		this.spar_decode = spar_decode;
	}
	public String getSpar_code()
	{
		return spar_code;
	}
	public void setSpar_code(String spar_code)
	{
		this.spar_code = spar_code;
	}
	public void setPROJ_schw_bezeichnung(String proj_schw_bezeichnung)
	{
		this.schw_bezeichnung = proj_schw_bezeichnung;
	}
	public void setPROJ_schw_id(String proj_schw_id)
	{
		this.schw_id = proj_schw_id;
	}
	public void setVERS_schw_bezeichnung(String vers_schw_bezeichnung)
	{
		this.schw_bezeichnung = vers_schw_bezeichnung;
	}
	public void setVERS_schw_id(String vers_schw_id)
	{
		this.schw_id = vers_schw_id;
	}
	public void setVORH_schw_bezeichnung(String vorh_schw_bezeichnung)
	{
		this.schw_bezeichnung = vorh_schw_bezeichnung;
	}
	public void setVORH_schw_id(String vorh_schw_id)
	{
		this.schw_id = vorh_schw_id;
	}

}