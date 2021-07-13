package com.topdev.aa.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class User implements Serializable
{
	private static final long serialVersionUID = 1L;
	public boolean	login				=false;
	public String	login_id			=null;

	public String	gepa_titel			=null;
	public String	gepa_name_12		=null;
	public String	gepa_strv_name		=null;
	public String	gepa_ortv_name		=null;
	public String	gepa_komm_telefon	=null;
	public String	gepa_komm_telefax	=null;
	public String	gepa_komm_mail		=null;
	public String	dien_name_12		=null;
	public String	dien_strv_name		=null;
	public String	dien_ortv_name		=null;
	public String	dien_komm_telefon	=null;
	public String	dien_komm_telefax	=null;
	public String	dien_komm_mail		=null;

	public String	schu_bezeichnung	=null;
	public String	vesg_thema_anzeige	=null;
	public String	gepa_id				=null;
	public String	pers_reda_referenzen=null;	

	public String	gpar_code			=null;	
	public String	gpar_decode			=null;	
	public String	buea_kz_exist		=null;	
	public List		authorizations		=new ArrayList();
	public String	GPST_CODE;
	public String	GPST_DECODE;
	
	
	

	public String	getlogin_id() { return this.login_id; }
	public String	getgepa_titel() { return this.gepa_titel; }
	public String	getgepa_name_12() { return this.gepa_name_12; }
	public String	getgepa_strv_name() { return this.gepa_strv_name; }
	public String	getgepa_ortv_name() { return this.gepa_ortv_name; }
	public String	getgepa_komm_telefon() { return this.gepa_komm_telefon; }
	public String	getgepa_komm_telefax() { return this.gepa_komm_telefax; }
	public String	getgepa_komm_mail() { return this.gepa_komm_mail; }
	public String	getdien_name_12() { return this.dien_name_12; }
	public String	getdien_strv_name() { return this.dien_strv_name; }
	public String	getdien_ortv_name() { return this.dien_ortv_name; }
	public String	getdien_komm_telefon() { return this.dien_komm_telefon; }
	public String	getdien_komm_telefax() { return this.dien_komm_telefax; }
	public String	getdien_komm_mail() { return this.dien_komm_mail; }

	public String	getschu_bezeichnung() { return this.schu_bezeichnung; }
	public String	getvesg_thema_anzeige() { return this.vesg_thema_anzeige; }
	public String	getgepa_id() { return this.gepa_id; }
	public String	getgpar_code() { return this.gpar_code; }
	public String	getgpar_decode() { return this.gpar_decode; }
	public String	getbuea_kz_exist() { return this.buea_kz_exist; }

	public String	getpers_reda_referenzen() { return this.pers_reda_referenzen; }

	
	
	
	
	/**
	 * @return Returns the authorizations.
	 */
	public List getAuthorizations() {
		return authorizations;
	}
	/**
	 * @param authorizations The authorizations to set.
	 */
	public void setAuthorizations(List authorizations) {
		this.authorizations = authorizations;
	}
	/**
	 * @return Returns the buea_kz_exist.
	 */
	public String getBuea_kz_exist() {
		return buea_kz_exist;
	}
	/**
	 * @param buea_kz_exist The buea_kz_exist to set.
	 */
	public void setBuea_kz_exist(String buea_kz_exist) {
		this.buea_kz_exist = buea_kz_exist;
	}
	/**
	 * @return Returns the dien_komm_mail.
	 */
	public String getDien_komm_mail() {
		return dien_komm_mail;
	}
	/**
	 * @param dien_komm_mail The dien_komm_mail to set.
	 */
	public void setDien_komm_mail(String dien_komm_mail) {
		this.dien_komm_mail = dien_komm_mail;
	}
	/**
	 * @return Returns the dien_komm_telefax.
	 */
	public String getDien_komm_telefax() {
		return dien_komm_telefax;
	}
	/**
	 * @param dien_komm_telefax The dien_komm_telefax to set.
	 */
	public void setDien_komm_telefax(String dien_komm_telefax) {
		this.dien_komm_telefax = dien_komm_telefax;
	}
	/**
	 * @return Returns the dien_komm_telefon.
	 */
	public String getDien_komm_telefon() {
		return dien_komm_telefon;
	}
	/**
	 * @param dien_komm_telefon The dien_komm_telefon to set.
	 */
	public void setDien_komm_telefon(String dien_komm_telefon) {
		this.dien_komm_telefon = dien_komm_telefon;
	}
	/**
	 * @return Returns the dien_name_12.
	 */
	public String getDien_name_12() {
		return dien_name_12;
	}
	/**
	 * @param dien_name_12 The dien_name_12 to set.
	 */
	public void setDien_name_12(String dien_name_12) {
		this.dien_name_12 = dien_name_12;
	}
	/**
	 * @return Returns the dien_ortv_name.
	 */
	public String getDien_ortv_name() {
		return dien_ortv_name;
	}
	/**
	 * @param dien_ortv_name The dien_ortv_name to set.
	 */
	public void setDien_ortv_name(String dien_ortv_name) {
		this.dien_ortv_name = dien_ortv_name;
	}
	/**
	 * @return Returns the dien_strv_name.
	 */
	public String getDien_strv_name() {
		return dien_strv_name;
	}
	/**
	 * @param dien_strv_name The dien_strv_name to set.
	 */
	public void setDien_strv_name(String dien_strv_name) {
		this.dien_strv_name = dien_strv_name;
	}
	/**
	 * @return Returns the gepa_id.
	 */
	public String getGepa_id() {
		return gepa_id;
	}
	/**
	 * @param gepa_id The gepa_id to set.
	 */
	public void setGepa_id(String gepa_id) {
		this.gepa_id = gepa_id;
	}
	/**
	 * @return Returns the gepa_komm_mail.
	 */
	public String getGepa_komm_mail() {
		return gepa_komm_mail;
	}
	/**
	 * @param gepa_komm_mail The gepa_komm_mail to set.
	 */
	public void setGepa_komm_mail(String gepa_komm_mail) {
		this.gepa_komm_mail = gepa_komm_mail;
	}
	/**
	 * @return Returns the gepa_komm_telefax.
	 */
	public String getGepa_komm_telefax() {
		return gepa_komm_telefax;
	}
	/**
	 * @param gepa_komm_telefax The gepa_komm_telefax to set.
	 */
	public void setGepa_komm_telefax(String gepa_komm_telefax) {
		this.gepa_komm_telefax = gepa_komm_telefax;
	}
	/**
	 * @return Returns the gepa_komm_telefon.
	 */
	public String getGepa_komm_telefon() {
		return gepa_komm_telefon;
	}
	/**
	 * @param gepa_komm_telefon The gepa_komm_telefon to set.
	 */
	public void setGepa_komm_telefon(String gepa_komm_telefon) {
		this.gepa_komm_telefon = gepa_komm_telefon;
	}
	/**
	 * @return Returns the gepa_name_12.
	 */
	public String getGepa_name_12() {
		return gepa_name_12;
	}
	/**
	 * @param gepa_name_12 The gepa_name_12 to set.
	 */
	public void setGepa_name_12(String gepa_name_12) {
		this.gepa_name_12 = gepa_name_12;
	}
	/**
	 * @return Returns the gepa_ortv_name.
	 */
	public String getGepa_ortv_name() {
		return gepa_ortv_name;
	}
	/**
	 * @param gepa_ortv_name The gepa_ortv_name to set.
	 */
	public void setGepa_ortv_name(String gepa_ortv_name) {
		this.gepa_ortv_name = gepa_ortv_name;
	}
	/**
	 * @return Returns the gepa_strv_name.
	 */
	public String getGepa_strv_name() {
		return gepa_strv_name;
	}
	/**
	 * @param gepa_strv_name The gepa_strv_name to set.
	 */
	public void setGepa_strv_name(String gepa_strv_name) {
		this.gepa_strv_name = gepa_strv_name;
	}
	/**
	 * @return Returns the gepa_titel.
	 */
	public String getGepa_titel() {
		return gepa_titel;
	}
	/**
	 * @param gepa_titel The gepa_titel to set.
	 */
	public void setGepa_titel(String gepa_titel) {
		this.gepa_titel = gepa_titel;
	}
	/**
	 * @return Returns the gpar_code.
	 */
	public String getGpar_code() {
		return gpar_code;
	}
	/**
	 * @param gpar_code The gpar_code to set.
	 */
	public void setGpar_code(String gpar_code) {
		this.gpar_code = gpar_code;
	}
	/**
	 * @return Returns the gpar_decode.
	 */
	public String getGpar_decode() {
		return gpar_decode;
	}
	/**
	 * @param gpar_decode The gpar_decode to set.
	 */
	public void setGpar_decode(String gpar_decode) {
		this.gpar_decode = gpar_decode;
	}
	/**
	 * @return Returns the gPST_CODE.
	 */
	public String getGPST_CODE() {
		return GPST_CODE;
	}
	/**
	 * @param gpst_code The gPST_CODE to set.
	 */
	public void setGPST_CODE(String gpst_code) {
		GPST_CODE = gpst_code;
	}
	/**
	 * @return Returns the gPST_DECODE.
	 */
	public String getGPST_DECODE() {
		return GPST_DECODE;
	}
	/**
	 * @param gpst_decode The gPST_DECODE to set.
	 */
	public void setGPST_DECODE(String gpst_decode) {
		GPST_DECODE = gpst_decode;
	}
	/**
	 * @return Returns the login.
	 */
	public boolean isLogin() {
		return login;
	}
	/**
	 * @param login The login to set.
	 */
	public void setLogin(boolean login) {
		this.login = login;
	}
	/**
	 * @return Returns the login_id.
	 */
	public String getLogin_id() {
		return login_id;
	}
	/**
	 * @param login_id The login_id to set.
	 */
	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}
	/**
	 * @return Returns the pers_reda_referenzen.
	 */
	public String getPers_reda_referenzen() {
		return pers_reda_referenzen;
	}
	/**
	 * @param pers_reda_referenzen The pers_reda_referenzen to set.
	 */
	public void setPers_reda_referenzen(String pers_reda_referenzen) {
		this.pers_reda_referenzen = pers_reda_referenzen;
	}
	/**
	 * @return Returns the schu_bezeichnung.
	 */
	public String getSchu_bezeichnung() {
		return schu_bezeichnung;
	}
	/**
	 * @param schu_bezeichnung The schu_bezeichnung to set.
	 */
	public void setSchu_bezeichnung(String schu_bezeichnung) {
		this.schu_bezeichnung = schu_bezeichnung;
	}
	/**
	 * @return Returns the vesg_thema_anzeige.
	 */
	public String getVesg_thema_anzeige() {
		return vesg_thema_anzeige;
	}
	/**
	 * @param vesg_thema_anzeige The vesg_thema_anzeige to set.
	 */
	public void setVesg_thema_anzeige(String vesg_thema_anzeige) {
		this.vesg_thema_anzeige = vesg_thema_anzeige;
	}
}