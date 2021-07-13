package com.topdev.tsp.action.modules.businesspartner.submodules;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.topdev.aa.lib.ImageUtil;
import com.topdev.aa.lib.Validator;
import com.topdev.tsp.action.modules.businesspartner.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.overview.OverviewImage;

public class ImageDetailAction extends DetailAction
{
	private static final long serialVersionUID = 1L;
	OverviewImage entry;
	List<ComplexEntryList> entries;
	String	id;
	String	id_entity;
	String	KZ_IS_DELETED;
	String	KZ_IS_MODIFIED;
	String	user;
	String	xpts;
	File	image;
	String	imageFileName;
	String	imageContentType;
	String	tbshCode;
	String	tbshDecode;
	
	
	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getImageList().getEntryList();
		entry = (OverviewImage) getElementById(entries);
		if(entry==null) entry = new OverviewImage();
	}
	public String insert() throws Exception
	{
		init("insert");
		entry = new OverviewImage(getMaxId(entries));
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
//		getMainObject().saveEmphasis(entry);
//		setRtErrors(getMainObject().getErrors());
//		entries.remove(entry);
//		getMainObject().loadDataEmphasis();
		getMainObject().saveImage(getPrincipal().getLoginId(), entry, null);
		setRtErrors(getMainObject().getErrors());
		getMainObject().loadDataImage();
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

		getMainObject().setErrors(new ArrayList<String>(1));
		if(Validator.equals(tbshCode,"GEBI") && getMainObject().getImageList().getEntryList()!=null && getMainObject().getImageList().getEntryList().size()>=3)
		{
			int gebis=0;
			Iterator<ComplexEntryList> it = getMainObject().getImageList().getEntryList().iterator();
			while(it.hasNext()) if(Validator.equals(  ((OverviewImage)it.next()).getTbshCode(),"GEBI")) gebis++;
			if(gebis>=3) getRtErrors().add("Für den Bereich \"Auf einen Blick\" sind maximal 3 Bilder zulässig.");
		}
		getRtErrors().addAll( checkUploadedImageFiles(new File[]{image}, new String[]{imageFileName}) );
		if(getRtErrors().size()<1 && (image==null || image.length()<1)) getRtErrors().add("Die Datei wurde entweder nicht korrekt ausgewählt oder konnte nicht transferiert werden. Bitte versuchen Sie es erneut.");
		if(getRtErrors().size()>0) return "saved";

		// Bild auf richtige Größe skalieren						
		imageFileName = ImageUtil.scaleImage(imageFileName, image, 186);		
		
		HashMap<String,String> form = new HashMap<String, String>(10);
		form.put("id_entity",	id_entity);
		form.put("xpts",		xpts);
		form.put("user",		user);
		form.put("tbshCode",	tbshCode);
		form.put("name",		imageFileName);
		if(image!=null) form.put("groesse", String.valueOf(image.length()));
		if(id_entity == null || id_entity.equals("0"))
		{
			entry = new OverviewImage(form);
			entry.setInserted("1");
		}
		else entry.setData(form);

		
		getMainObject().saveImage(getPrincipal().getLoginId(), entry, image);
		setRtErrors(getMainObject().getErrors());
		//if(getMainObject().getErrors().size()<1) uploadFile(image, entry.getId_entity());
		getMainObject().loadDataImage();
		return "saved";
	}

	public OverviewImage getEntry()
	{
		return entry;
	}

	public void setEntry(OverviewImage entry)
	{
		this.entry = entry;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getId_entity()
	{
		return id_entity;
	}

	public void setId_entity(String id_entity)
	{
		this.id_entity = id_entity;
	}

	public File getImage()
	{
		return image;
	}

	public void setImage(File image)
	{
		this.image = image;
	}

	public String getImageContentType()
	{
		return imageContentType;
	}

	public void setImageContentType(String imageContentType)
	{
		this.imageContentType = imageContentType;
	}

	public String getImageFileName()
	{
		return imageFileName;
	}

	public void setImageFileName(String imageFileName)
	{
		this.imageFileName = imageFileName;
	}

	public String getKZ_IS_DELETED()
	{
		return KZ_IS_DELETED;
	}

	public void setKZ_IS_DELETED(String kz_is_deleted)
	{
		KZ_IS_DELETED = kz_is_deleted;
	}

	public String getKZ_IS_MODIFIED()
	{
		return KZ_IS_MODIFIED;
	}

	public void setKZ_IS_MODIFIED(String kz_is_modified)
	{
		KZ_IS_MODIFIED = kz_is_modified;
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
	public String getTbshCode() {
		return tbshCode;
	}
	public void setTbshCode(String tbshCode) {
		this.tbshCode = tbshCode;
	}
	public String getTbshDecode() {
		return tbshDecode;
	}
	public void setTbshDecode(String tbshDecode) {
		this.tbshDecode = tbshDecode;
	}
}