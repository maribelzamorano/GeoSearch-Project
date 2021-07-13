package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.aa.lib.Validator;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Datei extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
    private String laufendeNummer;
    private String dateiname;
    private String dateigroesse;
    private String dateigroesseEinheitCode;
    private String dateigroesseEinheitDecode;
    private String format;
    private String medienverwendungCode;
    private String medienverwendungDecode;
    private String status = "0";
    private String url;
    private String urlText;
    boolean dirty;
    
    

    


	public Datei()								{				}
	public Datei(String id)						{ setId(id);	}
	public Datei(HashMap<String, String> map)	{ setData(map);	}
	
	public boolean isDirty() {
        return dirty;
    }
    
	public void setDirty(boolean dirty) {
        this.dirty = dirty;
    }
	
	public void setData(HashMap<String, String> map)
	{
		super.setData(map);

		setEntries(new ArrayList<SimpleEntry>(10));
		getEntries().add(new SimpleEntry("laufendeNummer",			getLaufendeNummer(),		"textfield"));
		getEntries().add(new SimpleEntry("dateiname",				getDateiname(),				"textfield"));
		getEntries().add(new SimpleEntry("format",					getFormat(),				"textfield"));
		
		String usage="0";
		if(Validator.equals("9999", getMedienverwendungCode())) usage="1";
		getEntries().add(new SimpleEntry("url",	"TopdevUtil.window_open('/medium_navigation/medium-download.action" +
				"?mid='+document.getElementsByName('tspi')[0].value+'"+
				"&did=1"+
				"&name="+getDateiname()+
				"&usage="+usage+
				"&type="+getFormat()+
				"');",	getUrlText(),	"link"));
	}
	public String getLaufendeNummer()
	{
		return laufendeNummer;
	}
	public void setLaufendeNummer(String laufendeNummer)
	{
		this.laufendeNummer = laufendeNummer;
	}
	public String getDateiname()
	{
		return dateiname;
	}
	public void setDateiname(String dateiname)
	{
		this.dateiname = dateiname;
	}
	public String getDateigroesse()
	{
		return dateigroesse;
	}
	public void setDateigroesse(String dateigroesse)
	{
		this.dateigroesse = dateigroesse;
	}
	public String getDateigroesseEinheitCode()
	{
		return dateigroesseEinheitCode;
	}
	public void setDateigroesseEinheitCode(String dateigroesseEinheitCode)
	{
		this.dateigroesseEinheitCode = dateigroesseEinheitCode;
	}
	public String getDateigroesseEinheitDecode()
	{
		return dateigroesseEinheitDecode;
	}
	public void setDateigroesseEinheitDecode(String dateigroesseEinheitDecode)
	{
		this.dateigroesseEinheitDecode = dateigroesseEinheitDecode;
	}
	public String getFormat()
	{
		return format;
	}
	public void setFormat(String format)
	{
		this.format = format;
	}
	public String getMedienverwendungCode()
	{
		return medienverwendungCode;
	}
	public void setMedienverwendungCode(String medienverwendungCode)
	{
		this.medienverwendungCode = medienverwendungCode;
	}
	public String getMedienverwendungDecode()
	{
		return medienverwendungDecode;
	}
	public void setMedienverwendungDecode(String medienverwendungDecode)
	{
		this.medienverwendungDecode = medienverwendungDecode;
	}
	public String getUrl()
	{
		return url;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}
	public String getUrlText()
	{
		return urlText;
	}
	public void setUrlText(String urlText)
	{
		this.urlText = urlText;
	}
	public String getStatus()
	{
		return status;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}
}