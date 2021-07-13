package com.topdev.tsp.model.list.modules.personal_statistic;

import com.topdev.tsp.model.list.BasicList;


public class PersonalStatistic extends BasicList
{
	private static final long	serialVersionUID	= 1L;
	String gruppe;
	String geschlecht;
	Integer anzahl_teilzeit;
	Integer anzahl_vollzeit;
	Integer anzahl_gesamt;
	public Integer getAnzahl_gesamt() {
		return anzahl_gesamt;
	}
	public void setAnzahl_gesamt(Integer anzahl_gesamt) {
		this.anzahl_gesamt = anzahl_gesamt;
	}
	public Integer getAnzahl_teilzeit() {
		return anzahl_teilzeit;
	}
	public void setAnzahl_teilzeit(Integer anzahl_teilzeit) {
		this.anzahl_teilzeit = anzahl_teilzeit;
	}
	public Integer getAnzahl_vollzeit() {
		return anzahl_vollzeit;
	}
	public void setAnzahl_vollzeit(Integer anzahl_vollzeit) {
		this.anzahl_vollzeit = anzahl_vollzeit;
	}
	public String getGeschlecht() {
		return geschlecht;
	}
	public void setGeschlecht(String geschlecht) {
		this.geschlecht = geschlecht;
	}
	public String getGruppe() {
		return gruppe;
	}
	public void setGruppe(String gruppe) {
		this.gruppe = gruppe;
	}

	
	

}