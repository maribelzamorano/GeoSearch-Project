package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Submodule;
import com.topdev.aa.model.action.SubmoduleImpl;
import com.topdev.aa.object.MainObject;
import com.topdev.tsp.model.list.BasicList;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.medium.detail.overview.Datei;
import com.topdev.tsp.model.presentation.medium.MediumEditObj;

public class TabActionData extends SubmoduleImpl implements Submodule
{
	private static final long	serialVersionUID	= 1L;
	
	List<ComplexEntryList> entries;
	List<ComplexEntryList> complexEntryList;

	String			previewImageId;
	String			previewImageUrl;
	MediumEditObj	mainObject;
	String			currentTab;
	String			previousTab;
	String			action;
	Datei			entry = new Datei();
	String			id;
	String			id_entity;
	String			defaultParameters = "id,id_entity,KZ_IS_DELETED,KZ_IS_MODIFIED,user,orgUser,xpts";
	ComplexList		complexList;
	
	File	previewImage;
	String	previewImageFileName;
	String	previewImageContentType;
	
    String dokumentierendeStelleId;
    String dokumentierendeStelleBez;
    String mediumNummer;
    String mediumArtCode;
    String mediumArtDecode;
    String mediumUnterartCode;
    String mediumUnterartDecode;
    String produktionsartCode;
    String produktionsartDecode;
    String produzent;
    String produktionsjahr;
    String endabnahmejahr;
    String fskVermerkCode;
    String fskVermerkDecode;
    String feiertagsfreigabeCode;
    String feiertagsfreigabeDecode;
    String gemapflicht;
    String vorfuehrrechteBeschreibung;
    String vorfuehrrechteDatum;
    String serientitel;
    String serienuntertitel;
    String serienoriginaltitel;
    String seriensortiertitel;
    String einzeltitel;
    String einzeluntertitel;
    String einzeloriginaltitel;
    String einzelsortiertitel;
    String lernziele;
    String vorkenntnisse;
    String inhalt;
    String kurzinhalt;
    String serienbeschreibung;
    String bildliste;
    String erfahrungsbericht;
    String anmerkungDidaktik;
    String anmerkungHandhabung;
    String auszeichnungen;
    String anzahlLaufzeitFarben;
    String systemvoraussetzungen;
    String begleitmaterial;
    String internetlinks;
    String kontextmedien;
    String herausgeber;
    String preis;
    String verfuegbarkeitAnfang;
    String verfuegbarkeitEnde;
    String verleihEnde;
    String vertrieb;
    String ausstrahlungsdatenSchulfernsehen;
    String mediumStatusCode;
    String mediumStatusDecode;
    String erschliesser;
    String freigabeDatum;
    String letzteAenderung;
    String bemerkungen;
    String downloadZaehler;
    String isGemaPflicht;
    String isOeffentlich;

	String finalizeMainObject()
	{
		if(Validator.empty(action)) action = "";
		if(action.equals("insert")) action = "edit";
		if(action.equals("undo"))	action = "list";
		if(action.equals("save"))	action = "list";
		mainObject.setIsIncompleteTab1(false);
		mainObject.setIsIncompleteTab2(false);
		mainObject.setIsIncompleteTab3(false);
		mainObject.setIsIncompleteTab4(false);
		mainObject.setIsIncompleteTab5(false);
		mainObject.setIsIncompleteTab6(false);
		mainObject.setIsIncompleteTab7(false);

		if(!Validator.equals(action,"edit"))
		{
			if(Validator.isEmpty(mainObject.getBobj().getMediumNummer()))				mainObject.setIsIncompleteTab1(true);
			if(Validator.isEmpty(mainObject.getBobj().getDokumentierendeStelleId()))	mainObject.setIsIncompleteTab1(true);
			if(Validator.isEmpty(mainObject.getBobj().getMediumArtCode()))				mainObject.setIsIncompleteTab1(true);
			if(Validator.isEmpty(mainObject.getBobj().getEinzeltitel()))				mainObject.setIsIncompleteTab1(true);
			if(Validator.isEmpty(mainObject.getBobj().getMediumStatusCode()))			mainObject.setIsIncompleteTab5(true);
		}
		if(mainObject.getErrors().size()>0) return "tab"+previousTab;
		mainObject.setCurrentTab(currentTab);
		mainObject.setPreviousTab(previousTab);
		return "tab"+currentTab+(Validator.empty(action)?"":("-"+action));
	}
	
	
	@SuppressWarnings("unchecked")
	public HashMap<String, String> getActionParameters()
	{
		HashMap<String,String> map = new HashMap<String, String>(10);
		Map<String, String[]> t_map = ActionContext.getContext().getParameters();
		String key = null;
		String[] s = null;
		try
		{
			Iterator<String> it = t_map.keySet().iterator();
			while(it.hasNext())
			{
				try
				{
					key = (String) it.next();
					s = t_map.get(key);
					if(s!=null && s.length>0)
						map.put(key, s[0]);
				} catch (Exception e1)
				{
					getLog().debug("Fehler bei Parameterauswertung (01): "+e1.getLocalizedMessage());
				}
			}
		} catch(Exception e2)
		{
			getLog().debug("Fehler bei Parameterauswertung (02): "+e2.getLocalizedMessage());
		}
		return map;
	}
	
