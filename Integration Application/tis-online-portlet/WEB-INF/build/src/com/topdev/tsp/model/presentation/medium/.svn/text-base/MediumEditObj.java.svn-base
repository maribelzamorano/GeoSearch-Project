package com.topdev.tsp.model.presentation.medium;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import com.topdev.service.medium.data.*;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.medium.detail.overview.*;
import com.topdev.tsp.model.presentation.EditObj;

public class MediumEditObj extends EditObj
{
	private static final long	serialVersionUID	= 1L;
	String		currentTab;
	String		previousTab;
	Boolean		isIncompleteTab1;
	Boolean		isIncompleteTab2;
	Boolean		isIncompleteTab3;
	Boolean		isIncompleteTab4;
	Boolean		isIncompleteTab5;
	Boolean		isIncompleteTab6;
	Boolean		isIncompleteTab7;

	ComplexList	klassifikation_liste	        = new ComplexList();
	ComplexList	sachgebiet_liste		        = new ComplexList();
	ComplexList	kontrolliertesschlagwort_liste	= new ComplexList();
	ComplexList freiesschlagwort_liste          = new ComplexList();
	ComplexList	adressat_liste			        = new ComplexList();
	ComplexList sprache_liste                   = new ComplexList();

	ComplexList	produktionsland_liste	        = new ComplexList();
	ComplexList	urheber_liste			        = new ComplexList();
	ComplexList	lizenz_liste			        = new ComplexList();
	ComplexList	lizenzpreis_liste		        = new ComplexList();

	ComplexList	isbn_liste				        = new ComplexList();
	ComplexList	signatur_liste			        = new ComplexList();
	ComplexList	standort_liste			        = new ComplexList();
	
	ComplexList	datei_liste				        = new ComplexList();

	BobjMedium	bobj = new BobjMedium();
	
	public MediumEditObj()
	{
		
	    datei_liste.setKz_insert("1");
		datei_liste.getHeadingList().add(new ComplexHeading("laufendeNummer"));
		datei_liste.getHeadingList().add(new ComplexHeading("dateiname"));
		datei_liste.getHeadingList().add(new ComplexHeading("format"));
		datei_liste.getHeadingList().add(new ComplexHeading("url"));
		
		sprache_liste.setKz_insert("1");
        sprache_liste.getHeadingList().add(new ComplexHeading("sprachen"));
        sprache_liste.getHeadingList().add(new ComplexHeading("sprachergaenzungDeCode"));
        
        adressat_liste.setKz_insert("1");
        adressat_liste.getHeadingList().add(new ComplexHeading("adressaten"));
        adressat_liste.getHeadingList().add(new ComplexHeading("zusatzinformation"));
        
        klassifikation_liste.setKz_insert("1");
        klassifikation_liste.getHeadingList().add(new ComplexHeading("klassifikationen"));
		
        freiesschlagwort_liste.setKz_insert("1");
        freiesschlagwort_liste.getHeadingList().add(new ComplexHeading("freieschlagworte"));
        
        kontrolliertesschlagwort_liste.setKz_insert("1");
        kontrolliertesschlagwort_liste.getHeadingList().add(new ComplexHeading("kontrollierteschlagworte"));
        kontrolliertesschlagwort_liste.getHeadingList().add(new ComplexHeading("nothing"));
        
        produktionsland_liste.setKz_insert("1");
        produktionsland_liste.getHeadingList().add(new ComplexHeading("produktionslaender"));
        
        urheber_liste.setKz_insert("1");
        urheber_liste.getHeadingList().add(new ComplexHeading("urheberfunktion"));
        urheber_liste.getHeadingList().add(new ComplexHeading("urheber"));
        urheber_liste.getHeadingList().add(new ComplexHeading("urheberfunktionszusatz"));
        
        sachgebiet_liste.setKz_insert("1");
        sachgebiet_liste.getHeadingList().add(new ComplexHeading("sachgebiete"));
        sachgebiet_liste.getHeadingList().add(new ComplexHeading("nothing"));
        
        lizenz_liste.setKz_insert("1");
        lizenz_liste.getHeadingList().add(new ComplexHeading("lizenzen"));
        lizenz_liste.getHeadingList().add(new ComplexHeading("webseite"));
        
        lizenzpreis_liste.setKz_insert("1");
        lizenzpreis_liste.getHeadingList().add(new ComplexHeading("lizenzpreise"));
        
        isbn_liste.setKz_insert("1");
        isbn_liste.getHeadingList().add(new ComplexHeading("isbn"));
        
        
        signatur_liste.setKz_insert("1");
        signatur_liste.getHeadingList().add(new ComplexHeading("signaturen"));
        signatur_liste.getHeadingList().add(new ComplexHeading("medienartDecode"));
        signatur_liste.getHeadingList().add(new ComplexHeading("laufendeNummer"));
        
        
        standort_liste.setKz_insert("1");
        standort_liste.getHeadingList().add(new ComplexHeading("standorte"));
        
//		HashMap<String, String> map = new HashMap<String, String>();
//		map.put("id",						String.valueOf(klassifikation_liste.getEntryList().size())+1);
//		map.put("kz_edit",					"1");
//		map.put("kz_delete",				"1");
//		map.put("id_entity",				"0");
//		map.put("user",						"user");
//		map.put("xpts",						"none");
//		map.put("decode",					"Testklassifikation");
//		map.put("code",						"1");
//		klassifikation_liste.getEntryList().add(new Template3EntryList(map));
	}

