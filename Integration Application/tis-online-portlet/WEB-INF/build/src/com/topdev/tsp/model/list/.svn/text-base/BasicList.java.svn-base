package com.topdev.tsp.model.list;

import java.io.Serializable;


public class BasicList implements Cloneable, Serializable
{
	private static final long	serialVersionUID	= 1L;
	private String id			= "0";
	private String id_entity 	= "0";	//DB Entsprechung
	private String deleted		= "0";
	private String modified		= "0";
	private String inserted		= "0";
	private String user;
	private String orgUser;
	private String xpts;

	private String kz_delete	= "1";
	private String kz_edit		= "1";
	private String kz_browse	= "0";
	private String kz_download	= "0";

	@Override 
	public BasicList clone()
	{ 
		try { return (BasicList) super.clone(); } 
		catch ( CloneNotSupportedException e ) { throw new InternalError(); }
	}
	
	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getModified()
	{
		return modified;
	}

	public void setModified(String modified)
	{
		this.modified = modified;
	}

	public String getInserted()
	{
		return inserted;
	}

	public void setInserted(String inserted)
	{
		this.inserted = inserted;
	}
	
	public boolean isInserted()
	{
		if(inserted!=null && inserted.equals("1")) return true;
		return false;
	}
	
	public boolean isModified()
	{
		if(modified!=null && modified.equals("1")) return true;
		return false;
	}

	public boolean isDeleted()
	{
		if(deleted!=null && deleted.equals("1")) return true;
		return false;
	}

	public String getDeleted()
	{
		return deleted;
	}

	public void setDeleted(String deleted)
	{
		this.deleted = deleted;
	}

	public String getUser()
	{
		return user;
	}

	public void setUser(String user)
	{
		this.user = user;
	}

	public String getXpts()
	{
		return xpts;
	}

	public void setXpts(String xpts)
	{
		this.xpts = xpts;
	}

	public String getKz_browse() {
		return kz_browse;
	}

	public void setKz_browse(String kz_browse) {
		this.kz_browse = kz_browse;
	}

	public String getKz_delete() {
		return kz_delete;
	}

	public void setKz_delete(String kz_delete) {
		this.kz_delete = kz_delete;
	}

	public String getKz_download() {
		return kz_download;
	}

	public void setKz_download(String kz_download) {
		this.kz_download = kz_download;
	}

	public String getKz_edit() {
		return kz_edit;
	}

	public void setKz_edit(String kz_edit) {
		this.kz_edit = kz_edit;
	}

	public String getId_entity()
	{
		return id_entity;
	}

	public void setId_entity(String id_entity)
	{
		this.id_entity = id_entity;
	}

	public String getOrgUser()
	{
		return orgUser;
	}

	public void setOrgUser(String orgUser)
	{
		this.orgUser = orgUser;
	}

}