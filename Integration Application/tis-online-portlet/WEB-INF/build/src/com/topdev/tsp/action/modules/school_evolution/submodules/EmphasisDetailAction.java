package com.topdev.tsp.action.modules.school_evolution.submodules;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import com.opensymphony.xwork2.ValidationAware;
import com.topdev.tsp.action.modules.school_evolution.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.complex.Template2EntryList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionEmphasis;

public class EmphasisDetailAction extends DetailAction implements ValidationAware
{
	private static final long	serialVersionUID	= 1L;
	EvolutionEmphasis entry;
	List<ComplexEntryList> entries;
	String[]	bezeichnung_code;

	String[]	anla_liste_id;
	String[]	anla_liste_id_entity;
	String[]	anla_liste_KZ_IS_DELETED;
	String[]	anla_liste_KZ_IS_MODIFIED;
	String[]	anla_liste_KZ_IS_user;
	String[]	anla_liste_KZ_IS_xpts;
	File[]		anla_liste_datei;
	String[]	anla_liste_dateiFileName;
	String[]	anla_liste_dateiContentType;
	
	String[]	beteiligte_liste_id;
	String[]	beteiligte_liste_id_entity;
	String[]	beteiligte_liste_KZ_IS_DELETED;
	String[]	beteiligte_liste_KZ_IS_MODIFIED;
	String[]	beteiligte_liste_user;
	String[]	beteiligte_liste_xpts;
	String[]	beteiligte_liste_bezeichnung;
	