	public void updateFromBobj()
	{
		int i=0;
		sprache_liste.clearEntryList();
		Iterator<BobjSprache> it1 = bobj.getSprachenDesMediums().iterator();
		while(it1.hasNext())
		{
			i++;
			BobjSprache tbs = it1.next();
			HashMap<String, String> map = new HashMap<String, String>(10);
			map.put("id",						String.valueOf(i));
			map.put("id_entity",				tbs.getId());
			map.put("user",						tbs.getUser());
			map.put("orgUser",					tbs.getOrgUser());
			map.put("xpts",						tbs.getPts());
			map.put("code", 					tbs.getCode());
			map.put("decode",					tbs.getDecode());
			map.put("sprachergaenzungCode",		tbs.getSprachergaenzungCode());
			map.put("sprachergaenzungDeCode",	tbs.getSprachergaenzungDeCode());

			Sprache ts = new Sprache();
			ts.setData(map);
			sprache_liste.getEntryList().add(ts);
		}
		
		i=0;
		klassifikation_liste.clearEntryList();
		Iterator<BobjKlassifikation> it2 = bobj.getKlassifikationenDesMediums().iterator();
		while(it2.hasNext())
		{
			i++;
			BobjKlassifikation tbs = it2.next();
			HashMap<String, String> map = new HashMap<String, String>(10);
			map.put("id",			String.valueOf(i));
			map.put("id_entity",	tbs.getId());
			map.put("user",			tbs.getUser());
			map.put("orgUser",		tbs.getOrgUser());
			map.put("xpts",			tbs.getPts());
			map.put("code", 		tbs.getCode());
			map.put("decode",		tbs.getDecode());

			Klassifikation ts = new Klassifikation();
			ts.setData(map);
			klassifikation_liste.getEntryList().add(ts);
		}

		i=0;
		sachgebiet_liste.clearEntryList();
        Iterator<BobjSachgebiet> it3 = bobj.getSachgebieteDesMediums().iterator();
        while(it3.hasNext())
        {
            i++;
            BobjSachgebiet tbs = it3.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("code",         tbs.getCode());
            map.put("decode",       tbs.getDecode());

            Sachgebiet ts = new Sachgebiet();
            ts.setData(map);
            sachgebiet_liste.getEntryList().add(ts);
        }
        
        i=0;
        freiesschlagwort_liste.clearEntryList();
        Iterator<BobjFreiesSchlagwort> it4 = bobj.getFreieSchlagworteDesMediums().iterator();
        while(it4.hasNext())
        {
            i++;
            BobjFreiesSchlagwort tbs = it4.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("bezeichnung",  tbs.getBezeichnung());

            FrSchlagwort ts = new FrSchlagwort();
            ts.setData(map);
            freiesschlagwort_liste.getEntryList().add(ts);
        }
        
        i=0;
        kontrolliertesschlagwort_liste.clearEntryList();
        Iterator<BobjKontrolliertesSchlagwort> it5 = bobj.getKontrollierteSchlagworteDesMediums().iterator();
        while(it5.hasNext())
        {
            i++;
            BobjKontrolliertesSchlagwort tbs = it5.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("code",         tbs.getCode());
            map.put("decode",       tbs.getDecode());

            KonSchlagwort ts = new KonSchlagwort();
            ts.setData(map);
            kontrolliertesschlagwort_liste.getEntryList().add(ts);
        }
        
        i=0;
        produktionsland_liste.clearEntryList();
        Iterator<BobjProduktionsland> it6 = bobj.getProduktionslaenderDesMediums().iterator();
        while(it6.hasNext())
        {
            i++;
            BobjProduktionsland tbs = it6.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("code",         tbs.getCode());
            map.put("decode",       tbs.getDecode());

            ProLand ts = new ProLand();
            ts.setData(map);
            produktionsland_liste.getEntryList().add(ts);
        }
        
        i=0;
        urheber_liste.clearEntryList();
        Iterator<BobjUrheber> it7 = bobj.getUrheberDesMediums().iterator();
        while(it7.hasNext())
        {
            i++;
            BobjUrheber tbs = it7.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("urheberFunktionCode",         tbs.getUrheberFunktionCode());
            map.put("urheberFunktionDecode",       tbs.getUrheberFunktionDecode());
            map.put("urheberFunktionZusatz",       tbs.getUrheberFunktionZusatz());
            map.put("bezeichnung",  tbs.getBezeichnung());
            
            Urheber ts = new Urheber();
            ts.setData(map);
            urheber_liste.getEntryList().add(ts);
        }
        
        i=0;
        lizenz_liste.clearEntryList();
        Iterator<BobjLizenz> it8 = bobj.getLizenzenDesMediums().iterator();
        while(it8.hasNext())
        {
            i++;
            BobjLizenz tbs = it8.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("bezeichnung",  tbs.getBezeichnung());
            map.put("webseite",     tbs.getWebseite());

            Lizenz ts = new Lizenz();
            ts.setData(map);
            lizenz_liste.getEntryList().add(ts);
        }
        
        i=0;
        lizenzpreis_liste.clearEntryList();
        Iterator<BobjLizenzpreis> it9 = bobj.getLizenzpreiseDesMediums().iterator();
        while(it9.hasNext())
        {
            i++;
            BobjLizenzpreis tbs = it9.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("beschreibung",         tbs.getBeschreibung());

            Lizenzpreis ts = new Lizenzpreis();
            ts.setData(map);
            lizenzpreis_liste.getEntryList().add(ts);
        }
        
        i=0;
        isbn_liste.clearEntryList();
        Iterator<BobjISBN> it10 = bobj.getIsbnDesMediums().iterator();
        while(it10.hasNext())
        {
            i++;
            BobjISBN tbs = it10.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("bezeichnung",         tbs.getBezeichnung());

            ISBN ts = new ISBN();
            ts.setData(map);
            isbn_liste.getEntryList().add(ts);
        }
        
        i=0;
        signatur_liste.clearEntryList();
        Iterator<BobjSignatur> it11 = bobj.getSignaturenDesMediums().iterator();
        while(it11.hasNext())
        {
            i++;
            BobjSignatur tbs = it11.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("signaturartCode",         tbs.getSignaturartCode());
            map.put("signaturartDecode",       tbs.getSignaturartDecode());
            map.put("medienartCode",         tbs.getMedienartCode());
            map.put("medienartDecode",         tbs.getMedienartDecode());
            map.put("laufendeNummer",       tbs.getLaufendeNummer());
        
            Signatur ts = new Signatur();
            ts.setData(map);
            signatur_liste.getEntryList().add(ts);
        }
        
        i=0;
        standort_liste.clearEntryList();
        Iterator<BobjStandort> it12 = bobj.getStandorteDesMediums().iterator();
        while(it12.hasNext())
        {
            i++;
            BobjStandort tbs = it12.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("code",         tbs.getCode());
            map.put("decode",       tbs.getDecode());
            map.put("signatur",     tbs.getSignatur());
            
            Standort ts = new Standort();
            ts.setData(map);
            standort_liste.getEntryList().add(ts);
        }
        
        i=0;
        adressat_liste.clearEntryList();
        Iterator<BobjAdressatenbereich> it14 = bobj.getAdressatenDesMediums().iterator();
        while(it14.hasNext())
        {
            i++;
            BobjAdressatenbereich tbs = it14.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("code",         tbs.getCode());
            map.put("decode",       tbs.getDecode());
            map.put("altersstufe",     tbs.getAltersstufe());
            
            Adressat ts = new Adressat();
            ts.setData(map);
            adressat_liste.getEntryList().add(ts);
        }
        
        updateDateienFromBobj();
	}

