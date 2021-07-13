package com.topdev.tsp.action.modules.medium.detail.files;

import java.util.ArrayList;
import java.util.List;

import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Module;
import com.topdev.aa.model.action.ModuleImpl;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjDatei;

public class ViewAction extends ModuleImpl implements Module
{
	private static final long	serialVersionUID	= 1L;
    List<BobjDatei> fileList = new ArrayList<BobjDatei>();

    public List<BobjDatei> getFileList() {
        return fileList;
    }

    public void setFileList(List<BobjDatei> fileList) {
        this.fileList = fileList;
    }

    public String view() throws Exception
	{ 
        if(Validator.empty(getUserName()) && !Client.getIsPublicByMediumId(getUserName(), getTspi()) ) return "login";
		fileList = com.topdev.service.mediumdatei.Client.getByMediumId(getUserName(),getTspi());
	    return "success";
	}
}