	String		entwicklungsschritt;
	String		entwicklungsschritt_code;
	String		schwerpunkt;
	String		id_entity;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries	= getMainObject().getEmphasisList().getEntryList();
		entry	= (EvolutionEmphasis) getElementById(entries);
		if(entry==null) entry = new EvolutionEmphasis();
		else if(!entry.getId_entity().equals("0"))
			getMainObject().loadDataEmphasisSublists(entry);
	}

	public String insert() throws Exception
	{
		init("insert");
		entry = new EvolutionEmphasis(getMaxId(entries));
		return SUCCESS;
	}
	public String delete() throws Exception
	{
		init("delete");
		entry.setDeleted("1");
		getMainObject().saveEmphasis(getPrincipal().getLoginId(), entry);
		setRtErrors(getMainObject().getErrors());
		entries.remove(entry);
		getMainObject().loadDataEmphasis();
		return "list";
	}
	public String undo() throws Exception
	{
		init("undo");
		if(entry.getId_entity().equals("0")) entries.remove(entry);
		else entry.reset();
		return "list";
	}
	public String edit() throws Exception
    {
		init("edit");
		entry.createClone();
		return SUCCESS;
	}
	

	public String save() throws Exception
	{
		init("save");
		getMainObject().clearErrors();
		if(getId_entity()==null)
		{
			getMainObject().getErrors().add("Die Formulardaten wurden unvollständig übertragen. Bitte wiederholen Sie den Vorgang.");
			setRtErrors(getMainObject().getErrors());
			return "saved";
		}
				
		getMainObject().clearErrors();
		if(anla_liste_datei!=null && anla_liste_datei.length>1)
			getRtErrors().addAll( checkUploadedFiles(anla_liste_datei, anla_liste_dateiFileName) );
		if(getRtErrors().size()>0) return "saved";

		HashMap<String,String> form = new HashMap<String, String>(10);
		form.put("entwicklungsschritt",			entwicklungsschritt);
		form.put("entwicklungsschritt_code",	entwicklungsschritt_code);
		form.put("schwerpunkt",					schwerpunkt);
		
		
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new EvolutionEmphasis(form);
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(form);

		if(beteiligte_liste_id!=null)
			for(int i=0; i<beteiligte_liste_id.length; i++)
				if(beteiligte_liste_bezeichnung[i].trim().length() > 0)
		{
			HashMap<String, String> map = new HashMap<String, String>(beteiligte_liste_id.length);
			map.put("id",			beteiligte_liste_id[i]);
			map.put("id_entity",	beteiligte_liste_id_entity[i]);
			map.put("deleted",		beteiligte_liste_KZ_IS_DELETED[i]);
			map.put("modified",		"1");
			map.put("user",			beteiligte_liste_user[i]);
			map.put("xpts",			beteiligte_liste_xpts[i]);
			map.put("bezeichnung",	beteiligte_liste_bezeichnung[i]);

			if(beteiligte_liste_id_entity[i].equals("0")) entry.getBeteiligte_liste().getEntryList().add(new Template1EntryList(map));
			else entry.getBeteiligte_liste().getElementByEntityId(beteiligte_liste_id_entity[i]).setData(map);
			
		}
		
	   	if(anla_liste_datei!=null)
	   		for(int i=0; i<anla_liste_datei.length; i++)
	   			if(anla_liste_datei[i]==null || anla_liste_datei[i].length()>0 || anla_liste_KZ_IS_DELETED[i].equals("1"))
		{
	   		Template2EntryList anla = null;
	   		if(anla_liste_KZ_IS_DELETED[i].equals("1"))
	   			anla = (Template2EntryList) entry.getAnla_liste().getElementByEntityId(anla_liste_id_entity[i]);
	   		if(anla==null) anla = new Template2EntryList();

			anla.setDeleted(	anla_liste_KZ_IS_DELETED[i]);
			anla.setModified(	anla_liste_KZ_IS_DELETED[i]);
			anla.setId_entity(	anla_liste_id_entity[i]);
			anla.setId(			anla_liste_id[i]);
			anla.setFile(		anla_liste_datei[i]);
			anla.setFileName(	anla_liste_dateiFileName[i]);

			if(anla_liste_datei[i]!=null)
			{
		   		anla.setBezeichnung(anla_liste_dateiFileName[i]);
		   		anla.setGroesse(String.valueOf(anla_liste_datei[i].length()));
				if(anla_liste_datei[i].length()>0)anla.setModified("1");
			}
	   		if(anla_liste_KZ_IS_DELETED[i].equals("0"))
	   			entry.getAnla_liste().getEntryList().add(anla);
		}
		HashMap<String, String> anlaIds = getMainObject().saveEmphasis(getPrincipal().getLoginId(), entry);
   		//if(anla_liste_datei!=null) 
   		//	for(int i=0; i<anla_liste_datei.length; i++)
   		//		if(anlaIds.get(anla_liste_id[i])!=null)
   		//			uploadFile(anla_liste_datei[i], anlaIds.get(anla_liste_id[i]));
		setRtErrors(getMainObject().getErrors());
		getMainObject().loadDataEmphasis();
		return "saved";
	}


	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}

	public EvolutionEmphasis getEntry()
	{
		return entry;
	}

	public void setEntry(EvolutionEmphasis entry)
	{
		this.entry = entry;
	}

	public String[] getBezeichnung_code()
	{
		return bezeichnung_code;
	}

	public void setBezeichnung_code(String[] bezeichnung_code)
	{
		this.bezeichnung_code = bezeichnung_code;
	}

	public String[] getBeteiligte_liste_id()
	{
		return beteiligte_liste_id;
	}

	public void setBeteiligte_liste_id(String[] beteiligte_liste_id)
	{
		this.beteiligte_liste_id = beteiligte_liste_id;
	}

	public String[] getBeteiligte_liste_id_entity()
	{
		return beteiligte_liste_id_entity;
	}

	public void setBeteiligte_liste_id_entity(String[] beteiligte_liste_id_entity)
	{
		this.beteiligte_liste_id_entity = beteiligte_liste_id_entity;
	}

	public String[] getBeteiligte_liste_KZ_IS_DELETED()
	{
		return beteiligte_liste_KZ_IS_DELETED;
	}

	public void setBeteiligte_liste_KZ_IS_DELETED(
			String[] beteiligte_liste_KZ_IS_DELETED)
	{
		this.beteiligte_liste_KZ_IS_DELETED = beteiligte_liste_KZ_IS_DELETED;
	}

	public String[] getBeteiligte_liste_KZ_IS_MODIFIED()
	{
		return beteiligte_liste_KZ_IS_MODIFIED;
	}

	public void setBeteiligte_liste_KZ_IS_MODIFIED(
			String[] beteiligte_liste_KZ_IS_MODIFIED)
	{
		this.beteiligte_liste_KZ_IS_MODIFIED = beteiligte_liste_KZ_IS_MODIFIED;
	}

	public String[] getBeteiligte_liste_user()
	{
		return beteiligte_liste_user;
	}

	public void setBeteiligte_liste_user(String[] beteiligte_liste_user)
	{
		this.beteiligte_liste_user = beteiligte_liste_user;
	}

	public String[] getBeteiligte_liste_xpts()
	{
		return beteiligte_liste_xpts;
	}

	public void setBeteiligte_liste_xpts(String[] beteiligte_liste_xpts)
	{
		this.beteiligte_liste_xpts = beteiligte_liste_xpts;
	}

	public String[] getBeteiligte_liste_bezeichnung()
	{
		return beteiligte_liste_bezeichnung;
	}

	public void setBeteiligte_liste_bezeichnung(
			String[] beteiligte_liste_bezeichnung)
	{
		this.beteiligte_liste_bezeichnung = beteiligte_liste_bezeichnung;
	}

	public File[] getAnla_liste_datei()
	{
		return anla_liste_datei;
	}

	public void setAnla_liste_datei(File[] anla_liste_datei)
	{
		this.anla_liste_datei = anla_liste_datei;
	}

	public String[] getAnla_liste_dateiContentType()
	{
		return anla_liste_dateiContentType;
	}

	public void setAnla_liste_dateiContentType(String[] anla_liste_dateiContentType)
	{
		this.anla_liste_dateiContentType = anla_liste_dateiContentType;
	}

	public String[] getAnla_liste_dateiFileName()
	{
		return anla_liste_dateiFileName;
	}

	public void setAnla_liste_dateiFileName(String[] anla_liste_dateiFileName)
	{
		this.anla_liste_dateiFileName = anla_liste_dateiFileName;
	}

	public String[] getAnla_liste_id()
	{
		return anla_liste_id;
	}

	public void setAnla_liste_id(String[] anla_liste_id)
	{
		this.anla_liste_id = anla_liste_id;
	}

	public String[] getAnla_liste_id_entity()
	{
		return anla_liste_id_entity;
	}

	public void setAnla_liste_id_entity(String[] anla_liste_id_entity)
	{
		this.anla_liste_id_entity = anla_liste_id_entity;
	}

	public String[] getAnla_liste_KZ_IS_DELETED()
	{
		return anla_liste_KZ_IS_DELETED;
	}

	public void setAnla_liste_KZ_IS_DELETED(String[] anla_liste_KZ_IS_DELETED)
	{
		this.anla_liste_KZ_IS_DELETED = anla_liste_KZ_IS_DELETED;
	}

	public String[] getAnla_liste_KZ_IS_MODIFIED()
	{
		return anla_liste_KZ_IS_MODIFIED;
	}

	public void setAnla_liste_KZ_IS_MODIFIED(String[] anla_liste_KZ_IS_MODIFIED)
	{
		this.anla_liste_KZ_IS_MODIFIED = anla_liste_KZ_IS_MODIFIED;
	}

	public String[] getAnla_liste_KZ_IS_user()
	{
		return anla_liste_KZ_IS_user;
	}

	public void setAnla_liste_KZ_IS_user(String[] anla_liste_KZ_IS_user)
	{
		this.anla_liste_KZ_IS_user = anla_liste_KZ_IS_user;
	}

	public String[] getAnla_liste_KZ_IS_xpts()
	{
		return anla_liste_KZ_IS_xpts;
	}

	public void setAnla_liste_KZ_IS_xpts(String[] anla_liste_KZ_IS_xpts)
	{
		this.anla_liste_KZ_IS_xpts = anla_liste_KZ_IS_xpts;
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

	public String getId_entity()
	{
		return id_entity;
	}

	public void setId_entity(String id_entity)
	{
		this.id_entity = id_entity;
	}

}