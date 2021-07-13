package com.topdev.tsp.action.modules.school_life.submodules;

import java.util.HashMap;
import java.util.List;

import com.topdev.tsp.action.modules.school_life.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeOffer;

public class OfferDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	SchoolLifeOffer entry;
	List<ComplexEntryList> entries;

	String[]	sub_list1_id;
	String[]	sub_list1_id_entity;
	String[]	sub_list1_KZ_IS_DELETED;
	String[]	sub_list1_KZ_IS_MODIFIED;
	String[]	sub_list1_user;
	String[]	sub_list1_xpts;
	String[]	sub_list1_bezeichnung;
	
	String[]	sub_list2_id;
	String[]	sub_list2_id_entity;
	String[]	sub_list2_KZ_IS_DELETED;
	String[]	sub_list2_KZ_IS_MODIFIED;
	String[]	sub_list2_user;
	String[]	sub_list2_xpts;
	String[]	sub_list2_bezeichnung;

	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getOfferList().getEntryList();
		entry = (SchoolLifeOffer) getElementById(entries);
		if(entry==null) entry = new SchoolLifeOffer();
		else if(!entry.getId_entity().equals("0"))
		{
			entry.getSub_list1().getEntryList().clear();
			entry.getSub_list2().getEntryList().clear();
			getMainObject().loadDataSublist1(entry, "FJFO", "FOAN");
			getMainObject().loadDataSublist2(entry, "KJFO", "FOAN");
			};
	}
	
	public String insert() throws Exception
	{
		init("insert");
		entry = new SchoolLifeOffer(getMaxId(entries));
		return SUCCESS;
		
	}
	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}
	
	public String delete() throws Exception
	{
		init("delete");
		entry.setDeleted("1");
		getMainObject().saveDataOffer(entry);
		setRtErrors(getMainObject().getErrors());
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
		//entry.getFach_liste().printIds();
		entry.createClone();
		//entry.getFach_liste().printIds();
		return SUCCESS;
    }
	

	public String save() throws Exception
	{
		init("save");
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new SchoolLifeOffer(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		} else entry.setData(getActionParameters());

		if(sub_list1_id!=null)
			for(int i=0; i<sub_list1_id.length; i++)
				if(sub_list1_bezeichnung[i].trim().length() > 0)
		{
			HashMap<String, String> map = new HashMap<String, String>(sub_list1_id.length);
			map.put("id",			sub_list1_id[i]);
			map.put("id_entity",	sub_list1_id_entity[i]);
			map.put("deleted",		sub_list1_KZ_IS_DELETED[i]);
			map.put("modified",		"1");
			map.put("user",			sub_list1_user[i]);
			map.put("xpts",			sub_list1_xpts[i]);
			map.put("bezeichnung",	sub_list1_bezeichnung[i]);

			if(sub_list1_id_entity[i].equals("0")) entry.getSub_list1().getEntryList().add(new Template1EntryList(map));
			else entry.getSub_list1().getElementByEntityId(sub_list1_id_entity[i]).setData(map);
			
			//Debugging:
			Template1EntryList t = new Template1EntryList(map);
		}
		if(sub_list2_id!=null)
			for(int i=0; i<sub_list2_id.length; i++)
				if(sub_list2_bezeichnung[i].trim().length() > 0)
		{
			HashMap<String, String> map = new HashMap<String, String>(sub_list2_id.length);
			map.put("id",			sub_list2_id[i]);
			map.put("id_entity",	sub_list2_id_entity[i]);
			map.put("deleted",		sub_list2_KZ_IS_DELETED[i]);
			map.put("modified",		"1");
			map.put("user",			sub_list2_user[i]);
			map.put("xpts",			sub_list2_xpts[i]);
			map.put("bezeichnung",	sub_list2_bezeichnung[i]);

			if(sub_list2_id_entity[i].equals("0")) entry.getSub_list2().getEntryList().add(new Template1EntryList(map));
			else entry.getSub_list2().getElementByEntityId(sub_list2_id_entity[i]).setData(map);
			
			//Debugging:
			Template1EntryList t = new Template1EntryList(map);
		}
		
		entry.setModified("1");
		getMainObject().saveDataOffer(entry);
		setRtErrors(getMainObject().getErrors());
		return "list";
	}
	
	/*public String save() throws Exception
	{
		init("save");
		if(entry!=null && entry.getFach_liste()!=null) entry.getFach_liste().printIds();
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new SchoolLifeOffer(getActionParameters());
			entry.setInserted("1");
			entries.add(entry);
		}
		else entry.setData(getActionParameters());
		entry.setModified("1");

		saveTemplate1List(entry.getFach_liste(),			"fach_liste");
		saveTemplate1List(entry.getKlassenstufe_liste(),	"klassenstufe_liste");
		getMainObject().saveDataOffer(entry);
		return "list";
	}
	private void saveTemplate1List(ComplexList sublist, String prefix)
	{
		try
		{
			sublist.printIds();
			HashMap<String, String> map;
			String[] names		= getSpecificParameterNames(prefix);
			String[] ids		= getParameters(prefix+"id");
			String[] entityIds	= getParameters(prefix+"id_entity");
			String[] deletes	= getParameters(prefix+"KZ_IS_DELETED");
			for(int i=0; i<ids.length; i++)
			{
				if(ids[i]!=null && getParameters(prefix+"bezeichnung")[i]!=null && getParameters(prefix+"bezeichnung")[i].trim().length()>0)
				{
					if(deletes[i]!=null && deletes[i].equals("0"))
					{
						map = new HashMap<String, String>(5);
						for(int n=0; n<names.length; n++) map.put(names[n],	getParameters(prefix+names[n])[i]);
						map.put("id", ids[i].equals("0")?sublist.getNextId():ids[i]);
						map.put("modified", "1");
						if(ids[i].equals("0")) map.put("id_entity", "0");
						sublist.printIds();
						if(ids[i].equals("0"))	sublist.getEntryList().add(new Template1EntryList(map));
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
		
	}*/

	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}

	public SchoolLifeOffer getEntry()
	{
		return entry;
	}

	public void setEntry(SchoolLifeOffer entry)
	{
		this.entry = entry;
	}

	public String[] getSub_list1_bezeichnung() {
		return sub_list1_bezeichnung;
	}

	public void setSub_list1_bezeichnung(String[] sub_list1_bezeichnung) {
		this.sub_list1_bezeichnung = sub_list1_bezeichnung;
	}

	public String[] getSub_list1_id() {
		return sub_list1_id;
	}

	public void setSub_list1_id(String[] sub_list1_id) {
		this.sub_list1_id = sub_list1_id;
	}

	public String[] getSub_list1_id_entity() {
		return sub_list1_id_entity;
	}

	public void setSub_list1_id_entity(String[] sub_list1_id_entity) {
		this.sub_list1_id_entity = sub_list1_id_entity;
	}

	public String[] getSub_list1_KZ_IS_DELETED() {
		return sub_list1_KZ_IS_DELETED;
	}

	public void setSub_list1_KZ_IS_DELETED(String[] sub_list1_KZ_IS_DELETED) {
		this.sub_list1_KZ_IS_DELETED = sub_list1_KZ_IS_DELETED;
	}

	public String[] getSub_list1_KZ_IS_MODIFIED() {
		return sub_list1_KZ_IS_MODIFIED;
	}

	public void setSub_list1_KZ_IS_MODIFIED(String[] sub_list1_KZ_IS_MODIFIED) {
		this.sub_list1_KZ_IS_MODIFIED = sub_list1_KZ_IS_MODIFIED;
	}

	public String[] getSub_list1_user() {
		return sub_list1_user;
	}

	public void setSub_list1_user(String[] sub_list1_user) {
		this.sub_list1_user = sub_list1_user;
	}

	public String[] getSub_list1_xpts() {
		return sub_list1_xpts;
	}

	public void setSub_list1_xpts(String[] sub_list1_xpts) {
		this.sub_list1_xpts = sub_list1_xpts;
	}



	public String[] getSub_list2_bezeichnung() {
		return sub_list2_bezeichnung;
	}

	public void setSub_list2_bezeichnung(String[] sub_list2_bezeichnung) {
		this.sub_list2_bezeichnung = sub_list2_bezeichnung;
	}

	public String[] getSub_list2_id() {
		return sub_list2_id;
	}

	public void setSub_list2_id(String[] sub_list2_id) {
		this.sub_list2_id = sub_list2_id;
	}

	public String[] getSub_list2_id_entity() {
		return sub_list2_id_entity;
	}

	public void setSub_list2_id_entity(String[] sub_list2_id_entity) {
		this.sub_list2_id_entity = sub_list2_id_entity;
	}

	public String[] getSub_list2_KZ_IS_DELETED() {
		return sub_list2_KZ_IS_DELETED;
	}

	public void setSub_list2_KZ_IS_DELETED(String[] sub_list2_KZ_IS_DELETED) {
		this.sub_list2_KZ_IS_DELETED = sub_list2_KZ_IS_DELETED;
	}

	public String[] getSub_list2_KZ_IS_MODIFIED() {
		return sub_list2_KZ_IS_MODIFIED;
	}

	public void setSub_list2_KZ_IS_MODIFIED(String[] sub_list2_KZ_IS_MODIFIED) {
		this.sub_list2_KZ_IS_MODIFIED = sub_list2_KZ_IS_MODIFIED;
	}

	public String[] getSub_list2_user() {
		return sub_list2_user;
	}

	public void setSub_list2_user(String[] sub_list2_user) {
		this.sub_list2_user = sub_list2_user;
	}

	public String[] getSub_list2_xpts() {
		return sub_list2_xpts;
	}

	public void setSub_list2_xpts(String[] sub_list2_xpts) {
		this.sub_list2_xpts = sub_list2_xpts;
	}

	



}