package com.topdev.tsp.action.modules.media.submodules;


import java.util.List;

import com.topdev.tsp.action.modules.media.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.media.MediaComputer;

public class ComputerDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	MediaComputer	computerEntry;
	List<ComplexEntryList> entries;


	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getComputerList().getEntryList();
		computerEntry = (MediaComputer) getElementById(entries);
		if(computerEntry==null) computerEntry = new MediaComputer();
	}


	public String execute() throws Exception
	{
		return view();
	}
	public String view() throws Exception
    {
		return edit();
	}


	public MediaComputer getComputerEntry() {
		return computerEntry;
	}


	public void setComputerEntry(MediaComputer computerEntry) {
		this.computerEntry = computerEntry;
	}


	public List<ComplexEntryList> getEntries() {
		return entries;
	}


	public void setEntries(List<ComplexEntryList> entries) {
		this.entries = entries;
	}

	
	
	

}