package com.topdev.tsp.action.modules.documents.submodules;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import com.topdev.aa.lib.Validator;
import com.topdev.tsp.action.modules.documents.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.complex.Template3EntryList;
import com.topdev.tsp.model.list.modules.documents.Documents;
import com.topdev.tsp.model.view.SchoolDocuments;

public class DocumentDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	Documents	entry;
	List<ComplexEntryList> entries;
	
	File	dokument;
	String	dokumentFileName;
	String	dokumentContentType;
	
	String[]	gruppen_liste_id;
	String[]	gruppen_liste_id_entity;
	String[]	gruppen_liste_KZ_IS_DELETED;
	String[]	gruppen_liste_KZ_IS_MODIFIED;
	String[]	gruppen_liste_user;
	String[]	gruppen_liste_xpts;
	String[]	gruppen_liste_code;
	String[]	gruppen_liste_decode;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getDocumentList().getEntryList();

		entry	= (Documents) getElementById(entries);
		if(entry==null) entry = new Documents(1);
		else if(!entry.getId_entity().equals("0"))
			getMainObject().loadDataDocumentSublists(entry);

	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new Documents(getMaxId(entries), 1);
		return SUCCESS;
	}
	public String delete() throws Exception
	{
		init("delete");
		entry.createClone();
		entry.setDeleted("1");
		System.out.println("usernamedelet:"+getUserName());
		getMainObject().deleteAnla(entry, getUserName());
		if(getMainObject().getErrors().size()<1)
			getMainObject().getDocumentList().getEntryList().remove(entry);
		else setRtErrors(getMainObject().getErrors());
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
		return SUCCESS;
    }


	public String save() throws Exception
	{
		init("save");
		getMainObject().clearErrors();
		if(Validator.empty(entry.getId_entity()) || "0".equals(entry.getId_entity()))
		{
			getRtErrors().addAll( checkUploadedFiles(new File[]{getDokument()}, new String[]{getDokumentFileName()}) );
			if(getRtErrors().size()>0) return "saved";
		}
		
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			HashMap<String, String> map = getActionParameters();
			entry = new Documents(map, 1);
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");
		
		if(gruppen_liste_id!=null)
			for(int i=0; i<gruppen_liste_id.length; i++)
				if(gruppen_liste_code[i].trim().length() > 0)
		{
			HashMap<String, String> map = new HashMap<String, String>(gruppen_liste_id.length);
			map.put("id",			gruppen_liste_id[i]);
			map.put("id_entity",	gruppen_liste_id_entity[i]);
			map.put("deleted",		gruppen_liste_KZ_IS_DELETED[i]);
			map.put("modified",		"1");
			map.put("user",			gruppen_liste_user[i]);
			map.put("xpts",			gruppen_liste_xpts[i]);
			map.put("code",			gruppen_liste_code[i]);

			if(gruppen_liste_id_entity[i].equals("0")) entry.getGruppen_liste().getEntryList().add(new Template3EntryList(map));
			else entry.getGruppen_liste().getElementByEntityId(gruppen_liste_id_entity[i]).setData(map);
			
			//Debugging:
			Template3EntryList t = new Template3EntryList(map);
		}
		if(dokument!=null)
		{
			entry.setDokumentFileName(dokumentFileName);
			entry.setGroesse(String.valueOf(dokument.length()));
		}
		((SchoolDocuments)getMainObject()).saveAnla(getPrincipal().getLoginId(), entry, dokument);
		if(getMainObject().getErrors().size()>0)
			setRtErrors(getMainObject().getErrors());
		else
		{
			getMainObject().loadData();
			//uploadFile(dokument, entry.getId_entity());
		}
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".overview",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".personal_resources",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".neuter_resources",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".school_evolution",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".contributer",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".school_life",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".learner_structure",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class)+".cooperation",  null);
		getSessionBean().setAttribute(getSessionId(), getObjectName(SchoolDocuments.class),  null);

		return "saved";
	}
	
	private void saveTemplate3List(ComplexList sublist, String prefix)
	{
		try
		{
			sublist.printIds();
			HashMap<String, String> map;
			String[] names		= getSpecificParameterNames(prefix);
			String[] ids		= getParameters(prefix+"_id");
			String[] entityIds	= getParameters(prefix+"_id_entity");
			String[] deletes	= getParameters(prefix+"_KZ_IS_DELETED");
			for(int i=0; i<ids.length; i++)
			{
				if(ids[i]!=null && getParameters(prefix+"_code")[i]!=null && getParameters(prefix+"_code")[i].trim().length()>0)
				{
					if(deletes[i]!=null && deletes[i].equals("0"))
					{
						map = new HashMap<String, String>(5);
						for(int n=0; n<names.length; n++) map.put(names[n],	getParameters(prefix+names[n])[i]);
						map.put("id", ids[i].equals("0")?sublist.getNextId():ids[i]);
						map.put("modified", "1");
						if(ids[i].equals("0")) map.put("id_entity", "0");
						sublist.printIds();
						if(ids[i].equals("0"))	sublist.getEntryList().add(new Template3EntryList(map));
						else					sublist.getElementById(ids[i]).setData(map);
						sublist.printIds();
					}
					else
					{
						if(ids[i].equals("0")) sublist.removeElementByEntityId(entityIds[i]);
						sublist.getElementByEntityId(entityIds[i]).setDeleted("1");
					}

				}
				sublist.printIds();
 			}
		}
		catch(Exception e) { log.error("Fehler beim Speichern einer Unterliste: "+e.getLocalizedMessage()); e.printStackTrace(); }
		
	}
	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}
	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}
	public File getDokument()
	{
		return dokument;
	}
	public void setDokument(File dokument)
	{
		this.dokument = dokument;
	}
	public String getDokumentContentType()
	{
		return dokumentContentType;
	}
	public void setDokumentContentType(String dokumentContentType)
	{
		this.dokumentContentType = dokumentContentType;
	}
	public String getDokumentFileName()
	{
		return dokumentFileName;
	}
	public void setDokumentFileName(String dokumentFileName)
	{
		this.dokumentFileName = dokumentFileName;
	}
	public Documents getEntry()
	{
		return entry;
	}
	public void setEntry(Documents entry)
	{
		this.entry = entry;
	}
	public String[] getGruppen_liste_code()
	{
		return gruppen_liste_code;
	}
	public void setGruppen_liste_code(String[] gruppen_liste_code)
	{
		this.gruppen_liste_code = gruppen_liste_code;
	}
	public String[] getGruppen_liste_decode()
	{
		return gruppen_liste_decode;
	}
	public void setGruppen_liste_decode(String[] gruppen_liste_decode)
	{
		this.gruppen_liste_decode = gruppen_liste_decode;
	}
	public String[] getGruppen_liste_id()
	{
		return gruppen_liste_id;
	}
	public void setGruppen_liste_id(String[] gruppen_liste_id)
	{
		this.gruppen_liste_id = gruppen_liste_id;
	}
	public String[] getGruppen_liste_id_entity()
	{
		return gruppen_liste_id_entity;
	}
	public void setGruppen_liste_id_entity(String[] gruppen_liste_id_entity)
	{
		this.gruppen_liste_id_entity = gruppen_liste_id_entity;
	}
	public String[] getGruppen_liste_KZ_IS_DELETED()
	{
		return gruppen_liste_KZ_IS_DELETED;
	}
	public void setGruppen_liste_KZ_IS_DELETED(String[] gruppen_liste_KZ_IS_DELETED)
	{
		this.gruppen_liste_KZ_IS_DELETED = gruppen_liste_KZ_IS_DELETED;
	}
	public String[] getGruppen_liste_KZ_IS_MODIFIED()
	{
		return gruppen_liste_KZ_IS_MODIFIED;
	}
	public void setGruppen_liste_KZ_IS_MODIFIED(
			String[] gruppen_liste_KZ_IS_MODIFIED)
	{
		this.gruppen_liste_KZ_IS_MODIFIED = gruppen_liste_KZ_IS_MODIFIED;
	}
	public String[] getGruppen_liste_user()
	{
		return gruppen_liste_user;
	}
	public void setGruppen_liste_user(String[] gruppen_liste_user)
	{
		this.gruppen_liste_user = gruppen_liste_user;
	}
	public String[] getGruppen_liste_xpts()
	{
		return gruppen_liste_xpts;
	}
	public void setGruppen_liste_xpts(String[] gruppen_liste_xpts)
	{
		this.gruppen_liste_xpts = gruppen_liste_xpts;
	}
}