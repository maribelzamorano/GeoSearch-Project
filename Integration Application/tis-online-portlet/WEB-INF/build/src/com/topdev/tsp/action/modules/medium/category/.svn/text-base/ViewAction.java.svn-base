package com.topdev.tsp.action.modules.medium.category;

import java.util.List;

import com.topdev.service.data.BobjKodierung;
import com.topdev.tsp.action.basic.BasicActionSupport;

public class ViewAction extends BasicActionSupport
{
	private static final long	serialVersionUID	= 1L;
    List<BobjKodierung> adressaten;
    List<BobjKodierung> sachgebiet;
    
	public String view() throws Exception
	{
        adressaten = com.topdev.service.mediumadr.Client.getExisting(getUserName());
        sachgebiet = com.topdev.service.mediumsachgebiet.Client.getErsteEbene(getUserName());
		return SUCCESS;
	}

    public List<BobjKodierung> getAdressaten() {
        return adressaten;
    }
    

    public void setAdressaten(List<BobjKodierung> adressaten) {
        this.adressaten = adressaten;
    }
    
    public List<BobjKodierung> getSachgebiet() {
        return sachgebiet;
    }
    

    public void setSachgebiet(List<BobjKodierung> sachgebiet) {
        this.sachgebiet = sachgebiet;
    }
       
}