	public void updateDateienFromBobj()
	{
        int i=0;
        datei_liste.clearEntryList();
        Iterator<BobjDatei> it13 = bobj.getDateienDesMediums().iterator();
        while(it13.hasNext())
        {
            i++;
            BobjDatei tbs = it13.next();
            HashMap<String, String> map = new HashMap<String, String>(10);
            map.put("id",           String.valueOf(i));
            map.put("id_entity",    tbs.getId());
            map.put("user",         tbs.getUser());
            map.put("orgUser",		tbs.getOrgUser());
            map.put("xpts",         tbs.getPts());
            map.put("laufendeNummer",           tbs.getLaufendeNummer());
            map.put("dateiname",    tbs.getDateiname());
            map.put("dateigroesse", tbs.getDateigroesse());
            map.put("dateigroesseEinheitCode",  tbs.getDateigroesseEinheitCode());
            map.put("dateigroesseEinheitDecode",tbs.getDateigroesseEinheitDecode());
            map.put("format",       tbs.getFormat());
            map.put("medienverwendungCode",     tbs.getMedienverwendungCode());
            map.put("medienverwendungDecode",   tbs.getMedienverwendungDecode());
            map.put("url",          tbs.getUrl());
            map.put("urlText",      tbs.getUrlText());
            
            Datei ts = new Datei();
            ts.setData(map);
            datei_liste.getEntryList().add(ts);
        }
	}
	public void updateBobj()
	{
		bobj.setSprachenDesMediums(new ArrayList<BobjSprache>(2));
		Iterator<ComplexEntryList> it1 = sprache_liste.getEntryList().iterator();
		while(it1.hasNext())
		{
			Sprache ts = (Sprache) it1.next();
			BobjSprache tbs = new BobjSprache();
			tbs.setCode(ts.getCode());
			tbs.setDecode(ts.getDecode());
			tbs.setSprachergaenzungCode(ts.getSprachergaenzungCode());
			tbs.setSprachergaenzungDeCode(ts.getSprachergaenzungDeCode());
			tbs.setId(ts.getId_entity());
			tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
			tbs.setPts(ts.getXpts());
			tbs.setUser(ts.getUser());
			tbs.setOrgUser(ts.getOrgUser());
			bobj.getSprachenDesMediums().add(tbs);
			
		}
		
		bobj.setAdressatenDesMediums(new ArrayList<BobjAdressatenbereich>(2));
		Iterator<ComplexEntryList> it2 = adressat_liste.getEntryList().iterator();
		while(it2.hasNext())
		{
			Adressat ts = (Adressat) it2.next();
			BobjAdressatenbereich tbs = new BobjAdressatenbereich();
			tbs.setCode(ts.getCode());
			tbs.setDecode(ts.getDecode());
			tbs.setAltersstufe(ts.getAltersstufe());
			tbs.setId(ts.getId_entity());
			tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
			tbs.setPts(ts.getXpts());
			tbs.setUser(ts.getUser());
			tbs.setOrgUser(ts.getOrgUser());
			bobj.getAdressatenDesMediums().add(tbs);
		}
		
		bobj.setKlassifikationenDesMediums(new ArrayList<BobjKlassifikation>(2));
        Iterator<ComplexEntryList> it3 = klassifikation_liste.getEntryList().iterator();
        while(it3.hasNext())
        {
            Klassifikation ts = (Klassifikation) it3.next();
            BobjKlassifikation tbs = new BobjKlassifikation();
            tbs.setCode(ts.getCode());
            tbs.setDecode(ts.getDecode());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getKlassifikationenDesMediums().add(tbs);
        }
		
        bobj.setSachgebieteDesMediums(new ArrayList<BobjSachgebiet>(2));
        Iterator<ComplexEntryList> it4 = sachgebiet_liste.getEntryList().iterator();
        while(it4.hasNext())
        {
            Sachgebiet ts = (Sachgebiet) it4.next();
            BobjSachgebiet tbs = new BobjSachgebiet();
            tbs.setCode(ts.getCode());
            tbs.setDecode(ts.getDecode());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getSachgebieteDesMediums().add(tbs);
        }
        
        bobj.setFreieSchlagworteDesMediums(new ArrayList<BobjFreiesSchlagwort>(2));
        Iterator<ComplexEntryList> it5 = freiesschlagwort_liste.getEntryList().iterator();
        while(it5.hasNext())
        {
            FrSchlagwort ts = (FrSchlagwort) it5.next();
            BobjFreiesSchlagwort tbs = new BobjFreiesSchlagwort();
            tbs.setBezeichnung(ts.getBezeichnung());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getFreieSchlagworteDesMediums().add(tbs);
        }
        
        bobj.setKontrollierteSchlagworteDesMediums(new ArrayList<BobjKontrolliertesSchlagwort>(2));
        Iterator<ComplexEntryList> it6 = kontrolliertesschlagwort_liste.getEntryList().iterator();
        while(it6.hasNext())
        {
            KonSchlagwort ts = (KonSchlagwort) it6.next();
            BobjKontrolliertesSchlagwort tbs = new BobjKontrolliertesSchlagwort();
            tbs.setCode(ts.getCode());
            tbs.setDecode(ts.getDecode());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getKontrollierteSchlagworteDesMediums().add(tbs);
        }
        
        bobj.setProduktionslaenderDesMediums(new ArrayList<BobjProduktionsland>(2));
        Iterator<ComplexEntryList> it7 = produktionsland_liste.getEntryList().iterator();
        while(it7.hasNext())
        {
            ProLand ts = (ProLand) it7.next();
            BobjProduktionsland tbs = new BobjProduktionsland();
            tbs.setCode(ts.getCode());
            tbs.setDecode(ts.getDecode());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getProduktionslaenderDesMediums().add(tbs);
        }
        
        bobj.setUrheberDesMediums(new ArrayList<BobjUrheber>(2));
        Iterator<ComplexEntryList> it8 = urheber_liste.getEntryList().iterator();
        while(it8.hasNext())
        {
            Urheber ts = (Urheber) it8.next();
            BobjUrheber tbs = new BobjUrheber();
            tbs.setUrheberFunktionCode(ts.getUrheberFunktionCode());
            tbs.setUrheberFunktionDecode(ts.getUrheberFunktionDecode());
            tbs.setUrheberFunktionZusatz(ts.getUrheberFunktionZusatz());
            tbs.setBezeichnung(ts.getBezeichnung());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getUrheberDesMediums().add(tbs);
            
        }
        
        bobj.setLizenzenDesMediums(new ArrayList<BobjLizenz>(2));
        Iterator<ComplexEntryList> it9 = lizenz_liste.getEntryList().iterator();
        while(it9.hasNext())
        {
            Lizenz ts = (Lizenz) it9.next();
            BobjLizenz tbs = new BobjLizenz();
            tbs.setBezeichnung(ts.getBezeichnung());
            tbs.setWebseite(ts.getWebseite());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getLizenzenDesMediums().add(tbs);
        }
        
        bobj.setLizenzpreiseDesMediums(new ArrayList<BobjLizenzpreis>(2));
        Iterator<ComplexEntryList> it10 = lizenzpreis_liste.getEntryList().iterator();
        while(it10.hasNext())
        {
            Lizenzpreis ts = (Lizenzpreis) it10.next();
            BobjLizenzpreis tbs = new BobjLizenzpreis();
            tbs.setBeschreibung(ts.getBeschreibung());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getLizenzpreiseDesMediums().add(tbs);
        }
        
        bobj.setIsbnDesMediums(new ArrayList<BobjISBN>(2));
        Iterator<ComplexEntryList> it11 = isbn_liste.getEntryList().iterator();
        while(it11.hasNext())
        {
            ISBN ts = (ISBN) it11.next();
            BobjISBN tbs = new BobjISBN();
            tbs.setBezeichnung(ts.getBezeichnung());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getIsbnDesMediums().add(tbs);
        }
        
        bobj.setSignaturenDesMediums(new ArrayList<BobjSignatur>(2));
        Iterator<ComplexEntryList> it12 = signatur_liste.getEntryList().iterator();
        while(it12.hasNext())
        {
            Signatur ts = (Signatur) it12.next();
            BobjSignatur tbs = new BobjSignatur();
            tbs.setSignaturartCode(ts.getSignaturartCode());
            tbs.setSignaturartDecode(ts.getSignaturartDecode());
            tbs.setMedienartCode(ts.getMedienartCode());
            tbs.setMedienartDecode(ts.getMedienartDecode());
            tbs.setLaufendeNummer(ts.getLaufendeNummer());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getSignaturenDesMediums().add(tbs);
        }
        
        bobj.setStandorteDesMediums(new ArrayList<BobjStandort>(2));
        Iterator<ComplexEntryList> it13 = standort_liste.getEntryList().iterator();
        while(it13.hasNext())
        {
            Standort ts = (Standort) it13.next();
            BobjStandort tbs = new BobjStandort();
            tbs.setCode(ts.getCode());
            tbs.setDecode(ts.getDecode());
            tbs.setSignatur(ts.getSignatur());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getStandorteDesMediums().add(tbs);
        }
        
        bobj.setDateienDesMediums(new ArrayList<BobjDatei>(2));
        Iterator<ComplexEntryList> it14 = datei_liste.getEntryList().iterator();
        while(it14.hasNext())
        {
            Datei ts = (Datei) it14.next();
            BobjDatei tbs = new BobjDatei();
            tbs.setLaufendeNummer(ts.getLaufendeNummer());
            tbs.setDateiname(ts.getDateiname());
            tbs.setDateigroesse(ts.getDateigroesse());
            tbs.setDateigroesseEinheitCode(ts.getDateigroesseEinheitCode());
            tbs.setDateigroesseEinheitDecode(ts.getDateigroesseEinheitDecode());
            tbs.setFormat(ts.getFormat());
            tbs.setMedienverwendungCode(ts.getMedienverwendungCode());
            tbs.setMedienverwendungDecode(ts.getMedienverwendungDecode());
            tbs.setUrl(ts.getUrl());
            tbs.setUrlText(ts.getUrlText());
            tbs.setId(ts.getId_entity());
            tbs.setIsDeleted(ts.getDeleted());
            tbs.setIsModified(ts.getModified());
            tbs.setPts(ts.getXpts());
            tbs.setUser(ts.getUser());
            tbs.setOrgUser(ts.getOrgUser());
            bobj.getDateienDesMediums().add(tbs);
        }
	}
	
