package com.topdev.tsp.action.modules.medium.detail.overview;

import java.util.Iterator;

import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Module;
import com.topdev.aa.model.action.ModuleImpl;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjDatei;
import com.topdev.service.medium.data.BobjMedium;
import com.topdev.service.medium.data.BobjSachgebiet;
import com.topdev.tsp.model.presentation.medium.MediumEditObj;
import com.topdev.tsp.model.presentation.medium.MediumViewObj;

public class DetailAction extends ModuleImpl implements Module
{
    { setName("MediumEditObj"); }
    MediumViewObj viewObject = null;
    
    public void initMainObject(String mainObjectName)
    {
        setMainObjectName(mainObjectName);
        MediumEditObj tObj = new MediumEditObj();
        try
        {
        	if(Validator.equals(getTspi(),"0"))
        	{
        		BobjMedium bm = new BobjMedium();
        		bm.setId("0");
        		bm.setUser(getUserName());
        		tObj.setBobj(bm);
        	}
        	else
        	{
	            tObj.setBobj(Client.getById(getUserName(), getTspi()));
	            tObj.getBobj().setIsbnDesMediums(com.topdev.service.mediumisbn.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setLizenzenDesMediums(com.topdev.service.mediumlizenz.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setLizenzpreiseDesMediums(com.topdev.service.mediumlizenzpreis.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setAdressatenDesMediums(com.topdev.service.mediumadr.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setKlassifikationenDesMediums(com.topdev.service.mediumklassifikation.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setSachgebieteDesMediums(com.topdev.service.mediumsachgebiet.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setSprachenDesMediums(com.topdev.service.mediumsprache.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setStandorteDesMediums(com.topdev.service.mediumstandort.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setDateienDesMediums(com.topdev.service.mediumdatei.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setProduktionslaenderDesMediums(com.topdev.service.mediumproland.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setFreieSchlagworteDesMediums(com.topdev.service.mediumfrschlagwort.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setKontrollierteSchlagworteDesMediums(com.topdev.service.mediumkonschlagwort.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setSignaturenDesMediums(com.topdev.service.mediumsignatur.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.getBobj().setUrheberDesMediums(com.topdev.service.mediumurheber.Client.getByMediumId(getUserName(), getTspi()));
	            tObj.updateFromBobj();
	            tObj.getBobj().setDirty(false);
        	}
       }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        tObj.setName(mainObjectName);
        setMainObject(tObj);
 
    }

    private static final long   serialVersionUID    = 1L;
    public String view() throws Exception
    {
        if(Validator.empty(getUserName()) && !Client.getIsPublicByMediumId(getUserName(), getTspi()) ) return "login";
    	if(Validator.equals(getTspi(),"0"))
    	{
    		viewObject = new MediumViewObj();
    		BobjMedium bm = new BobjMedium();
    		bm.setId("0");
    		bm.setUser(getUserName());
    		viewObject.setBobj(bm);
    	}
    	else
    	{
	    	viewObject = new MediumViewObj();
	        viewObject.setBobj(Client.getById(getUserName(), getTspi()));
	        viewObject.getBobj().setIsbnDesMediums(com.topdev.service.mediumisbn.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setLizenzenDesMediums(com.topdev.service.mediumlizenz.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setLizenzpreiseDesMediums(com.topdev.service.mediumlizenzpreis.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setAdressatenDesMediums(com.topdev.service.mediumadr.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setKlassifikationenDesMediums(com.topdev.service.mediumklassifikation.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setSachgebieteDesMediums(com.topdev.service.mediumsachgebiet.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setSprachenDesMediums(com.topdev.service.mediumsprache.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setStandorteDesMediums(com.topdev.service.mediumstandort.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setDateienDesMediums(com.topdev.service.mediumdatei.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setProduktionslaenderDesMediums(com.topdev.service.mediumproland.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setFreieSchlagworteDesMediums(com.topdev.service.mediumfrschlagwort.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setKontrollierteSchlagworteDesMediums(com.topdev.service.mediumkonschlagwort.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setSignaturenDesMediums(com.topdev.service.mediumsignatur.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setUrheberDesMediums(com.topdev.service.mediumurheber.Client.getByMediumId(getUserName(), getTspi()));
	        viewObject.getBobj().setPreviewImageUrl(initDownload(viewObject.getBobj().getId(), "MEDI"));

            if(!Validator.empty(viewObject.getBobj().getDateienDesMediums()))
            {
            	viewObject.setStreamingFile(null);
	            Iterator<BobjDatei> it = viewObject.getBobj().getDateienDesMediums().iterator();
	            while(it.hasNext())
	            {
	            	BobjDatei tDatei = it.next();
	            	if(tDatei.getMedienverwendungCode()!=null && tDatei.getMedienverwendungCode().startsWith("1"))
	            	{
	            		viewObject.setStreamingFile(tDatei);
	            		break;
	            	}
	            }
            }
    	}
    	Iterator<BobjSachgebiet> it = viewObject.getBobj().getSachgebieteDesMediums().iterator();
    	while (it.hasNext()){
    	    BobjSachgebiet tmp = it.next();
    	    tmp.setHierarchy(tmp.getHierarchy().trim());
    	}
        return "view";
    }
    public String edit() throws Exception
    {
        if(!isMaximized()) return view();
        if(Validator.empty(getUserName())) return "login";
        else return "edit";
    }
    public MediumViewObj getViewObject()
    {
        return viewObject;
    }
    public void setViewObject(MediumViewObj viewObject)
    {
        this.viewObject = viewObject;
    }
}