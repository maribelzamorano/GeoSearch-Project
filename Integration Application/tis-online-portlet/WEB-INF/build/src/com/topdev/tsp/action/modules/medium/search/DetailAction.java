package com.topdev.tsp.action.modules.medium.search;

import java.util.ArrayList;
import java.util.List;

import com.topdev.aa.lib.Constants;
import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.medium.data.SobjMedium;

public class DetailAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;

	String suchbegriff;
	String mediumTitel;
	String mediumArtCode;
	String mediumStatusCode;
	String mediumNummer;
	String produktionsjahrVon;
	String produktionsjahrBis;
	String schlagworte;
	String sachgebiete;
	String adressaten;
	String extended;
	String clearForm;
	List<String> errorOutput;

	SobjMedium searchObj;
	
	public String search() throws Exception
	{
	    searchObj = new SobjMedium(    getUserName());
		searchObj.setSuchbegriff(		suchbegriff);
		searchObj.setMediumTitel(		mediumTitel);
		searchObj.setMediumArtCode(		mediumArtCode);
		searchObj.setMediumStatusCode(	mediumStatusCode);
		searchObj.setMediumNummer(		mediumNummer);
		searchObj.setProduktionsjahrVon(produktionsjahrVon);
		searchObj.setProduktionsjahrBis(produktionsjahrBis);
		searchObj.setSchlagworte(		schlagworte);
		searchObj.setSachgebiete(		sachgebiete);
		searchObj.setAdressaten(		adressaten);
		searchObj.setExtended(			extended);
		searchObj.setRowsMax(			"5000");
		searchObj.setCurrentPage(		"1");
		searchObj.setRowsPerPage(		"20");
		searchObj.setSortation(			Constants.SEARCH_SORTATION_TITLE);
		searchObj.setUse_ResultSet(		"0");
		errorOutput= new ArrayList<String>();
		searchObj.clearErrors();
		
	if(!Validator.isCorrectDateFormatOrEmtyYear(searchObj.getProduktionsjahrVon())){
	    searchObj.getErrors()[0]="true";
	    String loggedMsg = "Fehler: "+Message.getText("error.wrongDateFormat")+" bei Produktionsjahr Von.";
        loggedMsg=loggedMsg.replaceAll("&ouml;","ö");
        loggedMsg=loggedMsg.replaceAll("&uuml;","ü");
        loggedMsg=loggedMsg.replaceAll("&szlig;","ß");
        errorOutput.add(loggedMsg); 
	}
	else{
	    searchObj.getErrors()[0]="";
	}

    if(!Validator.isCorrectDateFormatOrEmtyYear(searchObj.getProduktionsjahrBis())){
        searchObj.getErrors()[1]="true";
        String loggedMsg = "Fehler: "+Message.getText("error.wrongDateFormat")+" bei Produktionsjahr Bis.";
        loggedMsg=loggedMsg.replaceAll("&ouml;","ö");
        loggedMsg=loggedMsg.replaceAll("&uuml;","ü");
        loggedMsg=loggedMsg.replaceAll("&szlig;","ß");
        errorOutput.add(loggedMsg); 
    }
    else{
        searchObj.getErrors()[1]="";
    }
    
    if (!searchObj.getProduktionsjahrVon().equals("") && !searchObj.getProduktionsjahrBis().equals("")){
        if(!Validator.isCorrectTimeLineYear(searchObj.getProduktionsjahrVon(), searchObj.getProduktionsjahrBis())){
            searchObj.getErrors()[2]="true";
            String loggedMsg = "Bei Produktionsjahr ist "+Message.getText("error.wrongTimeLine")+". Bitte Werte korrigieren.";
            loggedMsg=loggedMsg.replaceAll("&ouml;","ö");
            loggedMsg=loggedMsg.replaceAll("&uuml;","ü");
            loggedMsg=loggedMsg.replaceAll("&szlig;","ß");
            errorOutput.add(loggedMsg);
        }
        else{
            searchObj.getErrors()[2]="";
            searchObj.getErrors()[3]="";
        }
    }
    else{
        searchObj.getErrors()[2]="";
        searchObj.getErrors()[3]="";
    }
        
    if(searchObj.getErrors()[0].equals("") && searchObj.getErrors()[1].equals("") && searchObj.getErrors()[2].equals("") && searchObj.getErrors()[3].equals("")){
        storeSessionObject(searchObj);
        return "success";
    }
    else{
        storeSessionObject(searchObj);
        return "fault";
    }
	
	}
    public SobjMedium initSobj()
    {
        searchObj = new SobjMedium( getUserName());
        searchObj.setExtended(      "0");
        searchObj.setRowsMax(       "5000");
        searchObj.setCurrentPage(   "1");
        searchObj.setRowsPerPage(   "20");
        searchObj.clearErrors();
        return searchObj;
    }

	
	public String form() throws Exception
	{
		searchObj = (SobjMedium) getSessionObject(SobjMedium.class);
		if(searchObj==null) searchObj = initSobj();
    		
          if(!Validator.empty(getTspm()))
            {
                if(getTspm().startsWith("sachgebiete"))
                {
                    searchObj = initSobj();
                    searchObj.setSachgebiete(getTspi());
                    clearForm="1";
                }
                else if(getTspm().startsWith("adressaten"))
                {
                    searchObj = initSobj();
                    searchObj.setAdressaten(getTspi());
                    clearForm="1";
                }
                else if(getTspm().startsWith("clear"))  searchObj = initSobj();
            }
		return "success";
	}
	
	public List<String> getErrorOutput() {
        return errorOutput;
    }

    public void setErrorOutput(List<String> errorOutput) {
        this.errorOutput = errorOutput;
    }

    public String getSuchbegriff()
	{
		return suchbegriff;
	}
	public void setSuchbegriff(String suchbegriff)
	{
		this.suchbegriff = suchbegriff;
	}
	public String getMediumTitel()
	{
		return mediumTitel;
	}
	public void setMediumTitel(String mediumTitel)
	{
		this.mediumTitel = mediumTitel;
	}
	public String getMediumArtCode()
	{
		return mediumArtCode;
	}
	public void setMediumArtCode(String mediumArtCode)
	{
		this.mediumArtCode = mediumArtCode;
	}
	public String getMediumNummer()
	{
		return mediumNummer;
	}
	public void setMediumNummer(String mediumNummer)
	{
		this.mediumNummer = mediumNummer;
	}
	public String getProduktionsjahrVon()
	{
		return produktionsjahrVon;
	}
	public void setProduktionsjahrVon(String produktionsjahrVon)
	{
		this.produktionsjahrVon = produktionsjahrVon;
	}
	public String getProduktionsjahrBis()
	{
		return produktionsjahrBis;
	}
	public void setProduktionsjahrBis(String produktionsjahrBis)
	{
		this.produktionsjahrBis = produktionsjahrBis;
	}
	public String getSchlagworte()
	{
		return schlagworte;
	}
	public void setSchlagworte(String schlagworte)
	{
		this.schlagworte = schlagworte;
	}
	public String getSachgebiete()
	{
		return sachgebiete;
	}
	public void setSachgebiete(String sachgebiete)
	{
		this.sachgebiete = sachgebiete;
	}
	public SobjMedium getSearchObj()
	{
		return searchObj;
	}
	public void setSearchObj(SobjMedium searchObj)
	{
		this.searchObj = searchObj;
	}

	public String getExtended()
	{
		return extended;
	}

	public void setExtended(String extended)
	{
		this.extended = extended;
	}



	public String getMediumStatusCode()
	{
		return mediumStatusCode;
	}

	public void setMediumStatusCode(String mediumStatusCode)
	{
		this.mediumStatusCode = mediumStatusCode;
	}

    public String getAdressaten() {
        return adressaten;
    }

    public void setAdressaten(String adressaten) {
        this.adressaten = adressaten;
    }
    public String getClearForm() {
        return clearForm;
    }
    public void setClearForm(String clearForm) {
        this.clearForm = clearForm;
    }
}