package com.topdev.tsp.model.list.modules.overview;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.EntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class OverviewCommunication extends ComplexEntryList implements EntryList
{
	private static final long	serialVersionUID	= 1L;
	String kommunikationsart;
	String kommunikationsart_decode;
	String verbindung;
	String bevorzugt;
	String gstaId;
	String gstaId_view;
	
	public OverviewCommunication()							{				}
	public OverviewCommunication(String id)					{ 		setId(id);}
	public OverviewCommunication(HashMap<String, String> map)	{ setData(map);	}
	

	
	public void setData(HashMap<String,String> map)
	{
		super.setData(map);
		getEntries().add(new SimpleEntry("kommunikationsart",	getKommunikationsart_decode(),	"textfield" ));
		getEntries().add(new SimpleEntry("verbindung", 			getVerbindung(), 				"textfield" ));
		getEntries().add(new SimpleEntry("bevorzugt", 			getBevorzugt(), 				"checkbox" ));
		getEntries().add(new SimpleEntry("schulteil",	 		getGstaId_view(), 				"textfield" ));
	}
	
	public String getKommunikationsart() {
		return kommunikationsart;
	}
	public void setKommunikationsart(String kommunikationsart) {
		this.kommunikationsart = kommunikationsart;
	}
	public String getBevorzugt() {
		return bevorzugt;
	}
	public void setBevorzugt(String bevorzugt) {
		this.bevorzugt = bevorzugt;
	}
	public String getVerbindung() {
		return verbindung;
	}
	public void setVerbindung(String verbindung) {
		this.verbindung = verbindung;
	}

	public String getKommunikationsart_decode() {
		return kommunikationsart_decode;
	}

	public void setKommunikationsart_decode(String kommunikationsart_decode) {
		this.kommunikationsart_decode = kommunikationsart_decode;
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