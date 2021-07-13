package com.topdev.tsp.model;

import java.io.Serializable;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.aop.SessionBean;
import com.topdev.tsp.model.view.View;

public class BasicViewModel implements Serializable, View
{
	private static final long	serialVersionUID	= 1L;
	public Log	log = LogFactory.getLog(this.getClass());
	String		id;
	String		vsid; 		//ViewStateID
	String		sessionId;
	String		pts;
	String		xpts;
	String		user;
	int			mode;
	String		objectName;
	String		anwf;
	String		anwf_option;
	String		kz_edit;
	String 		quelle;
	private List<String>	errors = new ArrayList<String>(1);
	private	String				tbsh;
	
	public String formatFileSize(long size)
	{
		DecimalFormat df = new DecimalFormat( "0.0" );
		if(size >= 1048576)		return df.format( ((double)size)/1048576D )+" MB";
		else if(size >= 1024)	return df.format( ((double)size)/1024D )+" KB";
		else return size +" Byte";
	}
	public void clearErrors()
	{
		errors = new ArrayList<String>(1);
	}
	public BasicViewModel()
	{
	}
	
	public BasicViewModel(String sessionId2, String id2, int mode2, SessionBean sessionBean2, String objectName2)
	{
	}
	

	public static boolean mustReload(BasicViewModel bvm, String id, int mode)
	{
		if(bvm!=null && bvm.getMode()==mode && bvm.getId() == id) return false;
		else return true;
	}

	public String generateTbsh( SessionBean sessionBean)
	{
		anwf		= (String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"anwf");
		anwf_option	= (String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"option");
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
	public void initData(String sessionId, String id, int mode, SessionBean sessionBean, String objectName)
	{
		setSessionId(sessionId);
		setId(id);
		setMode(mode);
		setObjectName(objectName);
		setAnwf(		(String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"anwf"));
		setAnwf_option(	(String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"option"));
		setTbsh(generateTbsh(sessionBean));
	}
	
	public void initData(String sessionId, String id, int mode, SessionBean sessionBean, String objectName, String vsid)
	{
		setSessionId(sessionId);
		setId(id);
		setVsid(vsid);
		setMode(mode);
		setObjectName(objectName);
		setAnwf(		(String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"anwf"));
		setAnwf_option(	(String) sessionBean.getAttribute(sessionId, BasicActionSupport.portalParameterPrefix+"option"));
		setTbsh(generateTbsh(sessionBean));
		loadData();
	}
	
	
	public String getSessionId()
	{
		return sessionId;
	}

	public void setSessionId(String sessionId)
	{
		this.sessionId = sessionId;
	}

	public String getPts()
	{
		return pts;
	}

	public void setPts(String pts)
	{
		this.pts = pts;
	}
	
	public String formatString(String s)
	{
		return s==null?"":s;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getXpts() {
		return xpts;
	}

	public void setXpts(String xpts) {
		this.xpts = xpts;
	}

	public int getMode()
	{
		return mode;
	}

	public void setMode(int mode)
	{
		this.mode = mode;
	}

	public String getObjectName()
	{
		return objectName;
	}

	public void setObjectName(String objectName)
	{
		this.objectName = objectName;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public void loadData()
	{
	}

	public List<String> saveData() throws SQLException
	{
		return null;
	}

	public List<String> getErrors()
	{
		return errors;
	}

	public void setErrors(List<String> errors)
	{
		this.errors = errors;
	}

	public String getAnwf()
	{
		return anwf;
	}

	public void setAnwf(String anwf)
	{
		this.anwf = anwf;
	}

	public String getAnwf_option()
	{
		return anwf_option;
	}

	public void setAnwf_option(String anwf_option)
	{
		this.anwf_option = anwf_option;
	}

	public String getTbsh()
	{
		return tbsh;
	}

	public void setTbsh(String tbsh)
	{
		this.tbsh = tbsh;
	}
	public String getKz_edit()
	{
		return kz_edit;
	}
	public void setKz_edit(String kz_edit)
	{
		this.kz_edit = kz_edit;
	}
	public String getVsid()
	{
		return vsid;
	}
	public void setVsid(String vsid)
	{
		this.vsid = vsid;
	}
	public String getQuelle()
	{
		return quelle;
	}
	public void setQuelle(String quelle)
	{
		this.quelle = quelle;
	}
}