	@SuppressWarnings("unchecked")
	public List<HashMap<String, String>> getActionParameterMaps(String namePrefix, String names)
	{
		List<String> tp = Arrays.asList(names.split(","));
		List<HashMap<String, String>> results = new ArrayList<HashMap<String,String>>(10);
		try
		{
			if(tp==null || tp.size()<1) return null;
			Map<String, String[]> mMap = ActionContext.getContext().getParameters();
			int tSize = mMap.get(namePrefix+tp.get(0)).length;
			for(int i=0; i<tSize; i++)
			{
				try
				{
					HashMap<String, String> tMap = new HashMap<String, String>(tp.size());
					Iterator<String> it = tp.iterator();
					while(it.hasNext())
					{
						String tName = it.next();
                        String tStoreName = tName;
//						System.out.println("getActionParameterMaps i:"+i+", tName:"+tName+", mMap.get(tName)[i]:"+mMap.get(tName)[i]);
                        if(Validator.equals(tName, "KZ_IS_DELETED"))     tStoreName="deleted";
                        if(Validator.equals(tName, "KZ_IS_MODIFIED"))    tStoreName="modified";
                        if(mMap.get(namePrefix+tName)!=null)
                        	tMap.put(tStoreName, mMap.get(namePrefix+tName)[i]);
					}
					results.add(tMap);
				}
				catch (Exception e1)
				{
					getLog().debug("Fehler bei Parameterauswertung (getActionParameterMaps): "+e1.getLocalizedMessage());
				}
			}
		}
		catch (Exception e2)
		{
			getLog().error("Fehler bei Parameterauswertung (getActionParameterMaps): "+e2.getLocalizedMessage());
		}
		return results;
	}

	
	public String getMaxId(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		int i, max = 0;
		while(it.hasNext())
		{
			BasicList cel = it.next();
			i = Integer.parseInt(cel.getId());
			if(i>max) max=i;
		}
		return String.valueOf(max+1);
	}

	public ComplexEntryList getElementById(List<ComplexEntryList> list)
	{
		Iterator<ComplexEntryList> it = list.iterator();
		while(it.hasNext())
		{
			ComplexEntryList cel = it.next();
			if(cel.getId().equals(id))
				return cel;
		}
		return null;
	}
	


