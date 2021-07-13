package com.topdev.tsp.action.modules.common.image;

import com.topdev.aa.client.AnlaProxy;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.bild.Client;
import com.topdev.service.bild.data.BobjBild;

public class AjaxViewAction extends AjaxImpl implements Ajax
{
	private static final long		serialVersionUID= 1L;
	private BobjBild 				bild			= null;
	private static String		 	bildUrl			= null;
	private String tbshCode;

	public String view() throws Exception
	{
		if(tbshCode.equals("GEBI")) bild = Client.getRandomImageByTbsh(getUserName(), getTspi(), tbshCode);
		else bild = Client.getImageByTbsh(getUserName(), getTspi(), tbshCode);
		if(bild!=null) bildUrl = AnlaProxy.getDownloadUrlById(getUserName(), getSessionId(), bild.getId());
		return "success";
	}

	public String getTbshCode() {
		return tbshCode;
	}

	public void setTbshCode(String tbshCode) {
		this.tbshCode = tbshCode;
	}

	public BobjBild getBild() {
		return bild;
	}

	public void setBild(BobjBild bild) {
		this.bild = bild;
	}

	public static String getBildUrl() {
		return bildUrl;
	}

	public static void setBildUrl(String bildUrl) {
		AjaxViewAction.bildUrl = bildUrl;
	}
}