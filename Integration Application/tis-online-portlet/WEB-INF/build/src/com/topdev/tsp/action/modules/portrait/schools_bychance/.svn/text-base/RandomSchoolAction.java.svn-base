package com.topdev.tsp.action.modules.portrait.schools_bychance;

import java.util.Date;

import com.topdev.aa.client.AnlaProxy;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.bild.Client;
import com.topdev.service.bild.data.BobjBild;
import com.topdev.service.bild.data.BobjSchulbild;

public class RandomSchoolAction extends AjaxImpl implements Ajax
{
	
	private static final long		serialVersionUID= 1L;
	private static BobjSchulbild 	bild			= null;
	private static String		 	bildUrl			= null;
	private static Date				lastRefresh		= null;
	public static int 				refreshDelay	= 10;//300=5min
	public String view() throws Exception
	{
		try { if(refreshDelay==10) refreshDelay = Integer.parseInt(getInitParameter("imageRefreshDelay")); } catch(Exception ex) {}
		int		counter=0;
		boolean	imageValid=false;
		
		while(!imageValid)
		{
			counter++;
			try
			{
				Date now = new Date();
				if(bildUrl==null || lastRefresh == null || (now.getTime()-lastRefresh.getTime()) > (refreshDelay*1000))
				{
					bild = Client.getRandomIllustratedSchoolImage(getUserName());
					bildUrl = AnlaProxy.getDownloadUrlById(getUserName(), getSessionId(), bild.getId());
					
//					if(!downloadFileExists(bild.getId()))
//					{
//						BobjBild bb = Client.getImageData(bild);
//						bild.setBytes(bb.getBytes());
//						bild.setData(bb.getData());
//						bild.setId(bb.getId());
//						bild.setName(bb.getName());
//						createDownloadFile(bild.getId(), bild.getName(), bild.getData());
//					}
					lastRefresh = now;
				}
				imageValid=true;
			}
			catch(Exception ex)
			{
				getLog().error("Fehler beim RandomSchoolImage: "+ (bildUrl!=null?bildUrl:"null")+"\n "+ex.toString());
			}
			if(counter>5)
			{
				getLog().error("Bild-Daten konnten nach mehreren Versuchen nicht geladen werden.");
				throw new Exception("Die angeforderten Daten konnten nicht geladen werden.");
			}
		}
		return "success";
	}
	
	public BobjSchulbild getBild() {
		return bild;
	}
	public void setBild(BobjSchulbild bild2) {
		bild = bild2;
	}

	public int getRefreshDelay() {
		return refreshDelay;
	}

	public void setRefreshDelay(int refreshDelay2) {
		refreshDelay = refreshDelay2;
	}

	public static String getBildUrl() {
		return bildUrl;
	}

	public static void setBildUrl(String bildUrl) {
		RandomSchoolAction.bildUrl = bildUrl;
	}
}