	public MainObject getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(MainObject mainObject)
	{
		this.mainObject = (MediumEditObj)mainObject;
	}
	public void setMainObject(MediumEditObj mainObject)
	{
		this.mainObject = mainObject;
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
	public String getDokumentierendeStelleId()
	{
		return dokumentierendeStelleId;
	}
	public void setDokumentierendeStelleId(String dokumentierendeStelleId)
	{
		this.dokumentierendeStelleId = dokumentierendeStelleId;
	}
	public String getDokumentierendeStelleBez()
	{
		return dokumentierendeStelleBez;
	}
	public void setDokumentierendeStelleBez(String dokumentierendeStelleBez)
	{
		this.dokumentierendeStelleBez = dokumentierendeStelleBez;
	}
	public String getMediumNummer()
	{
		return mediumNummer;
	}
	public void setMediumNummer(String mediumNummer)
	{
		this.mediumNummer = mediumNummer;
	}
	public String getMediumArtCode()
	{
		return mediumArtCode;
	}
	public void setMediumArtCode(String mediumArtCode)
	{
		this.mediumArtCode = mediumArtCode;
	}
	public String getMediumArtDecode()
	{
		return mediumArtDecode;
	}
	public void setMediumArtDecode(String mediumArtDecode)
	{
		this.mediumArtDecode = mediumArtDecode;
	}
	public String getMediumUnterartCode()
	{
		return mediumUnterartCode;
	}
	public void setMediumUnterartCode(String mediumUnterartCode)
	{
		this.mediumUnterartCode = mediumUnterartCode;
	}
	public String getMediumUnterartDecode()
	{
		return mediumUnterartDecode;
	}
	public void setMediumUnterartDecode(String mediumUnterartDecode)
	{
		this.mediumUnterartDecode = mediumUnterartDecode;
	}
	public String getProduktionsartCode()
	{
		return produktionsartCode;
	}
	public void setProduktionsartCode(String produktionsartCode)
	{
		this.produktionsartCode = produktionsartCode;
	}
	public String getProduktionsartDecode()
    {
        return produktionsartDecode;
    }
    public void setProduktionsartDecode(String produktionsartDecode)
    {
        this.produktionsartDecode = produktionsartDecode;
    }
	public String getProduzent()
	{
		return produzent;
	}
	public void setProduzent(String produzent)
	{
		this.produzent = produzent;
	}
	public String getProduktionsjahr()
	{
		return produktionsjahr;
	}
	public void setProduktionsjahr(String produktionsjahr)
	{
		this.produktionsjahr = produktionsjahr;
	}
	public String getEndabnahmejahr()
	{
		return endabnahmejahr;
	}
	public void setEndabnahmejahr(String endabnahmejahr)
	{
		this.endabnahmejahr = endabnahmejahr;
	}
	public String getFskVermerkCode()
	{
		return fskVermerkCode;
	}
	public void setFskVermerkCode(String fskVermerkCode)
	{
		this.fskVermerkCode = fskVermerkCode;
	}
	public String getFskVermerkDecode()
	{
		return fskVermerkDecode;
	}
	public void setFskVermerkDecode(String fskVermerkDecode)
	{
		this.fskVermerkDecode = fskVermerkDecode;
	}
	public String getFeiertagsfreigabeCode()
	{
		return feiertagsfreigabeCode;
	}
	public void setFeiertagsfreigabeCode(String feiertagsfreigabeCode)
	{
		this.feiertagsfreigabeCode = feiertagsfreigabeCode;
	}
	public String getFeiertagsfreigabeDecode()
	{
		return feiertagsfreigabeDecode;
	}
	public void setFeiertagsfreigabeDecode(String feiertagsfreigabeDecode)
	{
		this.feiertagsfreigabeDecode = feiertagsfreigabeDecode;
	}
	public String getGemapflicht()
	{
		return gemapflicht;
	}
	public void setGemapflicht(String gemapflicht)
	{
		this.gemapflicht = gemapflicht;
	}
	public String getVorfuehrrechteBeschreibung()
	{
		return vorfuehrrechteBeschreibung;
	}
	public void setVorfuehrrechteBeschreibung(String vorfuehrrechteBeschreibung)
	{
		this.vorfuehrrechteBeschreibung = vorfuehrrechteBeschreibung;
	}
	public String getVorfuehrrechteDatum()
	{
		return vorfuehrrechteDatum;
	}
	public void setVorfuehrrechteDatum(String vorfuehrrechteDatum)
	{
		this.vorfuehrrechteDatum = vorfuehrrechteDatum;
	}
	public String getSerientitel()
	{
		return serientitel;
	}
	public void setSerientitel(String serientitel)
	{
		this.serientitel = serientitel;
	}
	public String getSerienuntertitel()
	{
		return serienuntertitel;
	}
	public void setSerienuntertitel(String serienuntertitel)
	{
		this.serienuntertitel = serienuntertitel;
	}
	public String getSerienoriginaltitel()
	{
		return serienoriginaltitel;
	}
	public void setSerienoriginaltitel(String serienoriginaltitel)
	{
		this.serienoriginaltitel = serienoriginaltitel;
	}
	public String getSeriensortiertitel()
	{
		return seriensortiertitel;
	}
	public void setSeriensortiertitel(String seriensortiertitel)
	{
		this.seriensortiertitel = seriensortiertitel;
	}
	public String getEinzeltitel()
	{
		return einzeltitel;
	}
	public void setEinzeltitel(String einzeltitel)
	{
		this.einzeltitel = einzeltitel;
	}
	public String getEinzeluntertitel()
	{
		return einzeluntertitel;
	}
	public void setEinzeluntertitel(String einzeluntertitel)
	{
		this.einzeluntertitel = einzeluntertitel;
	}
	public String getEinzeloriginaltitel()
	{
		return einzeloriginaltitel;
	}
	public void setEinzeloriginaltitel(String einzeloriginaltitel)
	{
		this.einzeloriginaltitel = einzeloriginaltitel;
	}
	public String getEinzelsortiertitel()
	{
		return einzelsortiertitel;
	}
	public void setEinzelsortiertitel(String einzelsortiertitel)
	{
		this.einzelsortiertitel = einzelsortiertitel;
	}
	public String getLernziele()
	{
		return lernziele;
	}
	public void setLernziele(String lernziele)
	{
		this.lernziele = lernziele;
	}
	public String getVorkenntnisse()
	{
		return vorkenntnisse;
	}
	public void setVorkenntnisse(String vorkenntnisse)
	{
		this.vorkenntnisse = vorkenntnisse;
	}
	public String getInhalt()
	{
		return inhalt;
	}
	public void setInhalt(String inhalt)
	{
		this.inhalt = inhalt;
	}
	public String getKurzinhalt()
	{
		return kurzinhalt;
	}
	public void setKurzinhalt(String kurzinhalt)
	{
		this.kurzinhalt = kurzinhalt;
	}
	public String getSerienbeschreibung()
	{
		return serienbeschreibung;
	}
	public void setSerienbeschreibung(String serienbeschreibung)
	{
		this.serienbeschreibung = serienbeschreibung;
	}
	public String getBildliste()
	{
		return bildliste;
	}
	public void setBildliste(String bildliste)
	{
		this.bildliste = bildliste;
	}
	public String getErfahrungsbericht()
	{
		return erfahrungsbericht;
	}
	public void setErfahrungsbericht(String erfahrungsbericht)
	{
		this.erfahrungsbericht = erfahrungsbericht;
	}
	public String getAnmerkungDidaktik()
	{
		return anmerkungDidaktik;
	}
	public void setAnmerkungDidaktik(String anmerkungDidaktik)
	{
		this.anmerkungDidaktik = anmerkungDidaktik;
	}
	public String getAnmerkungHandhabung()
	{
		return anmerkungHandhabung;
	}
	public void setAnmerkungHandhabung(String anmerkungHandhabung)
	{
		this.anmerkungHandhabung = anmerkungHandhabung;
	}
	public String getAuszeichnungen()
	{
		return auszeichnungen;
	}
	public void setAuszeichnungen(String auszeichnungen)
	{
		this.auszeichnungen = auszeichnungen;
	}
	public String getAnzahlLaufzeitFarben()
	{
		return anzahlLaufzeitFarben;
	}
	public void setAnzahlLaufzeitFarben(String anzahlLaufzeitFarben)
	{
		this.anzahlLaufzeitFarben = anzahlLaufzeitFarben;
	}
	public String getSystemvoraussetzungen()
	{
		return systemvoraussetzungen;
	}
	public void setSystemvoraussetzungen(String systemvoraussetzungen)
	{
		this.systemvoraussetzungen = systemvoraussetzungen;
	}
	public String getBegleitmaterial()
	{
		return begleitmaterial;
	}
	public void setBegleitmaterial(String begleitmaterial)
	{
		this.begleitmaterial = begleitmaterial;
	}
	public String getInternetlinks()
	{
		return internetlinks;
	}
	public void setInternetlinks(String internetlinks)
	{
		this.internetlinks = internetlinks;
	}

	public String getHerausgeber()
	{
		return herausgeber;
	}
	public void setHerausgeber(String herausgeber)
	{
		this.herausgeber = herausgeber;
	}
	public String getPreis()
	{
		return preis;
	}
	public void setPreis(String preis)
	{
		this.preis = preis;
	}
	public String getVerfuegbarkeitAnfang()
	{
		return verfuegbarkeitAnfang;
	}
	public void setVerfuegbarkeitAnfang(String verfuegbarkeitAnfang)
	{
		this.verfuegbarkeitAnfang = verfuegbarkeitAnfang;
	}
	public String getVerfuegbarkeitEnde()
	{
		return verfuegbarkeitEnde;
	}
	public void setVerfuegbarkeitEnde(String verfuegbarkeitEnde)
	{
		this.verfuegbarkeitEnde = verfuegbarkeitEnde;
	}
	public String getVerleihEnde()
	{
		return verleihEnde;
	}
	public void setVerleihEnde(String verleihEnde)
	{
		this.verleihEnde = verleihEnde;
	}
	public String getVertrieb()
	{
		return vertrieb;
	}
	public void setVertrieb(String vertrieb)
	{
		this.vertrieb = vertrieb;
	}
	public String getAusstrahlungsdatenSchulfernsehen()
	{
		return ausstrahlungsdatenSchulfernsehen;
	}
	public void setAusstrahlungsdatenSchulfernsehen(
			String ausstrahlungsdatenSchulfernsehen)
	{
		this.ausstrahlungsdatenSchulfernsehen = ausstrahlungsdatenSchulfernsehen;
	}
	public String getMediumStatusCode()
	{
		return mediumStatusCode;
	}
	public void setMediumStatusCode(String mediumStatusCode)
	{
		this.mediumStatusCode = mediumStatusCode;
	}
	public String getMediumStatusDecode()
	{
		return mediumStatusDecode;
	}
	public void setMediumStatusDecode(String mediumStatusDecode)
	{
		this.mediumStatusDecode = mediumStatusDecode;
	}
	public String getErschliesser()
	{
		return erschliesser;
	}
	public void setErschliesser(String erschliesser)
	{
		this.erschliesser = erschliesser;
	}
	public String getFreigabeDatum()
	{
		return freigabeDatum;
	}
	public void setFreigabeDatum(String freigabeDatum)
	{
		this.freigabeDatum = freigabeDatum;
	}
	public String getLetzteAenderung()
	{
		return letzteAenderung;
	}
	public void setLetzteAenderung(String letzteAenderung)
	{
		this.letzteAenderung = letzteAenderung;
	}
	public String getBemerkungen()
	{
		return bemerkungen;
	}
	public void setBemerkungen(String bemerkungen)
	{
		this.bemerkungen = bemerkungen;
	}
	public String getDownloadZaehler()
	{
		return downloadZaehler;
	}
	public void setDownloadZaehler(String downloadZaehler)
	{
		this.downloadZaehler = downloadZaehler;
	}

	public String getKontextmedien()
	{
		return kontextmedien;
	}

	public void setKontextmedien(String kontextmedien)
	{
		this.kontextmedien = kontextmedien;
	}

	public ComplexList getComplexList()
	{
		return complexList;
	}

	public void setComplexList(ComplexList complexList)
	{
		this.complexList = complexList;
	}

	public List<ComplexEntryList> getComplexEntryList()
	{
		return complexEntryList;
	}

	public void setComplexEntryList(List<ComplexEntryList> complexEntryList)
	{
		this.complexEntryList = complexEntryList;
	}

	public String getAction()
	{
		return action;
	}

	public void setAction(String action)
	{
		this.action = action;
	}

	public Datei getEntry()
	{
		return entry;
	}

	public void setEntry(Datei entry)
	{
		this.entry = entry;
	}

	public List<ComplexEntryList> getEntries()
	{
		return entries;
	}

	public void setEntries(List<ComplexEntryList> entries)
	{
		this.entries = entries;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getId_entity()
	{
		return id_entity;
	}

	public void setId_entity(String id_entity)
	{
		this.id_entity = id_entity;
	}
	public String getIsGemaPflicht()
    {
        return isGemaPflicht;
    }
    public void setIsGemaPflicht(String isGemaPflicht)
    {
        this.isGemaPflicht = isGemaPflicht;
    }
    public String getIsOeffentlich()
    {
        return isOeffentlich;
    }
    public void setIsOeffentlich(String isOeffentlich)
    {
        this.isOeffentlich = isOeffentlich;
    }


	public File getPreviewImage()
	{
		return previewImage;
	}


	public void setPreviewImage(File previewImage)
	{
		this.previewImage = previewImage;
	}


	public String getPreviewImageFileName()
	{
		return previewImageFileName;
	}


	public void setPreviewImageFileName(String previewImageFileName)
	{
		this.previewImageFileName = previewImageFileName;
	}


	public String getPreviewImageContentType()
	{
		return previewImageContentType;
	}


	public void setPreviewImageContentType(String previewImageContentType)
	{
		this.previewImageContentType = previewImageContentType;
	}


	public String getPreviewImageUrl()
	{
		return previewImageUrl;
	}


	public void setPreviewImageUrl(String previewImageUrl)
	{
		this.previewImageUrl = previewImageUrl;
	}


	public String getPreviewImageId()
	{
		return previewImageId;
	}


	public void setPreviewImageId(String previewImageId)
	{
		this.previewImageId = previewImageId;
	}
}