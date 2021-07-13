package com.topdev.tsp.model.list.modules.neuter_resources;

import java.util.HashMap;

import com.topdev.tsp.model.list.complex.ComplexEntryList;

public class NeuterResourcesSport extends ComplexEntryList 
{
	private static final long	serialVersionUID	= 1L;
	String sportstaettenart;
	String sportstaettenart_code;
	String erreichbarkeit;
	String groesse;
	String ausstattung;
	String entfernung;
	String beschreibung;
	String beschreibung_code;

	public NeuterResourcesSport()								{				}
	public NeuterResourcesSport(String id)						{ setId(id);	}
	public NeuterResourcesSport(HashMap<String, String> map)	{ setData(map);	}


	public String getAusstattung() {
		return ausstattung;
	}
	public void setAusstattung(String ausstattung) {
		this.ausstattung = ausstattung;
	}
	public String getBeschreibung() {
		return beschreibung;
	}
	public void setBeschreibung(String beschreibung) {
		this.beschreibung = beschreibung;
	}
	public String getEntfernung() {
		return entfernung;
	}
	public void setEntfernung(String entfernung) {
		this.entfernung = entfernung;
	}
	public String getErreichbarkeit() {
		return erreichbarkeit;
	}
	public void setErreichbarkeit(String erreichbarkeit) {
		this.erreichbarkeit = erreichbarkeit;
	}
	public String getGroesse() {
		return groesse;
	}
	public void setGroesse(String groesse) {
		this.groesse = groesse;
	}
	public String getSportstaettenart() {
		return sportstaettenart;
	}
	public void setSportstaettenart(String sportstaettenart) {
		this.sportstaettenart = sportstaettenart;
	}
	public String getBeschreibung_code() {
		return beschreibung_code;
	}
	public void setBeschreibung_code(String beschreibung_code) {
		this.beschreibung_code = beschreibung_code;
	}

	public String getSportstaettenart_code() {
		return sportstaettenart_code;
	}
	public void setSportstaettenart_code(String sportstaettenart_code) {
		this.sportstaettenart_code = sportstaettenart_code;
	}
}