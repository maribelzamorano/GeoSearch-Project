package com.topdev.tsp.model.list.modules.system;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;

public class SystemEntry extends ComplexEntryList
{
	private static final long	serialVersionUID	= 1L;

	ComplexList	select_liste;

	public SystemEntry()								{ initSublists(); 				}
	public SystemEntry(String id)						{ setId(id); initSublists();	}
	public SystemEntry(HashMap<String, String> map)	{ setData(map); initSublists();	}

	public void initSublists()
	{
		select_liste = new ComplexList();
		select_liste.getHeadingList().add(new ComplexHeading("Auswahlliste"));
	}
	public ComplexList getSelect_liste()
	{
		return select_liste;
	}
	public void setSelect_liste(ComplexList select_liste)
	{
		this.select_liste = select_liste;
	}

}