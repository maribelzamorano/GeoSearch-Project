package com.topdev.tsp.model.list.modules.documents;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Link extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String text;
	String url;
	String datum;
	ComplexList	gruppen_liste;

	public Link(int style)								{ setStyle(style);				initSublists();  }
	public Link(String id, int style)					{ setStyle(style); setId(id);	initSublists(); 	}
	public Link(HashMap<String, String> map, int style){ setStyle(style); setData(map);	initSublists(); 	}

	public void initSublists()
	{
		gruppen_liste = new ComplexList();
		gruppen_liste.getHeadingList().add(new ComplexHeading("Gruppe"));
	}

	@Override
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		setEntries(new ArrayList<SimpleEntry>(10));
		
		getEntries().add(new SimpleEntry("Link",					"window.open('"+getUrl()+"')", 	getText(),		"link"));
		getEntries().add(new SimpleEntry("Letzte Aktualisierung",	getDatum(),					"textfield"));
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getUrl() {
		if(url!=null && !url.startsWith("http")) url="http://"+url;
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDatum() {
		return datum;
	}
	public void setDatum(String datum) {
		this.datum = datum;
	}
	public ComplexList getGruppen_liste() {
		return gruppen_liste;
	}
	public void setGruppen_liste(ComplexList gruppen_liste) {
		this.gruppen_liste = gruppen_liste;
	}

}