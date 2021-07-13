package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.topdev.aa.lib.Validator;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Adressat;
import com.topdev.tsp.model.list.modules.medium.detail.overview.FrSchlagwort;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Klassifikation;
import com.topdev.tsp.model.list.modules.medium.detail.overview.KonSchlagwort;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Sachgebiet;

public class Tab3
{
	public static void save(TabAction t)
	{
	    if(!Validator.equals(t.begleitmaterial, t.mainObject.getBobj().getBegleitmaterial()))
	    t.mainObject.getBobj().setBegleitmaterial(t.begleitmaterial);
		
	    if(!Validator.equals(t.kontextmedien, t.mainObject.getBobj().getKontextmedien()))
	    t.mainObject.getBobj().setKontextmedien(t.kontextmedien);
		
	    if(!Validator.equals(t.internetlinks, t.mainObject.getBobj().getInternetlinks()))
	    t.mainObject.getBobj().setInternetlinks(t.internetlinks);
		
	    if(!Validator.equals(t.erfahrungsbericht, t.mainObject.getBobj().getErfahrungsbericht()))
	    t.mainObject.getBobj().setErfahrungsbericht(t.erfahrungsbericht);
		
	    if(!Validator.equals(t.ausstrahlungsdatenSchulfernsehen, t.mainObject.getBobj().getAusstrahlungsdatenSchulfernsehen()))
	    t.mainObject.getBobj().setAusstrahlungsdatenSchulfernsehen(t.ausstrahlungsdatenSchulfernsehen);

		List<HashMap<String, String>> list = t.getActionParameterMaps("adressat_liste_", t.defaultParameters+"," + "code," + "decode," + "altersstufe");
		if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
		if(t.mainObject.getBobj().isDirty())
		{
			t.mainObject.getBobj().setDirty(true);
			Iterator<HashMap<String, String>> it = list.iterator();
			t.mainObject.getAdressat_liste().clearEntryList();
			while(it.hasNext())
			{
				Adressat ts = new Adressat(it.next());
				t.getLog().debug(ts.getId_entity()+" Adressat ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
				if(!Validator.equals(ts.getId(), "0")) t.mainObject.getAdressat_liste().getEntryList().add(ts);
			}
		}

		list = t.getActionParameterMaps("klassifikation_liste_", t.defaultParameters+"," +"code," + "decode");
		if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
    		t.mainObject.getKlassifikation_liste().clearEntryList();
            while(it.hasNext())
            {
                Klassifikation ts = new Klassifikation(it.next());
                t.getLog().debug(ts.getId_entity()+" Klassifikation ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getKlassifikation_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("sachgebiet_liste_", t.defaultParameters+ "," + "code," + "decode");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getSachgebiet_liste().clearEntryList();
            while(it.hasNext())
            {
                Sachgebiet ts = new Sachgebiet(it.next());
                t.getLog().debug(ts.getId_entity()+" Sachgebiet ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getSachgebiet_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("freiesschlagwort_liste_", t.defaultParameters+"," + "bezeichnung");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getFreiesschlagwort_liste().clearEntryList();
            while(it.hasNext())
            {
                FrSchlagwort ts = new FrSchlagwort(it.next());
                t.getLog().debug(ts.getId_entity()+" Freiesschlagwort ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getFreiesschlagwort_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("kontrolliertesschlagwort_liste_", t.defaultParameters+"," + "code," + "decode");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getKontrolliertesschlagwort_liste().clearEntryList();
            while(it.hasNext())
            {
                KonSchlagwort ts = new KonSchlagwort(it.next());
                t.getLog().debug(ts.getId_entity()+" Konschlagwort ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getKontrolliertesschlagwort_liste().getEntryList().add(ts);
            }
        }
	}
}


     