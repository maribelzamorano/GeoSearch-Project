package com.topdev.tsp.action.modules.school_evolution.submodules;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import com.topdev.tsp.action.modules.school_evolution.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.complex.Template2EntryList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionInstrument;

public class InstrumentDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	EvolutionInstrument entry;
	List<ComplexEntryList> entries;
	String[]	bezeichnung_code;
	String		id_entity;
	String[]	instrument_anla_liste_id;
	String[]	instrument_anla_liste_id_entity;
	String[]	instrument_anla_liste_KZ_IS_DELETED;
	String[]	instrument_anla_liste_KZ_IS_MODIFIED;
	String[]	instrument_anla_liste_KZ_IS_user;
	String[]	instrument_anla_liste_KZ_IS_xpts;
	File[]		instrument_anla_liste_datei;
	String[]	instrument_anla_liste_dateiFileName;
	String[]	instrument_anla_liste_dateiContentType;
	
	String[]	instrument_beteiligte_liste_id;
	String[]	instrument_beteiligte_liste_id_entity;
	String[]	instrument_beteiligte_liste_KZ_IS_DELETED;
	String[]	instrument_beteiligte_liste_KZ_IS_MODIFIED;
	String[]	instrument_beteiligte_liste_user;
	String[]	instrument_beteiligte_liste_xpts;
	String[]	instrument_beteiligte_liste_bezeichnung;
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries	= getMainObject().getInstrumentList().getEntryList();
		entry	= (EvolutionInstrument) getElementById(entries);
		if(entry==null) entry = new EvolutionInstrument();
		else if(!entry.getId_entity().equals("0"))
			getMainObject().loadDataInstrumentSublists(entry);
	}

	public String insert() throws Exception
	{
		init("insert");
		entry = new EvolutionInstrument(getMaxId(entries));
		return SUCCESS;
	}
	public String delete() throws Exception
	{
		init("delete");
		entry.setDeleted("1");
		getMainObject().saveInstrument(getPrincipal().getLoginId(), entry);
		setRtErrors(getMainObject().getErrors());
		entries.remove(entry);
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
		if(instrument_anla_liste_datei!=null && instrument_anla_liste_datei.length>1)
			getRtErrors().addAll( checkUploadedFiles(instrument_anla_liste_datei, instrument_anla_liste_dateiFileName) );
		if(getRtErrors().size()>0) return "saved";

		
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new EvolutionInstrument(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		} else entry.setData(getActionParameters());

		if(instrument_beteiligte_liste_id!=null)
			for(int i=0; i<instrument_beteiligte_liste_id.length; i++)
				if(instrument_beteiligte_liste_bezeichnung[i].trim().length() > 0)
		{
			HashMap<String, String> map = new HashMap<String, String>(instrument_beteiligte_liste_id.length);
			map.put("id",			instrument_beteiligte_liste_id[i]);
			map.put("id_entity",	instrument_beteiligte_liste_id_entity[i]);
			map.put("deleted",		instrument_beteiligte_liste_KZ_IS_DELETED[i]);
			map.put("modified",		"1");
			map.put("user",			instrument_beteiligte_liste_user[i]);
			map.put("xpts",			instrument_beteiligte_liste_xpts[i]);
			map.put("bezeichnung",	instrument_beteiligte_liste_bezeichnung[i]);

			if(instrument_beteiligte_liste_id_entity[i].equals("0")) entry.getInstrument_beteiligte_liste().getEntryList().add(new Template1EntryList(map));
			else entry.getInstrument_beteiligte_liste().getElementByEntityId(instrument_beteiligte_liste_id_entity[i]).setData(map);
			
			//Debugging:
			Template1EntryList t = new Template1EntryList(map);
		}
		
	   	if(instrument_anla_liste_datei!=null)
	   		for(int i=0; i<instrument_anla_liste_datei.length; i++)
	   			if(instrument_anla_liste_datei[i]==null || instrument_anla_liste_datei[i].length()>0 || instrument_anla_liste_KZ_IS_DELETED[i].equals("1"))
		{
	   		
	   		Template2EntryList anla = null;
	   		if(instrument_anla_liste_KZ_IS_DELETED[i].equals("1"))
	   			anla = (Template2EntryList) entry.getInstrument_anla_liste().getElementByEntityId(instrument_anla_liste_id_entity[i]);
	   		if(anla==null) anla = new Template2EntryList();

			anla.setDeleted(	instrument_anla_liste_KZ_IS_DELETED[i]);
			anla.setModified(	instrument_anla_liste_KZ_IS_DELETED[i]);
			anla.setId_entity(	instrument_anla_liste_id_entity[i]);
			anla.setId(			instrument_anla_liste_id[i]);
			anla.setFile(		instrument_anla_liste_datei[i]);
			anla.setFileName(	instrument_anla_liste_dateiFileName[i]);

			if(instrument_anla_liste_datei[i]!=null)
			{
		   		anla.setBezeichnung(instrument_anla_liste_dateiFileName[i]);
		   		anla.setGroesse(String.valueOf(instrument_anla_liste_datei[i].length()));
				if(instrument_anla_liste_datei[i].length()>0)anla.setModified("1");
			}
	   		if(instrument_anla_liste_KZ_IS_DELETED[i].equals("0"))
	   			entry.getInstrument_anla_liste().getEntryList().add(anla);

		}
		HashMap<String, String> anlaIds = getMainObject().saveInstrument(getPrincipal().getLoginId(), entry);
		/*
   		if(instrument_anla_liste_datei!=null) 
	   		for(int i=0; i<instrument_anla_liste_datei.length; i++)
	   			if(anlaIds.get(instrument_anla_liste_id[i])!=null)
	   				uploadFile(instrument_anla_liste_datei[i], anlaIds.get(instrument_anla_liste_id[i]));
	   	*/
		setRtErrors(getMainObject().getErrors());
		getMainObject().loadDataInstrument();
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
	public String[] getBezeichnung_code()
	{
		return bezeichnung_code;
	}

	public void setBezeichnung_code(String[] bezeichnung_code)
	{
		this.bezeichnung_code = bezeichnung_code;
	}

	public EvolutionInstrument getEntry()
	{
		return entry;
	}

	public void setEntry(EvolutionInstrument entry)
	{
		this.entry = entry;
	}

	public File[] getInstrument_anla_liste_datei()
	{
		return instrument_anla_liste_datei;
	}

	public void setInstrument_anla_liste_datei(File[] instrument_anla_liste_datei)
	{
		this.instrument_anla_liste_datei = instrument_anla_liste_datei;
	}

	public String[] getInstrument_anla_liste_dateiContentType()
	{
		return instrument_anla_liste_dateiContentType;
	}

	public void setInstrument_anla_liste_dateiContentType(
			String[] instrument_anla_liste_dateiContentType)
	{
		this.instrument_anla_liste_dateiContentType = instrument_anla_liste_dateiContentType;
	}

	public String[] getInstrument_anla_liste_dateiFileName()
	{
		return instrument_anla_liste_dateiFileName;
	}

	public void setInstrument_anla_liste_dateiFileName(
			String[] instrument_anla_liste_dateiFileName)
	{
		this.instrument_anla_liste_dateiFileName = instrument_anla_liste_dateiFileName;
	}

	public String[] getInstrument_anla_liste_id()
	{
		return instrument_anla_liste_id;
	}

	public void setInstrument_anla_liste_id(String[] instrument_anla_liste_id)
	{
		this.instrument_anla_liste_id = instrument_anla_liste_id;
	}

	public String[] getInstrument_anla_liste_id_entity()
	{
		return instrument_anla_liste_id_entity;
	}

	public void setInstrument_anla_liste_id_entity(
			String[] instrument_anla_liste_id_entity)
	{
		this.instrument_anla_liste_id_entity = instrument_anla_liste_id_entity;
	}

	public String[] getInstrument_anla_liste_KZ_IS_DELETED()
	{
		return instrument_anla_liste_KZ_IS_DELETED;
	}

	public void setInstrument_anla_liste_KZ_IS_DELETED(
			String[] instrument_anla_liste_KZ_IS_DELETED)
	{
		this.instrument_anla_liste_KZ_IS_DELETED = instrument_anla_liste_KZ_IS_DELETED;
	}

	public String[] getInstrument_anla_liste_KZ_IS_MODIFIED()
	{
		return instrument_anla_liste_KZ_IS_MODIFIED;
	}

	public void setInstrument_anla_liste_KZ_IS_MODIFIED(
			String[] instrument_anla_liste_KZ_IS_MODIFIED)
	{
		this.instrument_anla_liste_KZ_IS_MODIFIED = instrument_anla_liste_KZ_IS_MODIFIED;
	}

	public String[] getInstrument_anla_liste_KZ_IS_user()
	{
		return instrument_anla_liste_KZ_IS_user;
	}

	public void setInstrument_anla_liste_KZ_IS_user(
			String[] instrument_anla_liste_KZ_IS_user)
	{
		this.instrument_anla_liste_KZ_IS_user = instrument_anla_liste_KZ_IS_user;
	}

	public String[] getInstrument_anla_liste_KZ_IS_xpts()
	{
		return instrument_anla_liste_KZ_IS_xpts;
	}

	public void setInstrument_anla_liste_KZ_IS_xpts(
			String[] instrument_anla_liste_KZ_IS_xpts)
	{
		this.instrument_anla_liste_KZ_IS_xpts = instrument_anla_liste_KZ_IS_xpts;
	}

	public String[] getInstrument_beteiligte_liste_bezeichnung()
	{
		return instrument_beteiligte_liste_bezeichnung;
	}

	public void setInstrument_beteiligte_liste_bezeichnung(
			String[] instrument_beteiligte_liste_bezeichnung)
	{
		this.instrument_beteiligte_liste_bezeichnung = instrument_beteiligte_liste_bezeichnung;
	}

	public String[] getInstrument_beteiligte_liste_id()
	{
		return instrument_beteiligte_liste_id;
	}

	public void setInstrument_beteiligte_liste_id(
			String[] instrument_beteiligte_liste_id)
	{
		this.instrument_beteiligte_liste_id = instrument_beteiligte_liste_id;
	}

	public String[] getInstrument_beteiligte_liste_id_entity()
	{
		return instrument_beteiligte_liste_id_entity;
	}

	public void setInstrument_beteiligte_liste_id_entity(
			String[] instrument_beteiligte_liste_id_entity)
	{
		this.instrument_beteiligte_liste_id_entity = instrument_beteiligte_liste_id_entity;
	}

	public String[] getInstrument_beteiligte_liste_KZ_IS_DELETED()
	{
		return instrument_beteiligte_liste_KZ_IS_DELETED;
	}

	public void setInstrument_beteiligte_liste_KZ_IS_DELETED(
			String[] instrument_beteiligte_liste_KZ_IS_DELETED)
	{
		this.instrument_beteiligte_liste_KZ_IS_DELETED = instrument_beteiligte_liste_KZ_IS_DELETED;
	}

	public String[] getInstrument_beteiligte_liste_KZ_IS_MODIFIED()
	{
		return instrument_beteiligte_liste_KZ_IS_MODIFIED;
	}

	public void setInstrument_beteiligte_liste_KZ_IS_MODIFIED(
			String[] instrument_beteiligte_liste_KZ_IS_MODIFIED)
	{
		this.instrument_beteiligte_liste_KZ_IS_MODIFIED = instrument_beteiligte_liste_KZ_IS_MODIFIED;
	}

	public String[] getInstrument_beteiligte_liste_user()
	{
		return instrument_beteiligte_liste_user;
	}

	public void setInstrument_beteiligte_liste_user(
			String[] instrument_beteiligte_liste_user)
	{
		this.instrument_beteiligte_liste_user = instrument_beteiligte_liste_user;
	}

	public String[] getInstrument_beteiligte_liste_xpts()
	{
		return instrument_beteiligte_liste_xpts;
	}

	public void setInstrument_beteiligte_liste_xpts(
			String[] instrument_beteiligte_liste_xpts)
	{
		this.instrument_beteiligte_liste_xpts = instrument_beteiligte_liste_xpts;
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