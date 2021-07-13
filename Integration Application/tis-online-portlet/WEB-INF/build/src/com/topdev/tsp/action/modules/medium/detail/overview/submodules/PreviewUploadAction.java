package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.lib.ImageUtil;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.aa.object.error.ValidationError;
import com.topdev.service.anla.Proxy;
import com.topdev.service.anla.data.BobjAnla;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjImage;

public class PreviewUploadAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;
	File	previewImage;
	String	previewImageFileName;
	String	previewImageContentType;
	String	kz_delete;
	String	previewImage_pts;
	String	previewImage_orgUser;
	String	mediumId;
	String	previewImageId;

	public String upload() throws Exception
	{
		try
		{
			if(previewImage==null || previewImage.length()<1) throw new Exception("Es wurde keine Datei Hochgeladen.");
			System.out.println("pua ->>> :"+getUserName()+":"+getSessionId()+":"+getSessionAttribute("userName"));
			if(!Validator.equals(kz_delete, "0"))
			{
//				BobjImage image = new BobjImage();
//				image.setId(previewImageId);
//				image.setIsDeleted("1");
//				image.setIsModified("0");
//				image.setMediumId(getMediumId());
//				image.setName(previewImageFileName);
//				image.setUser(getUserName());
//				Client.savePreview(image);

				BobjAnla a = new BobjAnla();
				a.setTbshId(	getMediumId());
				a.setTbshCode(	"MEDI");
				a.setId(		previewImageId);
				a.setOrgUser(	previewImage_orgUser);
				a.setOrgXPts(	previewImage_pts);
				Proxy.delete(getUserName(), getSessionId(), a);
			}
			else
			{
				setErrors( checkUploadedFiles(new File[]{previewImage}, new String[]{previewImageFileName}));
				
				// Bild auf richtige Größe skalieren				
				previewImageFileName = ImageUtil.scaleImage(previewImageFileName, previewImage, 340);												
				
				BobjImage image = new BobjImage();
				image.setMediumId(getMediumId());
				image.setName(previewImageFileName);
				if(getErrors().size()<1)
				{
				   	try
					{
						BobjAnla a = new BobjAnla(previewImage, previewImageFileName);
						a.setTbshId(			getMediumId());
						a.setTbshCode(			"MEDI");
						a.setTitel(				previewImageFileName);
						a.setNutzerkreisCode(	"40");
						com.topdev.aa.data.BobjStandard result = Proxy.insert(getUserName(), getSessionId(), a);
						if(result!=null)
						{
							image.setId(	result.getId());
							image.setUser(	result.getOrgUser());
							image.setPts(	result.getOrgXPts());
				
							if(result.getValidationErrors()!=null)
							{
								String es = "";
								for(ValidationError ve :result.getValidationErrors()) es+=ve.getText()+" \n";
								if(es.length()>0) getErrors().add(es);
							}
						}
						else getErrors().add("Beim Einfügen des Bildes ist ein Fehler aufgetreten. (EC158)");
					}
					catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); System.out.println(ex.getLocalizedMessage()); }					
				}
			}
		}
		catch(Exception ex)
		{
			getErrors().add(ex.toString());
		}
		return "success";
	}
	
	@SuppressWarnings("unchecked")
	public List<String> checkUploadedFiles(File[] files, String[] fileNames)
	{
		List<String>	errors			= new ArrayList<String>(1);
		ServletContext sc = ServletActionContext.getServletContext();
		if(
				sc.getInitParameter("upload_maxsize") == null ||
				sc.getInitParameter("upload_valid_extensions") == null)
		{
			getLog().error("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			errors.add("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			return errors;
		}
		if(files==null && fileNames==null) return errors;
		

		int				maxLength		= Integer.parseInt(sc.getInitParameter("upload_maxsize").trim());
		List			validExtensions	= Arrays.asList(sc.getInitParameter("upload_image_valid_extensions").replaceAll(" ","").split(","));		

		if(files.length != fileNames.length)
		{
			errors.add("Dateien und Dateinamen stimmen nicht überein.");
			return errors;
		}
		for(int i=0; i < files.length; i++)
		{
			if(files[i]==null || files[i].length()<1)
			{
				errors.add("Die Datei wurde entweder nicht korrekt ausgewählt oder konnte nicht transferiert werden. Bitte versuchen Sie es erneut.");
			}
			else if(fileNames[i]!=null && fileNames[i].length()>0)
			{
				if(files[i].length() > maxLength)
					errors.add("Die Datei "+fileNames[i]+" ist zu groß. Maximal sind " + maxLength + " Bytes zulässig.");
	
				if(files[i].length() == 0)
					errors.add("Die Datei "+fileNames[i]+" wurde ohne Inhalt übertragen.");
	
				if(!validExtensions.contains(fileNames[i].substring(fileNames[i].lastIndexOf(".")+1).toLowerCase()))
					errors.add("Der Dateityp der Datei "+fileNames[i]+" ist unzulässig.");
			}
		}
		return errors;
	}
	@SuppressWarnings("unchecked")


	public File getPreviewImage()
	{
		return previewImage;
	}

	public void setPreviewImage(File previewImage)
	{
		this.previewImage = previewImage;
	}

	public String getPreviewImageFileName()
	{
		return previewImageFileName;
	}

	public void setPreviewImageFileName(String previewImageFileName)
	{
		this.previewImageFileName = previewImageFileName;
	}

	public String getPreviewImageContentType()
	{
		return previewImageContentType;
	}

	public void setPreviewImageContentType(String previewImageContentType)
	{
		this.previewImageContentType = previewImageContentType;
	}

	public String getPreviewImage_orgUser()
	{
		return previewImage_orgUser;
	}

	public void setPreviewImage_orgUser(String previewImage_orgUser)
	{
		this.previewImage_orgUser = previewImage_orgUser;
	}

	public String getMediumId()
	{
		return mediumId;
	}

	public void setMediumId(String mediumId)
	{
		this.mediumId = mediumId;
	}

	public String getPreviewImage_pts()
	{
		return previewImage_pts;
	}

	public void setPreviewImage_pts(String previewImage_pts)
	{
		this.previewImage_pts = previewImage_pts;
	}
	public String getKz_delete()
	{
		return kz_delete;
	}

	public void setKz_delete(String kz_delete)
	{
		this.kz_delete = kz_delete;
	}
}