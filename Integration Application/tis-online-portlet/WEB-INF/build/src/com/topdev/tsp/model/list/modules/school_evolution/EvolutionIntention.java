package com.topdev.tsp.model.list.modules.school_evolution;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;

public class EvolutionIntention extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String beschluss;
	String expertenbesuch;
	String wiederholungsbesuch;
	String abschluss;
	String teilnahme;
	String anlagen_labels;
	String anlagen_ids;
	HashMap<String,String> anlagen;

	ComplexList	intention_anla_liste;
	public EvolutionIntention()								{ initSublists(); 				}
	public EvolutionIntention(String id)					{ setId(id); initSublists();	}
	public EvolutionIntention(HashMap<String, String> map)	{ setData(map); initSublists();	}

	public void initSublists()
	{
		intention_anla_liste = new ComplexList();
		intention_anla_liste.getHeadingList().add(new ComplexHeading("Dokument"));
	}
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);
		anlagen = new HashMap<String,String>(5);
		if(anlagen_ids!=null && anlagen_labels!=null)
		{
			String[] labels	= anlagen_labels.split(",");
			String[] ids	= anlagen_ids.split(",");
			if(labels.length == ids.length) for(int i=0; i<ids.length; i++) anlagen.put(ids[i], labels[i]);
		}
	}
	
	public String getAbschluss()
	{
		return abschluss;
	}
	public void setAbschluss(String abschluss)
	{
		this.abschluss = abschluss;
	}

	public HashMap<String, String> getAnlagen()
	{
		return anlagen;
	}
	public void setAnlagen(HashMap<String, String> anlagen)
	{
		this.anlagen = anlagen;
	}
	public String getAnlagen_ids()
	{
		return anlagen_ids;
	}
	public void setAnlagen_ids(String anlagen_ids)
	{
		this.anlagen_ids = anlagen_ids;
	}
	public String getAnlagen_labels()
	{
		return anlagen_labels;
	}
	public void setAnlagen_labels(String anlagen_labels)
	{
		this.anlagen_labels = anlagen_labels;
	}
	public String getBeschluss()
	{
		return beschluss;
	}
	public void setBeschluss(String beschluss)
	{
		this.beschluss = beschluss;
	}

	public String getExpertenbesuch()
	{
		return expertenbesuch;
	}
	public void setExpertenbesuch(String expertenbesuch)
	{
		this.expertenbesuch = expertenbesuch;
	}
	public String getTeilnahme()
	{
		return teilnahme;
	}
	public void setTeilnahme(String teilnahme)
	{
		this.teilnahme = teilnahme;
	}
	public String getWiederholungsbesuch()
	{
		return wiederholungsbesuch;
	}
	public void setWiederholungsbesuch(String wiederholungsbesuch)
	{
		this.wiederholungsbesuch = wiederholungsbesuch;
	}
	public ComplexList getIntention_anla_liste()
	{
		return intention_anla_liste;
	}
	public void setIntention_anla_liste(ComplexList intention_anla_liste)
	{
		this.intention_anla_liste = intention_anla_liste;
	}
	


}