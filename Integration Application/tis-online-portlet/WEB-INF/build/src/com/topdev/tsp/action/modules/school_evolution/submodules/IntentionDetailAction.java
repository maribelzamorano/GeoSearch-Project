package com.topdev.tsp.action.modules.school_evolution.submodules;

import java.io.File;
import java.util.HashMap;

import com.topdev.tsp.action.modules.school_evolution.DetailAction;
import com.topdev.tsp.model.list.complex.Template2EntryList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionIntention;
import com.topdev.tsp.model.view.SchoolSchoolIntention;

public class IntentionDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	EvolutionIntention entry;
	String teilnahme;
	String beschluss;
	String expertenbesuch;
	String wiederholungsbesuch;
	String abschluss;

	String[]	intention_anla_liste_id;
	String[]	intention_anla_liste_id_entity;
	String[]	intention_anla_liste_KZ_IS_DELETED;
	String[]	intention_anla_liste_KZ_IS_MODIFIED;
	String[]	intention_anla_liste_KZ_IS_user;
	String[]	intention_anla_liste_KZ_IS_xpts;
	File[]		intention_anla_liste_datei;
	String[]	intention_anla_liste_dateiFileName;
	String[]	intention_anla_liste_dateiContentType;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		getMainObject().loadDataIntentionSublists();
		entry = getMainObject().getIntention();
	}
	public String edit() throws Exception
    {
		init("edit");
		return SUCCESS;
	}
	public String save() throws Exception
	{
		init("save");
		int ti=0;
		entry.setTeilnahme(teilnahme);
		entry.setBeschluss(beschluss);
		entry.setExpertenbesuch(expertenbesuch);
		entry.setWiederholungsbesuch(wiederholungsbesuch);
		entry.setAbschluss(abschluss);

	   	if(intention_anla_liste_datei!=null)
	   		for(int i=0; i<intention_anla_liste_datei.length; i++)
	   			if(intention_anla_liste_datei[i]==null || intention_anla_liste_datei[i].length()>0 || intention_anla_liste_KZ_IS_DELETED[i].equals("1"))
		{
	   		
	   		Template2EntryList anla = null;
	   		if(intention_anla_liste_KZ_IS_DELETED[i].equals("1"))
	   			anla = (Template2EntryList) entry.getIntention_anla_liste().getElementByEntityId(intention_anla_liste_id_entity[i]);
	   		if(anla==null) anla = new Template2EntryList();

			anla.setDeleted(	intention_anla_liste_KZ_IS_DELETED[i]);
			anla.setModified(	intention_anla_liste_KZ_IS_DELETED[i]);
			anla.setId_entity(	intention_anla_liste_id_entity[i]);
			anla.setId(			intention_anla_liste_id[i]);
			anla.setFile(		intention_anla_liste_datei[i]);
			anla.setFileName(	intention_anla_liste_dateiFileName[i]);

			if(intention_anla_liste_datei[i]!=null)
			{
		   		anla.setBezeichnung(intention_anla_liste_dateiFileName[i]);
		   		anla.setGroesse(String.valueOf(intention_anla_liste_datei[i].length()));
				if(intention_anla_liste_datei[i].length()>0)anla.setModified("1");
			}
	   		if(intention_anla_liste_KZ_IS_DELETED[i].equals("0"))
	   			entry.getIntention_anla_liste().getEntryList().add(anla);

		}
		HashMap<String, String> anlaIds = getMainObject().saveIntention();
//   		if(intention_anla_liste_datei!=null) 
//			if(intention_anla_liste_datei!=null)
//				for(int i=0; i<intention_anla_liste_datei.length; i++)
//		   			if(anlaIds.get(intention_anla_liste_id[i])!=null)
//		   				uploadFile(intention_anla_liste_datei[i], anlaIds.get(intention_anla_liste_id[i]));
		setRtErrors(getMainObject().getErrors());
		getMainObject().loadDataIntention();
		
		//Puffer von inhalt. schwerpunkte leeren
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolSchoolIntention.class),  null);
		return "saved";
	}

	public String getAbschluss()
	{
		return abschluss;
	}

	public void setAbschluss(String abschluss)
	{
		this.abschluss = abschluss;
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
	public EvolutionIntention getEntry()
	{
		return entry;
	}
	public void setEntry(EvolutionIntention entry)
	{
		this.entry = entry;
	}
	public File[] getIntention_anla_liste_datei()
	{
		return intention_anla_liste_datei;
	}
	public void setIntention_anla_liste_datei(File[] intention_anla_liste_datei)
	{
		this.intention_anla_liste_datei = intention_anla_liste_datei;
	}
	public String[] getIntention_anla_liste_dateiContentType()
	{
		return intention_anla_liste_dateiContentType;
	}
	public void setIntention_anla_liste_dateiContentType(
			String[] intention_anla_liste_dateiContentType)
	{
		this.intention_anla_liste_dateiContentType = intention_anla_liste_dateiContentType;
	}
	public String[] getIntention_anla_liste_dateiFileName()
	{
		return intention_anla_liste_dateiFileName;
	}
	public void setIntention_anla_liste_dateiFileName(
			String[] intention_anla_liste_dateiFileName)
	{
		this.intention_anla_liste_dateiFileName = intention_anla_liste_dateiFileName;
	}
	public String[] getIntention_anla_liste_id()
	{
		return intention_anla_liste_id;
	}
	public void setIntention_anla_liste_id(String[] intention_anla_liste_id)
	{
		this.intention_anla_liste_id = intention_anla_liste_id;
	}
	public String[] getIntention_anla_liste_id_entity()
	{
		return intention_anla_liste_id_entity;
	}
	public void setIntention_anla_liste_id_entity(
			String[] intention_anla_liste_id_entity)
	{
		this.intention_anla_liste_id_entity = intention_anla_liste_id_entity;
	}
	public String[] getIntention_anla_liste_KZ_IS_DELETED()
	{
		return intention_anla_liste_KZ_IS_DELETED;
	}
	public void setIntention_anla_liste_KZ_IS_DELETED(
			String[] intention_anla_liste_KZ_IS_DELETED)
	{
		this.intention_anla_liste_KZ_IS_DELETED = intention_anla_liste_KZ_IS_DELETED;
	}
	public String[] getIntention_anla_liste_KZ_IS_MODIFIED()
	{
		return intention_anla_liste_KZ_IS_MODIFIED;
	}
	public void setIntention_anla_liste_KZ_IS_MODIFIED(
			String[] intention_anla_liste_KZ_IS_MODIFIED)
	{
		this.intention_anla_liste_KZ_IS_MODIFIED = intention_anla_liste_KZ_IS_MODIFIED;
	}
	public String[] getIntention_anla_liste_KZ_IS_user()
	{
		return intention_anla_liste_KZ_IS_user;
	}
	public void setIntention_anla_liste_KZ_IS_user(
			String[] intention_anla_liste_KZ_IS_user)
	{
		this.intention_anla_liste_KZ_IS_user = intention_anla_liste_KZ_IS_user;
	}
	public String[] getIntention_anla_liste_KZ_IS_xpts()
	{
		return intention_anla_liste_KZ_IS_xpts;
	}
	public void setIntention_anla_liste_KZ_IS_xpts(
			String[] intention_anla_liste_KZ_IS_xpts)
	{
		this.intention_anla_liste_KZ_IS_xpts = intention_anla_liste_KZ_IS_xpts;
	}
}