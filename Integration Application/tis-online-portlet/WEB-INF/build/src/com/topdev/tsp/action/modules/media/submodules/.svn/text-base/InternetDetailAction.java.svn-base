package com.topdev.tsp.action.modules.media.submodules;


import java.util.List;

import com.topdev.tsp.action.modules.media.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.media.MediaInternet;

public class InternetDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	MediaInternet			internetEntry;
	List<ComplexEntryList>	 entries;


	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getInternetList().getEntryList();
		internetEntry = (MediaInternet) getElementById(entries);
		if(internetEntry==null) internetEntry = new MediaInternet();
	}


	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}


	public List<ComplexEntryList> getEntries() {
		return entries;
	}


	public void setEntries(List<ComplexEntryList> entries) {
		this.entries = entries;
	}


	public MediaInternet getInternetEntry() {
		return internetEntry;
	}


	public void setInternetEntry(MediaInternet internetEntry) {
		this.internetEntry = internetEntry;
	}


	
	
	
	

}