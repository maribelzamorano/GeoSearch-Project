package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.topdev.aa.lib.Validator;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Sprache;

public class Tab1
{
	public static void save(TabAction t)
	{
		if(!Validator.equals(t.mediumNummer, t.mainObject.getBobj().getMediumNummer()))
			t.mainObject.getBobj().setMediumNummer(t.mediumNummer);

		if(!Validator.equals(t.dokumentierendeStelleId, t.mainObject.getBobj().getDokumentierendeStelleId()))
			t.mainObject.getBobj().setDokumentierendeStelleId(t.dokumentierendeStelleId);

		if(!Validator.equals(t.anzahlLaufzeitFarben, t.mainObject.getBobj().getAnzahlLaufzeitFarben()))
			t.mainObject.getBobj().setAnzahlLaufzeitFarben(t.anzahlLaufzeitFarben);
		
		if(!Validator.equals(t.mediumArtCode, t.mainObject.getBobj().getMediumArtCode()))
			t.mainObject.getBobj().setMediumArtCode(t.mediumArtCode);
		
		if(!Validator.equals(t.mediumUnterartCode, t.mainObject.getBobj().getMediumUnterartCode()))
			t.mainObject.getBobj().setMediumUnterartCode(t.mediumUnterartCode);
		
		if(!Validator.equals(t.serientitel, t.mainObject.getBobj().getSerientitel()))
			t.mainObject.getBobj().setSerientitel(t.serientitel);
		
		if(!Validator.equals(t.serienuntertitel, t.mainObject.getBobj().getSerienuntertitel()))
			t.mainObject.getBobj().setSerienuntertitel(t.serienuntertitel);
		
		if(!Validator.equals(t.serienoriginaltitel, t.mainObject.getBobj().getSerienoriginaltitel()))
			t.mainObject.getBobj().setSerienoriginaltitel(t.serienoriginaltitel);

		if(!Validator.equals(t.seriensortiertitel, t.mainObject.getBobj().getSeriensortiertitel()))
			t.mainObject.getBobj().setSeriensortiertitel(t.seriensortiertitel);
		
		if(!Validator.equals(t.einzeltitel, t.mainObject.getBobj().getEinzeltitel()))
			t.mainObject.getBobj().setEinzeltitel(t.einzeltitel);
		
		if(!Validator.equals(t.einzeluntertitel, t.mainObject.getBobj().getEinzeluntertitel()))
			t.mainObject.getBobj().setEinzeluntertitel(t.einzeluntertitel);
		
		if(!Validator.equals(t.einzeloriginaltitel, t.mainObject.getBobj().getEinzeloriginaltitel()))
			t.mainObject.getBobj().setEinzeloriginaltitel(t.einzeloriginaltitel);
		
		if(!Validator.equals(t.einzelsortiertitel, t.mainObject.getBobj().getEinzelsortiertitel()))
			t.mainObject.getBobj().setEinzelsortiertitel(t.einzelsortiertitel);
		
		if(!Validator.equals(t.kurzinhalt, t.mainObject.getBobj().getKurzinhalt()))
			t.mainObject.getBobj().setKurzinhalt(t.kurzinhalt);
		
		if(!Validator.equals(t.inhalt, t.mainObject.getBobj().getInhalt()))
			t.mainObject.getBobj().setInhalt(t.inhalt);
		
		if(!Validator.equals(t.serienbeschreibung, t.mainObject.getBobj().getSerienbeschreibung()))
			t.mainObject.getBobj().setSerienbeschreibung(t.serienbeschreibung);
		
		List<HashMap<String, String>> list = t.getActionParameterMaps("sprache_liste_", t.defaultParameters+","+"code,"+"decode,"+"sprachergaenzungCode,"+"sprachergaenzungDeCode");
		if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
		if(t.mainObject.getBobj().isDirty())
		{
			t.mainObject.getBobj().setDirty(true);
			Iterator<HashMap<String, String>> it = list.iterator();
			t.mainObject.getSprache_liste().clearEntryList();
			while(it.hasNext())
			{
				Sprache ts = new Sprache(it.next());
				t.getLog().debug(ts.getId_entity()+" Sprache ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
				if(!Validator.equals(ts.getId(), "0")) t.mainObject.getSprache_liste().getEntryList().add(ts);
			}
		}
	}
}