	public String getCurrentTab()
	{
		return currentTab;
	}

	public void setCurrentTab(String currentTab)
	{
		this.currentTab = currentTab;
	}

	public String getPreviousTab()
	{
		return previousTab;
	}

	public void setPreviousTab(String previousTab)
	{
		this.previousTab = previousTab;
	}

	public Boolean getIsIncompleteTab1()
	{
		return isIncompleteTab1;
	}

	public void setIsIncompleteTab1(Boolean isIncompleteTab1)
	{
		this.isIncompleteTab1 = isIncompleteTab1;
	}

	public Boolean getIsIncompleteTab2()
	{
		return isIncompleteTab2;
	}

	public void setIsIncompleteTab2(Boolean isIncompleteTab2)
	{
		this.isIncompleteTab2 = isIncompleteTab2;
	}

	public Boolean getIsIncompleteTab3()
	{
		return isIncompleteTab3;
	}

	public void setIsIncompleteTab3(Boolean isIncompleteTab3)
	{
		this.isIncompleteTab3 = isIncompleteTab3;
	}

	public Boolean getIsIncompleteTab4()
	{
		return isIncompleteTab4;
	}

	public void setIsIncompleteTab4(Boolean isIncompleteTab4)
	{
		this.isIncompleteTab4 = isIncompleteTab4;
	}

