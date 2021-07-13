package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.Validator;
import com.topdev.tsp.model.list.modules.medium.detail.overview.ISBN;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Signatur;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Standort;

public class Tab5
{
	public static void save(TabAction t)
	{
	    if(!Validator.equals(t.auszeichnungen, t.mainObject.getBobj().getAuszeichnungen()))
	    t.mainObject.getBobj().setAuszeichnungen(t.auszeichnungen);
        
	    if(!Validator.equals(t.systemvoraussetzungen, t.mainObject.getBobj().getSystemvoraussetzungen()))
	    t.mainObject.getBobj().setSystemvoraussetzungen(t.systemvoraussetzungen);
        
	    if(!Validator.equals(t.preis, t.mainObject.getBobj().getKontextmedien()))
	    t.mainObject.getBobj().setPreis(t.preis);
        
	    if(!Validator.equals(t.verfuegbarkeitAnfang, t.mainObject.getBobj().getVerfuegbarkeitAnfang()))
	    t.mainObject.getBobj().setVerfuegbarkeitAnfang(t.verfuegbarkeitAnfang);
        
	    if(!Validator.equals(t.verfuegbarkeitEnde, t.mainObject.getBobj().getVerfuegbarkeitEnde()))
	    t.mainObject.getBobj().setVerfuegbarkeitEnde(t.verfuegbarkeitEnde);
        
	    if(!Validator.equals(t.verleihEnde, t.mainObject.getBobj().getVerleihEnde()))
	    t.mainObject.getBobj().setVerleihEnde(t.verleihEnde);
        
	    if(!Validator.equals(t.vertrieb, t.mainObject.getBobj().getVertrieb()))
	    t.mainObject.getBobj().setVertrieb(t.vertrieb);
        
	    if(!Validator.equals(t.bemerkungen, t.mainObject.getBobj().getBemerkungen()))
	    t.mainObject.getBobj().setBemerkungen(t.bemerkungen);
        
	    if(!Validator.equals(t.erschliesser, t.mainObject.getBobj().getErschliesser()))
	    t.mainObject.getBobj().setErschliesser(t.erschliesser);
        
	    if(!Validator.equals(t.isOeffentlich, t.mainObject.getBobj().getIsOeffentlich()))
	    t.mainObject.getBobj().setIsOeffentlich(t.isOeffentlich);
        
	    if(!Validator.equals(t.mediumStatusCode, t.mainObject.getBobj().getMediumStatusCode()))
	    t.mainObject.getBobj().setMediumStatusCode(t.mediumStatusCode);
        
	    List<HashMap<String, String>> list = t.getActionParameterMaps("isbn_liste_", t.defaultParameters+"," + "bezeichnung");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getIsbn_liste().clearEntryList();
            while(it.hasNext())
            {
                ISBN ts = new ISBN(it.next());
                t.getLog().debug(ts.getId_entity()+" Isbn ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getIsbn_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("signatur_liste_", t.defaultParameters+"," + "signaturartCode," + "signaturartDecode," + "medienartCode," + "medienartDecode," + "laufendeNummer");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator();
            t.mainObject.getSignatur_liste().clearEntryList();
            while(it.hasNext())
            {
                Signatur ts = new Signatur(it.next());
                t.getLog().debug(ts.getId_entity()+" Signatur ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getSignatur_liste().getEntryList().add(ts);
            }
        }
        
        list = t.getActionParameterMaps("standort_liste_", t.defaultParameters+"," + "code," + "decode");
        if(Validator.isParameterListModified(list)) t.mainObject.getBobj().setDirty(true);
        if(t.mainObject.getBobj().isDirty())
        {
            t.mainObject.getBobj().setDirty(true);
            Iterator<HashMap<String, String>> it = list.iterator(); 
            t.mainObject.getStandort_liste().clearEntryList();
            while(it.hasNext())
            {
                Standort ts = new Standort(it.next());
                t.getLog().debug(ts.getId_entity()+" Standort ist modified:"+ts.getModified()+" deleted:"+ts.getDeleted()+" inserted:"+ts.getInserted());
                if(!Validator.equals(ts.getId(), "0")) t.mainObject.getStandort_liste().getEntryList().add(ts);
            }
        }
        
        if(!Validator.isCorrectDateFormatOrEmty(t.getVerfuegbarkeitAnfang()))
            t.getMainObject().getErrors().put("verfuegbarkeitAnfang", Message.getText("error.wrongDateFormat"));
        
        if(!Validator.isCorrectDateFormatOrEmty(t.getVerfuegbarkeitEnde()))
            t.getMainObject().getErrors().put("verfuegbarkeitEnde", Message.getText("error.wrongDateFormat"));
        
        if(!Validator.isCorrectTimeLine(t.getVerfuegbarkeitAnfang(),t.getVerfuegbarkeitEnde())){
            t.getMainObject().getErrors().put("verfuegbarkeitEnde", Message.getText("error.wrongTimeLine"));        
            t.getMainObject().getErrors().put("verfuegbarkeitAnfang", Message.getText("error.wrongTimeLine"));
        }
        if(!Validator.isCorrectDateFormatOrEmty(t.getVerleihEnde()))
            t.getMainObject().getErrors().put("verleihEnde", Message.getText("error.wrongDateFormat"));
        
        if(!t.getMainObject().getErrors().isEmpty()){}
	}
}