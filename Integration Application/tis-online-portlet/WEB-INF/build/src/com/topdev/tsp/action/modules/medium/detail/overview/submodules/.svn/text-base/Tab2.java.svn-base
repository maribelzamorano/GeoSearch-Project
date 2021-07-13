package com.topdev.tsp.action.modules.medium.detail.overview.submodules;

import com.topdev.aa.lib.Validator;

public class Tab2
{
	public static void save(TabAction t)
	{
		if(!Validator.equals(t.anmerkungDidaktik, t.mainObject.getBobj().getAnmerkungDidaktik()))
			t.mainObject.getBobj().setAnmerkungDidaktik(t.anmerkungDidaktik);
		
		if(!Validator.equals(t.anmerkungHandhabung, t.mainObject.getBobj().getAnmerkungHandhabung()))
			t.mainObject.getBobj().setAnmerkungHandhabung(t.anmerkungHandhabung);
		
		if(!Validator.equals(t.bildliste, t.mainObject.getBobj().getBildliste()))
			t.mainObject.getBobj().setBildliste(t.bildliste);
		
		if(!Validator.equals(t.vorkenntnisse, t.mainObject.getBobj().getVorkenntnisse()))
			t.mainObject.getBobj().setVorkenntnisse(t.vorkenntnisse);
		
		if(!Validator.equals(t.lernziele, t.mainObject.getBobj().getLernziele()))
			t.mainObject.getBobj().setLernziele(t.lernziele);
	}
}