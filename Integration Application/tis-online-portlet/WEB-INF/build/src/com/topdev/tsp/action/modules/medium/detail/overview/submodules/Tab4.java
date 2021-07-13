package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.Validator;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Lizenz;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Lizenzpreis;
import com.topdev.tsp.model.list.modules.medium.detail.overview.ProLand;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Urheber;

public class Tab4
{
	public static void save(TabAction t)
	{
	    if(!Validator.equals(t.produktionsartCode, t.mainObject.getBobj().getProduktionsartCode()))
	    t.mainObject.getBobj().setProduktionsartCode(t.produktionsartCode);
	    
	    if(!Validator.equals(t.produzent, t.mainObject.getBobj().getProduzent()))
	    t.mainObject.getBobj().setProduzent(t.produzent);
	    
	    if(!Validator.equals(t.produktionsjahr, t.mainObject.getBobj().getProduktionsjahr()))
	    t.mainObject.getBobj().setProduktionsjahr(t.produktionsjahr);
	    
	    if(!Validator.equals(t.herausgeber, t.mainObject.getBobj().getHerausgeber()))
	    t.mainObject.getBobj().setHerausgeber(t.herausgeber);
	    
	    if(!Validator.equals(t.fskVermerkCode, t.mainObject.getBobj().getFskVermerkCode()))
	    t.mainObject.getBobj().setFskVermerkCode(t.fskVermerkCode);
	    
	    if(!Validator.equals(t.feiertagsfreigabeCode, t.mainObject.getBobj().getFeiertagsfreigabeCode()))
	    t.mainObject.getBobj().setFeiertagsfreigabeCode(t.feiertagsfreigabeCode);
	    
	    if(!Validator.equals(t.vorfuehrrechteBeschreibung, t.mainObject.getBobj().getVorfuehrrechteBeschreibung()))
	    t.mainObject.getBobj().setVorfuehrrechteBeschreibung(t.vorfuehrrechteBeschreibung);
	    
	    if(!Validator.equals(t.vorfuehrrechteDatum, t.mainObject.getBobj().getVorfuehrrechteDatum()))
	    t.mainObject.getBobj().setVorfuehrrechteDatum(t.vorfuehrrechteDatum);
	    
	    if(!Validator.equals(t.isGemaPflicht, t.mainObject.getBobj().getIsGemaPflicht()))
	    t.mainObject.getBobj().setIsGemaPflicht(t.isGemaPflicht);
	    
	    if(!Validator.equals(t.endabnahmejahr, t.mainObject.getBobj().getEndabnahmejahr()))
	    t.mainObject.getBobj().setEndabnahmejahr(t.endabnahmejahr);
	    
	    List<HashMap<String, String>> list = t.getActionParameterMaps("produktionsland_liste_", t.defaultParameters+"," + "code," + "decode");
	    if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
    	    t.mainObject.getProduktionsland_liste().clearEntryList();
            while(it.hasNext())
            {
                ProLand ts = new ProLand(it.next());
                t.getLog().debug(ts.getId_entity()+" Produktionsland ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getProduktionsland_liste().getEntryList().add(ts);
            }
        }
	    
        list = t.getActionParameterMaps("urheber_liste_", t.defaultParameters+"," + "urheberFunktionCode," + "urheberFunktionDecode,"+ "urheberFunktionZusatz,"+ "bezeichnung");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getUrheber_liste().clearEntryList();
            while(it.hasNext())
            {
                Urheber ts = new Urheber(it.next());
                t.getLog().debug(ts.getId_entity()+" Urheber ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getUrheber_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("lizenz_liste_", t.defaultParameters+"," + "bezeichnung,"+ "webseite");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getLizenz_liste().clearEntryList();
            while(it.hasNext())
            {
                Lizenz ts = new Lizenz(it.next());
                t.getLog().debug(ts.getId_entity()+" Lizenz ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getLizenz_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("lizenzpreis_liste_", t.defaultParameters+"," + "beschreibung");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getLizenzpreis_liste().clearEntryList();
            while(it.hasNext())
            {
                Lizenzpreis ts = new Lizenzpreis(it.next());
                t.getLog().debug(ts.getId_entity()+" Lizenzpreis ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getLizenzpreis_liste().getEntryList().add(ts);
            }
        }

        if(!Validator.isCorrectDateFormatOrEmty(t.getVorfuehrrechteDatum()))
            t.getMainObject().getErrors().put("vorfuehrrechteDatum", Message.getText("error.wrongDateFormat"));
            
        if(!Validator.isCorrectDateFormatOrEmtyYear(t.getProduktionsjahr()))
            t.getMainObject().getErrors().put("produktionsjahr", Message.getText("error.wrongDateFormat"));
        
        if(!Validator.isCorrectDateFormatOrEmtyYear(t.getEndabnahmejahr()))
            t.getMainObject().getErrors().put("endabnahmejahr", Message.getText("error.wrongDateFormat"));
	    	
	}
}