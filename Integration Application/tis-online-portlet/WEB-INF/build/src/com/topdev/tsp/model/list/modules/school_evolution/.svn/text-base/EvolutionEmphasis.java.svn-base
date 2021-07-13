package com.topdev.tsp.model.list.modules.school_evolution;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;

public class EvolutionEmphasis extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	String entwicklungsschritt;
	String entwicklungsschritt_code;
	String schwerpunkt;
	String beteiligte;		//kommaseparierte Liste
	String anlagen_labels;
	String anlagen_ids;
	HashMap<String,String> anlagen;

	ComplexList	anla_liste;
	ComplexList	beteiligte_liste;
	public EvolutionEmphasis()								{ initSublists(); 				}
	public EvolutionEmphasis(String id)						{ setId(id); initSublists();	}
	public EvolutionEmphasis(HashMap<String, String> map)	{ setData(map); initSublists();	}

	public void initSublists()
	{
		anla_liste = new ComplexList();
		anla_liste.getHeadingList().add(new ComplexHeading("Dokument"));
		beteiligte_liste = new ComplexList();
		beteiligte_liste.getHeadingList().add(new ComplexHeading("Beteiligte"));
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
	
	public ComplexList getAnla_liste()
	{
		return anla_liste;
	}
	public void setAnla_liste(ComplexList anla_liste)
	{
		this.anla_liste = anla_liste;
	}

	public String getBeteiligte()
	{
		return beteiligte;
	}
	public void setBeteiligte(String beteiligte)
	{
		this.beteiligte = beteiligte;
	}
	public ComplexList getBeteiligte_liste()
	{
		return beteiligte_liste;
	}
	public void setBeteiligte_liste(ComplexList beteiligte_liste)
	{
		this.beteiligte_liste = beteiligte_liste;
	}
	public String getEntwicklungsschritt()
	{
		return entwicklungsschritt;
	}
	public void setEntwicklungsschritt(String entwicklungsschritt)
	{
		this.entwicklungsschritt = entwicklungsschritt;
	}
	public String getEntwicklungsschritt_code()
	{
		return entwicklungsschritt_code;
	}
	public void setEntwicklungsschritt_code(String entwicklungsschritt_code)
	{
		this.entwicklungsschritt_code = entwicklungsschritt_code;
	}
	public String getSchwerpunkt()
	{
		return schwerpunkt;
	}
	public void setSchwerpunkt(String schwerpunkt)
	{
		this.schwerpunkt = schwerpunkt;
	}
	public HashMap getAnlagen()
	{
		return anlagen;
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
	public String getAnlagen_ids()
	{
		return anlagen_ids;
	}
	public void setAnlagen(HashMap<String, String> anlagen)
	{
		this.anlagen = anlagen;
	}

}