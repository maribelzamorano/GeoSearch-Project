package com.topdev.tsp.action.modules.school_life.submodules;

import java.util.HashMap;
import java.util.List;

import com.topdev.tsp.action.modules.school_life.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.Template1EntryList;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeTradition;

public class TraditionDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	SchoolLifeTradition		entry;
	List<ComplexEntryList>	entries;
	
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
		entries = getMainObject().getTraditionList().getEntryList();
		entry = (SchoolLifeTradition) getElementById(entries);
		if(entry==null) entry = new SchoolLifeTradition();
		else if(!entry.getId_entity().equals("0"))
			{
			entry.getSub_list1().getEntryList().clear();
			entry.getSub_list2().getEntryList().clear();
			getMainObject().loadDataSublist1(entry, "FJTR", "TRAD");
			getMainObject().loadDataSublist2(entry, "KJTR", "TRAD");
			};
	
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new SchoolLifeTradition(getMaxId(entries));
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
		getMainObject().saveDataTradition(entry);
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
		entry.createClone();
		return SUCCESS;
    }
	

	public String save() throws Exception
	{
		
		
		init("save");
		if(getParameter("id_entity").equals("0") && getElementById(entries)==null)
		{
			entry = new SchoolLifeTradition(getActionParameters());
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
		getMainObject().saveDataTradition(entry);
		setRtErrors(getMainObject().getErrors());
		return "list";
		
		
	}
	
	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}
	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}
	public SchoolLifeTradition getEntry()
	{
		return entry;
	}
	public void setEntry(SchoolLifeTradition entry)
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