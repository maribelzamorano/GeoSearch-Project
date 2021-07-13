package com.topdev.tsp.model.list.modules.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class OverviewSchooltract extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String bezeichnung;
	String plzOrt;
	String strasse;
	String telefon;
	String telefax;
	String email;
	
	public OverviewSchooltract()							{				}
	public OverviewSchooltract(String id)					{ setId(id);	}
	public OverviewSchooltract(HashMap<String, String> map)	{ setData(map);	}
	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("bezeichnung",	getBezeichnung(),	"textfield"));
		getEntries().add(new SimpleEntry("plzOrt",		getPlzOrt(),		"textfield"));
		getEntries().add(new SimpleEntry("strasse",		getStrasse(),		"textfield"));
		getEntries().add(new SimpleEntry("telefon",		getTelefon(),		"textfield"));
		getEntries().add(new SimpleEntry("telefax",		getTelefax(),		"textfield"));
		getEntries().add(new SimpleEntry("email",		getEmail(),			"textfield"));
	}
	public String getBezeichnung() {
		return bezeichnung;
	}
	public void setBezeichnung(String bezeichnung) {
		this.bezeichnung = bezeichnung;
	}
	public String getPlzOrt() {
		return plzOrt;
	}
	public void setPlzOrt(String plzOrt) {
		this.plzOrt = plzOrt;
	}
	public String getStrasse() {
		return strasse;
	}
	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}
	public String getTelefon() {
		return telefon;
	}
	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}
	public String getTelefax() {
		return telefax;
	}
	public void setTelefax(String telefax) {
		this.telefax = telefax;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	

}