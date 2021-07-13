package com.topdev.tsp.action.basic;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.portlet.WindowState;
import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.portlet.context.PortletActionContext;

import com.topdev.aa.lib.MD5;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.aop.SessionBean;
import com.topdev.tsp.model.list.BasicList;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.view.View;


public class DetailActionSupport extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
	public View mainObject;
	public String getNewVsid()
	{
		return getSessionBean().createVsid(getSessionId(), getTspi());
	}
	public void clearMainObject(BasicViewModel model)
	{
		String objectName	= SessionBean.viewObjectPrefix+model.getClass().getName();
		getSessionBean().removeAttribute(getSessionId(), objectName);
	}

	public BasicViewModel loadMainObject(String id, BasicViewModel model) throws PermissionException
	{
		return loadMainObject(id, model, null);
	}

	public BasicViewModel loadMainObject(String id, BasicViewModel model, String objectNamePrefix) throws PermissionException
	{
		id=getTspi();
		if(getMode()==1 && getVsid()==null)
			throw new NullPointerException("Der angeforderte Datensatz konnte nicht gefunden werden. (Es wurde keine korrekte ViewState-ID übergeben)");
		
		if(objectNamePrefix==null)										objectNamePrefix="";
		if(objectNamePrefix.equals("objectNamePrefixConvention_TBSH"))	objectNamePrefix = loadTbsh();
		if(objectNamePrefix.length()>0)									objectNamePrefix+="_";
		
		String				objectName = objectNamePrefix+model.getClass().getName();
		if(getMode()==2)	objectName = SessionBean.viewObjectPrefix+objectName;
		else
		{
			if(!getSessionBean().isVsidValid(getSessionId(), getVsid(), id)) throw new PermissionException("Sie besitzen keine Berechtigung um auf das angeforderte Objekt zuzugreifen");
			objectName = SessionBean.mainObjectPrefix+getVsid()+"."+objectName;
		}
		
		BasicViewModel view = (BasicViewModel) getSessionObject(objectName);
		if(view==null || (getMode()==2 && view.getId()!=null && !view.getId().equals(id)))
		{
			model.initData(getSessionId(), id, getMode(), getSessionBean(), objectName, getVsid());
			setSessionObject(objectName, model);
			return model;
		}
		else
		{
			return view;
		}
	}
	
	public String loadTbsh() throws PermissionException
	{
		String anwf			= getParm("anwf");
		String anwf_option	= getParm("option");
		String ttbsh = "DOKU";
		if(anwf!=null && anwf_option!=null && anwf.equals("schools"))
		{
			if(		anwf_option.equals("overview"))				ttbsh="AEBL";
			else if(anwf_option.equals("personal_resources"))	ttbsh="PERE";
			else if(anwf_option.equals("neuter_resources"))		ttbsh="SARE";
			else if(anwf_option.equals("school_evolution"))		ttbsh="SCEN";
			else if(anwf_option.equals("school_life"))			ttbsh="SLEB";
			else if(anwf_option.equals("learner_structure"))	ttbsh="SCST";
			else if(anwf_option.equals("contributer"))			ttbsh="MITW";
			else if(anwf_option.equals("cooperation"))			ttbsh="KOWI";
			else if(anwf_option.equals("Dokumente"))			ttbsh="DOKU";
		}
		return ttbsh;
	}
	
	public String execute() throws Exception
	{
		if(PortletActionContext.getRenderRequest().getWindowState().equals(WindowState.MAXIMIZED))
			return view();
		return edit();
	}
	public String view() throws Exception
    {
		boolean reinit = getMode()==1;
		setMode(2);
		initData( reinit );
		return view_ext();
	}
	public String edit() throws Exception
    {
		if(!PortletActionContext.getRenderRequest().getWindowState().equals(WindowState.MAXIMIZED))
			return view();
		boolean reinit = getMode()==2;
		setMode(1);
		initData( reinit );
		return edit_ext();
    }

	public String save() throws Exception
	{
		initData(false);
		if(getMainObject()!=null)
			setRtErrors(getMainObject().saveData());
		return "saved";
	}

	public void catchSQLException(SQLException e)
	{
		getRtErrors().add(e.getLocalizedMessage());
		e = e.getNextException();
		while(e!=null)
		{
			getRtErrors().add(e.getLocalizedMessage());
			e = e.getNextException();
		}
	}
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
	}
	
	public void initData() throws SQLException, PermissionException
	{
		initData(false);
	}
	
	public String view_ext() throws Exception
    {
		return "view";
    }

	public String edit_ext() throws Exception
    {
		return "edit";
    }

	public ComplexEntryList getElementById(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(getParameter("id")))
				return cel;
		}
		return null;
	}

	public ComplexEntryList getElementById(List<ComplexEntryList> list, String id)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(id))
				return cel;
		}
		return null;
	}
	
	
	public String getMaxId(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		int i, max = 0;
		while(it.hasNext())
		{
			BasicList cel = it.next();
			i = Integer.parseInt(cel.getId());
			if(i>max) max=i;
		}
		return String.valueOf(max+1);
	}


	public List<String> checkUploadedImageFiles(File[] files, String[] fileNames)
	{
		List<String>	errors			= new ArrayList<String>(1);
		ServletContext sc = ServletActionContext.getServletContext();
		if(
				sc.getInitParameter("upload_image_maxsize") == null ||
				sc.getInitParameter("upload_image_valid_extensions") == null)
		{
			log.error("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			errors.add("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			return errors;
		}
		if(files==null && fileNames==null) return errors;
		

		int				maxLength		= Integer.parseInt(sc.getInitParameter("upload_image_maxsize").trim());
		List			validExtensions	= Arrays.asList(sc.getInitParameter("upload_image_valid_extensions").replaceAll(" ","").split(","));

		if(files.length != fileNames.length)
		{
			errors.add("Dateien und Dateinamen stimmen nicht überein.");
			return errors;
		}
		for(int i=0; i < files.length; i++) if(fileNames[i]!=null && fileNames[i].length()>0)
		{
			if(files[i]==null || files[i].length() < 1)
			{
				errors.add("Die Datei wurde entweder nicht korrekt ausgewählt oder konnte nicht transferiert werden. Bitte versuchen Sie es erneut.");
			}
			else
			{
				if(files[i].length() > maxLength)
					errors.add("Die Datei "+fileNames[i]+" ist zu Groß. Maximal sind " + maxLength + " Bytes zulässig.");

				if(!validExtensions.contains( fileNames[i].substring(fileNames[i].lastIndexOf(".")+1).toLowerCase() ))
					errors.add("Der Dateityp der Datei "+fileNames[i]+" ist unzulässig. (Zulässig sind die Formate: "+sc.getInitParameter("upload_image_valid_extensions")+")");
			}
		}
		return errors;
	}

	
	public List<String> checkUploadedFiles(File[] files, String[] fileNames)
	{
		if(files!=null && files.length>1) //fix für multilisten (letzter Eintrag ist stehts null)
		{
			List<File> tfiles = new ArrayList<File>();
			List<String> tfileNames = new ArrayList<String>();
			for(int i=0; i<files.length; i++)
			{
				if(files[i]!=null && files[i].length()>0)
				{
					tfiles.add(files[i]);
					tfileNames.add(fileNames[i]);
				}
			}
			files		= tfiles.toArray(new File[0]);
			fileNames	= tfileNames.toArray(new String[0]);
		}
		List<String>	errors			= new ArrayList<String>(1);
		ServletContext sc = ServletActionContext.getServletContext();
		if(
				sc.getInitParameter("upload_maxsize") == null ||
				sc.getInitParameter("upload_valid_extensions") == null)
		{
			log.error("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			errors.add("Die Eigenschaften upload_maxsize oder upload_valid_extensions wurden nicht korrekt konfiguriert.");
			return errors;
		}
		if(files==null && fileNames==null) return errors;
		

		int				maxLength		= Integer.parseInt(sc.getInitParameter("upload_maxsize").trim());
		List<String>	validExtensions	= Arrays.asList(sc.getInitParameter("upload_valid_extensions").replaceAll(" ","").split(","));

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
					errors.add("Die Datei "+fileNames[i]+" ist zu Groß. Maximal sind " + maxLength + " Bytes zulässig.");
	
				if(files[i].length() == 0)
					errors.add("Die Datei "+fileNames[i]+" wurde ohne Inhalt übertragen.");
	
				if(!validExtensions.contains(fileNames[i].substring(fileNames[i].lastIndexOf(".")+1).toLowerCase()))
					errors.add("Der Dateityp der Datei "+fileNames[i]+" ist unzulässig.");
			}
		}
		return errors;
	}
	
	
	public void init(String aktion) throws Exception
	{
		setRtErrors(new ArrayList<String>(1));

		setAktion(aktion);
		if(aktion.indexOf("view")==-1)
		{
			if(getPrincipal()==null)
				throw new Exception("Sie haben keine Berechtigung ("+aktion+") mit diesen Objekt.");
			setMode(1);
			
			if(aktion.indexOf("save")>-1 || aktion.indexOf("delete")>-1)
				getSessionBean().removeViewAttributes(getSessionId());
		}
		else setMode(2);
		

		initData();
	}
	
	
	public boolean checkHash(Object o)
	{
		String oldChecksum	= getSessionAttribute(o.getClass().getName()+"_checksum");
		return MD5.createMD5HashCode(o).equals(oldChecksum);
	}
	public void storeHash(Object o) throws PermissionException
	{
		setSessionAttribute(o.getClass().getName()+"_checksum", MD5.createMD5HashCode(o));
	}
	public String getObjectName(Class c) throws PermissionException
	{
		return getMode()+"_"+getObjectNamePrefix()+c.getName();
		/*
		PortletRequest request = PortletActionContext.getRequest();
		if(request.getParameter("topdev_id")	!=null)	request.setAttribute("topdev_id",		request.getParameter("topdev_id"));
		if(request.getParameter("topdev_anwf")	!=null)	request.setAttribute("topdev_anwf",		request.getParameter("topdev_anwf"));
		if(request.getParameter("topdev_option")!=null)	request.setAttribute("topdev_option",	request.getParameter("topdev_option"));

		anwf	= (String) PortletActionContext.getRequest().getAttribute("topdev_anwf");
		option	= (String) PortletActionContext.getRequest().getAttribute("topdev_option");
		mainId	= (String) PortletActionContext.getRequest().getAttribute("topdev_id");
		return "model."+anwf+"#"+c.getName();

		 * */
	}
	public String getObjectNamePrefix() throws PermissionException
	{
		String anwf			= getParm("anwf");
		String option		= getParm("option");
		String schoolId		= getParm("schoolId");
		return "model."+anwf+"#";
	}
	public String getObjectName(Class c, String anwf)
	{
		return "model."+anwf+"#";
	}
	public View getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(View mainObject)
	{
		this.mainObject = mainObject;
	}
}