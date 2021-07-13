package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.Iterator;

import com.topdev.aa.lib.Validator;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjDatei;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Datei;

public class Tab6
{
	public static void prepare(TabAction t) throws Exception
	{
		boolean reloadData = false;
		if(( Validator.equals(t.action, "save") || Validator.equals(t.action, "delete")) && !Validator.equals(t.getId(), "0")) reloadData = true;
		if(Validator.empty(t.action)) t.action="list";
		
		t.complexList		= t.mainObject.getDatei_liste();
		t.complexEntryList	= t.complexList.getEntryList();
		t.entries 			= t.mainObject.getDatei_liste().getEntryList();
		
		if(t.action.equals("list"))
		{
		}
		else if(t.action.equals("save"))
		{
			t.mainObject.getBobj().setDirty(true);
			t.entry = (Datei) t.getElementById(t.entries);
			if(t.entry==null) t.entry = new Datei();
			if(Validator.isEmpty0(t.id))
			{
				t.entry = new Datei(t.getActionParameters());
				BobjDatei datei = new BobjDatei();
				datei.setUser(t.mainObject.getBobj().getUser());
				datei.setPts("");
				datei.setDateigroesse(t.entry.getDateigroesse());
				datei.setDateigroesseEinheitCode (t.entry.getDateigroesseEinheitCode());
				datei.setDateiname (t.entry.getDateiname());
				datei.setFormat (t.entry.getFormat());
				datei.setLaufendeNummer( t.entry.getLaufendeNummer());
				datei.setMedienverwendungCode (t.entry.getMedienverwendungCode());
				datei.setMediumId (t.mainObject.getBobj().getId());
				datei.setUrl( "");
				datei.setUrlText( t.entry.getUrlText());
				datei.setId(Client.saveMediumDatei(datei));
				t.entry.setInserted("1");
				t.entry.setId(t.getMaxId(t.entries));
				t.entry.setId_entity(datei.getId());
				t.entries.add(t.entry);
				t.entry.setModified("0");
				t.entry.setDeleted("0");
				t.entry.setStatus("1");
				t.action="edit";
			}
			else
			{
				t.entry.setData(t.getActionParameters());
				Iterator<BobjDatei> it = t.mainObject.getBobj().getDateienDesMediums().iterator();
				while(it.hasNext())
				{
					BobjDatei tDatei = it.next();
					tDatei.setUser(t.mainObject.getBobj().getUser());
					if(Validator.equals(tDatei.getId(), t.entry.getId_entity()))
					{
						tDatei.setUser(t.mainObject.getBobj().getUser());
						tDatei.setDateigroesse(t.entry.getDateigroesse());
						tDatei.setDateigroesseEinheitCode (t.entry.getDateigroesseEinheitCode());
						tDatei.setLaufendeNummer( t.entry.getLaufendeNummer());
						tDatei.setMediumId (t.mainObject.getBobj().getId());
						tDatei.setUrl("");
						tDatei.setUrlText( t.entry.getUrlText());
						Client.saveMediumDatei(tDatei);
						reloadData = true;
						break;
					}
				}
			}
			t.entry.setModified("1");
		}
		else if(t.action.equals("delete"))
		{
			t.mainObject.getBobj().setDirty(true);
			t.entry = (Datei) t.getElementById(t.entries);
			Iterator<BobjDatei> it = t.mainObject.getBobj().getDateienDesMediums().iterator();
			while(it.hasNext())
			{
				BobjDatei tDatei = it.next();
				tDatei.setUser(t.mainObject.getBobj().getUser());
				if(Validator.equals(tDatei.getId(), t.entry.getId_entity()))
				{
					Client.deleteMediumDatei(tDatei);
					break;
				}
			}
			t.action="list";
		}
		else if(t.action.equals("undo"))
		{
			t.entry = (Datei) t.getElementById(t.entries);
			if(t.entry.getId_entity().equals("0")) t.entries.remove(t.entry);
			else t.entry.reset();
		}
		else if(t.action.equals("edit") || t.action.equals("insert"))
		{
			t.entry = (Datei) t.getElementById(t.entries);
			if(t.entry==null) t.entry = new Datei();
		}
		if(reloadData)
		{
			boolean tDirty = t.mainObject.getBobj().isDirty();
			t.mainObject.getBobj().setDateienDesMediums(com.topdev.service.mediumdatei.Client.getByMediumId(t.getUserName(), t.mainObject.getBobj().getId()));
			t.mainObject.updateDateienFromBobj();
			t.mainObject.getBobj().setDirty(tDirty);
		}
		t.complexList		= t.mainObject.getDatei_liste();
		t.complexEntryList	= t.complexList.getEntryList();
		t.entries 			= t.mainObject.getDatei_liste().getEntryList();
	}

	public static void save(TabAction t)
	{
	}
}