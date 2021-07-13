package com.topdev.tsp.model.list.modules.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class OverviewAddress extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String adressart;
	String adressart_decode;
	String serienbrief;
	String plz;
	String strasse;
	String zusatz;
	String hausnummer_1;
	String hausnummer_2;
	String ort;
	String nation;
	String gstaId;
	String gstaId_view;

	public OverviewAddress()							{				}
	public OverviewAddress(String id)					{ setId(id);	}
	public OverviewAddress(HashMap<String, String> map)	{ setData(map);	}
	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		String						t_strasse	=	getStrasse();
		if(getHausnummer_1()!=null)	t_strasse	+=	" " + getHausnummer_1();
		if(getHausnummer_2()!=null)	t_strasse	+=	" " + getHausnummer_2();

		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("adressart",			getAdressart_decode(),		"textfield"));
		getEntries().add(new SimpleEntry("strasse",				t_strasse,					"textfield"));
		getEntries().add(new SimpleEntry("ort",					getPlz() + " "+ getOrt(),	"textfield"));
		getEntries().add(new SimpleEntry("zusatz",				getZusatz(),				"textfield"));
		getEntries().add(new SimpleEntry("serienbrief",			getSerienbrief(),			"checkbox"));
		getEntries().add(new SimpleEntry("schulteil",			getGstaId_view(),			"textfield"));
	}
	
	public String getAdressart() {
		return adressart;
	}
	public void setAdressart(String adressart) {
		this.adressart = adressart;
	}
	public String getAdressart_decode() {
		return adressart_decode;
	}
	public void setAdressart_decode(String adressart_decode) {
		this.adressart_decode = adressart_decode;
	}
	public String getHausnummer_1() {
		return hausnummer_1;
	}
	public void setHausnummer_1(String hausnummer_1) {
		this.hausnummer_1 = hausnummer_1;
	}
	public String getHausnummer_2() {
		return hausnummer_2;
	}
	public void setHausnummer_2(String hausnummer_2) {
		this.hausnummer_2 = hausnummer_2;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getOrt() {
		return ort;
	}
	public void setOrt(String ort) {
		this.ort = ort;
	}
	public String getPlz() {
		return plz;
	}
	public void setPlz(String plz) {
		this.plz = plz;
	}
	public String getSerienbrief() {
		return serienbrief;
	}
	public void setSerienbrief(String serienbrief) {
		this.serienbrief = serienbrief;
	}
	public String getStrasse() {
		return strasse;
	}
	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getZusatz() {
		return zusatz;
	}
	public void setZusatz(String zusatz) {
		this.zusatz = zusatz;
	}
	public String getGstaId() {
		return gstaId;
	}
	public void setGstaId(String gstaId) {
		this.gstaId = gstaId;
	}
	public String getGstaId_view() {
		return gstaId_view;
	}
	public void setGstaId_view(String gstaId_view) {
		this.gstaId_view = gstaId_view;
	}
}