package com.topdev.tsp.model.list.modules.medium.detail.overview;

import java.util.ArrayList;
import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.simple.SimpleEntry;

public class Signatur extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;
	private String signaturartCode;
    private String signaturartDecode;
    private String medienartCode;
    private String medienartDecode;
    private String laufendeNummer;
    boolean dirty;
    
    

    
    
	public Signatur()								{				}
	public Signatur(String id)						{ setId(id);	}
	public Signatur(HashMap<String, String> map)	{ setData(map);	}
	
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
		getEntries().add(new SimpleEntry("signaturartDecode",			getSignaturartDecode(),	          	"dropdown"));
		getEntries().add(new SimpleEntry("signaturartCode",         getSignaturartCode(),                   "dropdown"));
		getEntries().add(new SimpleEntry("medienartDecode",				getMedienartDecode(),				"dropdown"));
		getEntries().add(new SimpleEntry("medienartCode",               getMedienartCode(),                 "dropdown"));
		getEntries().add(new SimpleEntry("laufendeNummer",					getLaufendeNummer(),			"textfield"));
	}
	public String getSignaturartCode() {
        return signaturartCode;
    }
    public void setSignaturartCode(String signaturartCode) {
        this.signaturartCode = signaturartCode;
    }
    public String getSignaturartDecode() {
        return signaturartDecode;
    }
    public void setSignaturartDecode(String signaturartDecode) {
        this.signaturartDecode = signaturartDecode;
    }
    public String getMedienartCode() {
        return medienartCode;
    }
    public void setMedienartCode(String medienartCode) {
        this.medienartCode = medienartCode;
    }
    public String getMedienartDecode() {
        return medienartDecode;
    }
    public void setMedienartDecode(String medienartDecode) {
        this.medienartDecode = medienartDecode;
    }
    public String getLaufendeNummer() {
        return laufendeNummer;
    }
    public void setLaufendeNummer(String laufendeNummer) {
        this.laufendeNummer = laufendeNummer;
    }
}