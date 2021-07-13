package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import com.topdev.aa.lib.Validator;
import com.topdev.service.anla.Proxy;
import com.topdev.service.anla.data.BobjAnla;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjImage;


public class Tab7
{
	public static void save(TabAction t)
	{
		t.mainObject.getBobj().setPreviewImageId(t.getPreviewImageId());
	}

	public static void prepare(TabAction t) throws Exception
	{
		if(Validator.equals(t.action, "delete"))
		{
			BobjAnla a = new BobjAnla();
			a.setTbshId(	t.getId());
			a.setTbshCode(	"MEDI");
			a.setId(		t.mainObject.getBobj().getPreviewImage().getId());
			a.setOrgUser(	t.mainObject.getBobj().getPreviewImage().getOrgUser());
			a.setOrgXPts(	t.mainObject.getBobj().getPreviewImage().getPts());
			Proxy.delete(t.getUserName(), t.getSessionId(), a);
			
			//Client.deleteMediumPreviewImage(t.mainObject.getBobj().getPreviewImage());
			t.mainObject.getBobj().setDirty(true);
		}

		t.mainObject.getBobj().setPreviewImage(Client.getPreviewImageByMediumId(t.mainObject.getBobj().getUser(), t.mainObject.getBobj().getId()));
		if(t.mainObject.getBobj().getPreviewImage()==null)
		{
			BobjImage tImg = new BobjImage();
			tImg.setUser(t.mainObject.getBobj().getUser());
			tImg.setId("0");
			tImg.setGeprueft("0");
			tImg.setGroesse("0");
			t.mainObject.getBobj().setPreviewImage(tImg);
		}
		t.previewImageUrl = t.initDownload(t.mainObject.getBobj().getId(), "MEDI");
		
		if("uploaded".equals(t.action))
		{
			t.mainObject.getBobj().setDirty(true);
		}
		if(!"portlet_save".equals(t.action)) t.action = null;
	}
}