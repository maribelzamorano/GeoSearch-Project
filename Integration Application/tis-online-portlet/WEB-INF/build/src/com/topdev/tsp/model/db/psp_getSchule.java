package com.topdev.tsp.model.db;

import com.topdev.aa.data.DataObject;

public class psp_getSchule extends DataObject
{
	private static final long	serialVersionUID	= 1L;
	String ID; 
	String SCHULNUMMER; 
	String SCHULNAME;
	String SCHULART;
	String CC_PLZ_ORT;
	String CC_STRASSE;
	String SCHULTRAEGER;
	String SCHULAMT;
	String CC_NAME_1_ORT;
	String AENDERUNG;	
	
	public String getSCHULAMT() {
		return SCHULAMT;
	}
	public void setSCHULAMT(String schulamt) {
		SCHULAMT = schulamt;
	}
	
	public String getSCHULTRAEGER() {
		return SCHULTRAEGER;
	}
	public void setSCHULTRAEGER(String schultraeger) {
		SCHULTRAEGER = schultraeger;
	}
	public String getCC_PLZ_ORT()
	{
		return CC_PLZ_ORT;
	}
	public void setCC_PLZ_ORT(String cc_plz_ort)
	{
		CC_PLZ_ORT = cc_plz_ort;
	}
	public String getCC_STRASSE()
	{
		return CC_STRASSE;
	}
	public void setCC_STRASSE(String cc_strasse)
	{
		CC_STRASSE = cc_strasse;
	}
	public String getSCHULART()
	{
		return SCHULART;
	}
	public void setSCHULART(String schulart)
	{
		SCHULART = schulart;
	}
	public String getSCHULNAME()
	{
		return SCHULNAME;
	}
	public void setSCHULNAME(String schulname)
	{
		SCHULNAME = schulname;
	}
	public String getSCHULNUMMER()
	{
		return SCHULNUMMER;
	}
	public void setSCHULNUMMER(String schulnummer)
	{
		SCHULNUMMER = schulnummer;
	}
	public String getID()
	{
		return ID;
	}
	public void setID(String id)
	{
		ID = id;
	}
	public String getCC_NAME_1_ORT()
	{
		return CC_NAME_1_ORT;
	}
	public void setCC_NAME_1_ORT(String cc_name_1_ort)
	{
		CC_NAME_1_ORT = cc_name_1_ort;
	}
	public void setAENDERUNG(String str)
	{
		AENDERUNG = str;
	}
	public String getAENDERUNG()
	{
		return AENDERUNG;
	}
}