	public Boolean getIsIncompleteTab5()
	{
		return isIncompleteTab5;
	}

	public void setIsIncompleteTab5(Boolean isIncompleteTab5)
	{
		this.isIncompleteTab5 = isIncompleteTab5;
	}

	public Boolean getIsIncompleteTab6()
	{
		return isIncompleteTab6;
	}

	public void setIsIncompleteTab6(Boolean isIncompleteTab6)
	{
		this.isIncompleteTab6 = isIncompleteTab6;
	}

	public ComplexList getKlassifikation_liste()
	{
		return klassifikation_liste;
	}

	public void setKlassifikation_liste(ComplexList klassifikation_liste)
	{
		this.klassifikation_liste = klassifikation_liste;
	}

	public ComplexList getSachgebiet_liste()
	{
		return sachgebiet_liste;
	}

	public void setSachgebiet_liste(ComplexList sachgebiet_liste)
	{
		this.sachgebiet_liste = sachgebiet_liste;
	}

	public ComplexList getKontrolliertesschlagwort_liste()
	{
		return kontrolliertesschlagwort_liste;
	}

	public void setKontrolliertesschlagwort_liste(
			ComplexList kontrolliertesschlagwort_liste)
	{
		this.kontrolliertesschlagwort_liste = kontrolliertesschlagwort_liste;
	}

