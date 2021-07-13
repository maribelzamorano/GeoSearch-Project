package com.topdev.tsp.action.modules.media.submodules;


import java.util.List;

import com.topdev.tsp.action.modules.media.DetailAction;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.media.MediaITRoom;

public class ITRoomDetailAction extends DetailAction
{
	private static final long	serialVersionUID	= 1L;
	MediaITRoom	roomEntry;
	List<ComplexEntryList> entries;


	public void init(String aktion) throws Exception
	{
		super.init(aktion);
		entries = getMainObject().getComputerList().getEntryList();
		roomEntry = (MediaITRoom) getElementById(entries);
		if(roomEntry==null) roomEntry = new MediaITRoom();
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


	public MediaITRoom getRoomEntry() {
		return roomEntry;
	}


	public void setRoomEntry(MediaITRoom roomEntry) {
		this.roomEntry = roomEntry;
	}

	
	

}