package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Submodule;
import com.topdev.service.medium.Client;

public class TabAction extends TabActionData implements Submodule
{
	private static final long	serialVersionUID	= 1L;
	
	public String edit() throws Exception
	{
		if(Validator.isEmpty(currentTab))	currentTab	= mainObject.getCurrentTab();
		if(Validator.isEmpty(currentTab))	currentTab	= "1";
		if(previousTab==null)				previousTab	= currentTab;
		mainObject.clearErrors();

		//Datenaufbereitung für jew. Tab
		if(		currentTab.equals("6"))	Tab6.prepare(this);
		else if(currentTab.equals("7"))	Tab7.prepare(this);

		//Wenn F5 nix tun
		if(!Validator.equals(action, "portlet_save") && currentTab.equals(previousTab))
			return finalizeMainObject();

		//Daten des letzten Tabs ins Bobj übernehmen
		if(		previousTab.equals("1")) Tab1.save(this);
		else if(previousTab.equals("2")) Tab2.save(this);
		else if(previousTab.equals("3")) Tab3.save(this);
		else if(previousTab.equals("4")) Tab4.save(this);
		else if(previousTab.equals("5")) Tab5.save(this);
		else if(previousTab.equals("6")) Tab6.save(this);
		else if(previousTab.equals("7")) Tab7.save(this);

		if(Validator.equals(action, "portlet_save"))
		{
			try
			{
				mainObject.updateBobj();
				id = Client.save(mainObject.getBobj());
				return "portlet_saved";
			}
			catch(Exception ex)
			{
				String tMsg = ex.getMessage();
				//System.out.println(">>>>>>>>>>>>>>>>>>>>0>"+tMsg);
				if(tMsg!=null)
				{
					if(tMsg.indexOf("#MSG#")>0)
					{
						String[] tArray = tMsg.split("#MSG#");
						tMsg=tArray[1];//+"\n\n"+tArray[0];
					}
				}
				//System.out.println(">>>>>>>>>>>>>>>>>>>>1>"+tMsg);
				mainObject.getErrors().put("SERVICE",
					"Beim Speichern der Daten ist ein Fehler aufgetreten.\n "+tMsg);
			}
		}

		return finalizeMainObject();
	}

}