	public ComplexList getFreiesschlagwort_liste()
	{
		return freiesschlagwort_liste;
	}

	public void setFreiesschlagwort_liste(ComplexList freiesschlagwort_liste)
	{
		this.freiesschlagwort_liste = freiesschlagwort_liste;
	}

	public ComplexList getAdressat_liste()
	{
		return adressat_liste;
	}

	public void setAdressat_liste(ComplexList adressat_liste)
	{
		this.adressat_liste = adressat_liste;
	}

	public ComplexList getSprache_liste()
	{
		return sprache_liste;
	}

	public void setSprache_liste(ComplexList sprache_liste)
	{
		this.sprache_liste = sprache_liste;
	}

	public ComplexList getProduktionsland_liste()
	{
		return produktionsland_liste;
	}

	public void setProduktionsland_liste(ComplexList produktionsland_liste)
	{
		this.produktionsland_liste = produktionsland_liste;
	}

	public ComplexList getUrheber_liste()
	{
		return urheber_liste;
	}

	public void setUrheber_liste(ComplexList urheber_liste)
	{
		this.urheber_liste = urheber_liste;
	}

	public ComplexList getLizenz_liste()
	{
		return lizenz_liste;
	}

	public void setLizenz_liste(ComplexList lizenz_liste)
	{
		this.lizenz_liste = lizenz_liste;
	}

	public ComplexList getLizenzpreis_liste()
	{
		return lizenzpreis_liste;
	}

	public void setLizenzpreis_liste(ComplexList lizenzpreis_liste)
	{
		this.lizenzpreis_liste = lizenzpreis_liste;
	}

	public ComplexList getIsbn_liste()
	{
		return isbn_liste;
	}

	public void setIsbn_liste(ComplexList isbn_liste)
	{
		this.isbn_liste = isbn_liste;
	}

	public ComplexList getSignatur_liste()
	{
		return signatur_liste;
	}

	public void setSignatur_liste(ComplexList signatur_liste)
	{
		this.signatur_liste = signatur_liste;
	}

	public ComplexList getStandort_liste()
	{
		return standort_liste;
	}

	public void setStandort_liste(ComplexList standort_liste)
	{
		this.standort_liste = standort_liste;
	}

	public ComplexList getDatei_liste()
	{
		return datei_liste;
	}

	public void setDatei_liste(ComplexList datei_liste)
	{
		this.datei_liste = datei_liste;
	}

	public BobjMedium getBobj()
	{
		return bobj;
	}

	public void setBobj(BobjMedium bobj)
	{
		this.bobj = bobj;
	}

	public Boolean getIsIncompleteTab7()
	{
		return isIncompleteTab7;
	}

	public void setIsIncompleteTab7(Boolean isIncompleteTab7)
	{
		this.isIncompleteTab7 = isIncompleteTab7;
	}
	
    
}