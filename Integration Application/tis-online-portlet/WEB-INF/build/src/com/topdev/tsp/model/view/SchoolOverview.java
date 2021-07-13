package com.topdev.tsp.model.view;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.w3c.dom.Element;

import com.topdev.aa.data.BobjStandard;
import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.XML;
import com.topdev.aa.object.error.ValidationError;
import com.topdev.service.anla.Proxy;
import com.topdev.service.anla.data.BobjAnla;
import com.topdev.service.bild.Client;
import com.topdev.service.bild.data.BobjBild;
import com.topdev.tsp.action.basic.BasicActionSupport;
import com.topdev.tsp.model.BasicViewModel;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexHeading;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.overview.OverviewAddress;
import com.topdev.tsp.model.list.modules.overview.OverviewCommunication;
import com.topdev.tsp.model.list.modules.overview.OverviewImage;
import com.topdev.tsp.model.list.modules.overview.OverviewSchooltract;

public class SchoolOverview extends  BasicViewModel
{
	private static final long	serialVersionUID	= 1L;
	String schoolId;
	String schulnummer; 
	String schulname;
	String schulname2;
	String schulname3;
	String schulart;
	String schulart_code;
	String cc_plz_ort;
	String cc_name_1_ort;
	String cc_strasse;
	String telefon;
	String telefax;
	String url;
	String schultraeger;
	String gepa_id_traeger;
	String schulamt;
	String schulamt_code;
	String cc_schulart_dien_nr;
	String plz;
	String email;
	String strasse;
	String leitbild;
	String id_leitbild;
	String xpts_leitbild;
	String wegbeschreibung;
	String id_wegbeschreibung;
	String xpts_wegbeschreibung;
	String kommunikationsart_decode;
	String schu_id;
	String krei_id;
	String adressart;
	String adressart_decode;
	String serienbrief;
	String zusatz;
	String hausnummer_1;
	String hausnummer_2;
	String ort;
	String ansc_id;
	String kommunikationsart;
	String verbindung;
	String bevorzugt;
	String gepa_id_schulamt;
	String gepa_rolle;
	String telefon_hort;
	
	String aufgaben;
	String id_aufgaben;
	String xpts_aufgaben;
	String oeffnungszeiten;
	String id_oeffnungszeiten;
	String xpts_oeffnungszeiten;
	String leiter;
	String ansprechpartner;
	String dien_typ;
	
	private ComplexList	schooltractList;
	private ComplexList	communicationList;
	private ComplexList	addressList;
	private ComplexList	imageList;

	public SchoolOverview()
	{
		schooltractList = new ComplexList();
		schooltractList.getHeadingList().add(new ComplexHeading("Beschreibung"));
		schooltractList.getHeadingList().add(new ComplexHeading("Ort"));
		schooltractList.getHeadingList().add(new ComplexHeading("Strasse"));
		schooltractList.getHeadingList().add(new ComplexHeading("Telefon"));
		schooltractList.getHeadingList().add(new ComplexHeading("Telefax"));
		schooltractList.getHeadingList().add(new ComplexHeading("E-Mail"));

		addressList = new ComplexList();
		addressList.getHeadingList().add(new ComplexHeading("Art"));
		addressList.getHeadingList().add(new ComplexHeading("Strasse/Postfach"));
		addressList.getHeadingList().add(new ComplexHeading("Ort"));
		addressList.getHeadingList().add(new ComplexHeading("Adresszusatz"));
		addressList.getHeadingList().add(new ComplexHeading("bevorzugte Adresse"));
		addressList.getHeadingList().add(new ComplexHeading("Standort"));

		communicationList = new ComplexList();
		communicationList.getHeadingList().add(new ComplexHeading("Kommunikationsart"));
		communicationList.getHeadingList().add(new ComplexHeading("Verbindung"));
		communicationList.getHeadingList().add(new ComplexHeading("Bevorzugt"));
		communicationList.getHeadingList().add(new ComplexHeading("Standort"));

		imageList = new ComplexList();
		imageList.getHeadingList().add(new ComplexHeading("Anzeigebereich"));
		imageList.getHeadingList().add(new ComplexHeading("Dateiname"));
		imageList.getHeadingList().add(new ComplexHeading("Größe"));
		imageList.getHeadingList().add(new ComplexHeading("Virenprüfung"));
	}

	public void loadData()
	{
		setErrors(new ArrayList<String>(1));

		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure(getMode()==1?"psp_GEPA":"psp_getSchule_Detail", getSessionId());
			if(getMode()!=1)	p.setOut(	"@KZ_EDIT",				Types.BIT);
			if(getMode()!=1)	p.setOut(	"@CC_LETZTE_AENDERUNG",	Types.VARCHAR);

			p.setInt(						"@GEPA_ID",				getId());
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			if(rs!=null && rs.next())
			{
				setSchulart(			rs.getString("SCHULART"));
				setCc_plz_ort(			rs.getString("CC_PLZ_ORT"));
				setCc_strasse(			rs.getString("CC_STRASSE"));
				setTelefon(				rs.getString("TELEFON"));
				setTelefax(				rs.getString("TELEFAX"));
				setEmail(				rs.getString("EMAIL"));
				setSchultraeger(		rs.getString("SCHULTRAEGER"));
				setGepa_id_traeger(		rs.getString("GEPA_ID_TRAEGER"));
				setGepa_id_schulamt(	rs.getString("GEPA_ID_SCHULAMT"));
				setSchulamt(			rs.getString("SCHULAMTSKREIS"));
				setUrl(					rs.getString("URL"));
				setLeitbild(			rs.getString("GEBE_LEITBILD"));
				setAufgaben(			rs.getString("GEBE_AUFGABEN"));
				setOeffnungszeiten(		rs.getString("GEBE_OEFFNUNGSZEITEN"));
				setCc_schulart_dien_nr(	rs.getString("CC_SCHULART_DIEN_NR"));
				setWegbeschreibung(		rs.getString("GEBE_WEGBESCHREIBUNG"));

				if(getMode()==2)
				{
					setLeiter(				rs.getString("LEITER"));
					setAnsprechpartner(		rs.getString("ANSPRECHPARTNER"));
				}
				if(getMode()==1)
				{
//					image.setId_entity(		rs.getString("ANLA_ID_SCHULBILD"));
//					image.setUser(			rs.getString("ANLA_USER_SCHULBILD"));
//					image.setXpts(			rs.getString("ANLA_XPTS_SCHULBILD"));
//					image.setGeprueft(		rs.getString("ANLA_KZ_GEPRUEFT_SCHULBILD"));
					
					setSchulart_code(		rs.getString("SCHU_ID"));
					setSchulnummer(			rs.getString("SCHULNUMMER"));
					setSchulname(			rs.getString("GEPA_NAME_1"));
					setSchulname2(			rs.getString("GEPA_NAME_2"));
					setSchulname3(			rs.getString("GEPA_NAME_3"));
					setUser(				rs.getString("GEPA_USER"));
					setXpts(				rs.getString("GEPA_XPTS"));
					setSchulamt_code(		rs.getString("KREI_ID"));
					setId_wegbeschreibung(	rs.getString("GEBE_ID_WEGBESCHREIBUNG"));
					setXpts_wegbeschreibung(rs.getString("GEBE_XPTS_WEGBESCHREIBUNG"));
					setId_leitbild(			rs.getString("GEBE_ID_LEITBILD"));
					setXpts_leitbild(		rs.getString("GEBE_XPTS_LEITBILD"));
					setId_aufgaben(			rs.getString("GEBE_ID_AUFGABEN"));
					setXpts_aufgaben(		rs.getString("GEBE_XPTS_AUFGABEN"));
					setId_oeffnungszeiten(	rs.getString("GEBE_ID_OEFFNUNGSZEITEN"));
					setXpts_oeffnungszeiten(rs.getString("GEBE_XPTS_OEFFNUNGSZEITEN"));
					setDien_typ(			rs.getString("DIEN_TYP"));
				}
				else
				{
					setCc_name_1_ort(		rs.getString("CC_NAME_1_ORT"));
					setSchulname(			rs.getString("SCHULNAME"));
					setGepa_rolle(			rs.getString("GEPA_ROLLE"));
					setTelefon_hort(		rs.getString("TELEFON_HORT"));
				}
			} else getErrors().add("Der angeforderte Datensatz konnte nicht gefunden werden.");
			p.finalizeResults();
			if(getMode()!=1)	setKz_edit(	p.getStringParameter("@KZ_EDIT"));
			if(getMode()!=1)	setPts(		p.getStringParameter("@CC_LETZTE_AENDERUNG"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }	
		
		if(getErrors().size()>0) return;
		if(getMode()==1)
		{
			loadDataAddress();
			loadDataCommunication();
			loadDataImage();
		}
		loadDataSchooltract();
	}
	public void loadDataSchooltract() 
	{
		schooltractList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
		SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getSchuleStandort", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				OverviewSchooltract oa = new OverviewSchooltract(rs.getString("GSTA_ID"));
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(++i));
				map.put("kz_edit",			rs.getString("KZ_EDIT"));
				map.put("kz_delete",		rs.getString("KZ_DELETE"));
				map.put("id_entity",		rs.getString("GSTA_ID"));
				map.put("user",				rs.getString("GSTA_USER"));
				map.put("xpts",				rs.getString("GSTA_XPTS"));
				map.put("bezeichnung",		rs.getString("GSTA_BEZEICHNUNG"));
				
				map.put("plzOrt",			rs.getString("CC_PLZ_ORT"));
				map.put("strasse",			rs.getString("CC_STRASSE"));
				map.put("telefon",			rs.getString("TELEFON"));
				map.put("telefax",			rs.getString("TELEFAX"));
				map.put("email",			rs.getString("EMAIL"));
				oa.setData(map);
				schooltractList.getEntryList().add(oa);
			}
			p.finalizeResults();
			schooltractList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataAddress() 
	{
		addressList.clearEntryList();
		HashMap<String, String> map; 
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("psp_getAnschrift", getSessionId());
			p.setInt(						"@GEPA_ID",			getId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				OverviewAddress oa 			= new OverviewAddress(rs.getString("ANSC_ID"));
				map = new HashMap<String, String>();
				map.put("id",				String.valueOf(++i));
				map.put("kz_edit",			rs.getString("KZ_EDIT"));
				map.put("kz_delete",		rs.getString("KZ_DELETE"));
				map.put("id_entity",		rs.getString("ANSC_ID"));
				map.put("user",				rs.getString("ANSC_USER"));
				map.put("xpts",				rs.getString("ANSC_XPTS"));
				map.put("adressart",		rs.getString("ANAR_ID"));
				map.put("adressart_decode",	rs.getString("ANAR_BEZEICHNUNG"));
				map.put("serienbrief",		rs.getString("ANSC_KZ_SERIENBRIEF"));
				map.put("plz",				rs.getString("PLZV_NUMMER"));
				map.put("strasse",			rs.getString("STRV_NAME"));
				map.put("hausnummer_1",		rs.getString("ANSC_HAUSNR"));
				map.put("hausnummer_2",		rs.getString("ANSC_HAUSNRZ"));
				map.put("ort",				rs.getString("ORTV_NAME"));
				map.put("gstaId",			rs.getString("GSTA_ID"));
				map.put("gstaId_view",		rs.getString("GSTA_BEZEICHNUNG"));
				map.put("zusatz",			rs.getString("ANSC_ADRESSZUSATZ"));
				map.put("nation",			rs.getString("ORTV_NATION"));
				oa.setData(map);
				addressList.getEntryList().add(oa);
				
			}
			p.finalizeResults();
			addressList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataCommunication()
	{
		communicationList.clearEntryList();
		HashMap<String, String> map; 	
		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("psp_getKommunikation", getSessionId());
			p.setInt(						"@GEPA_ID",				getId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				OverviewCommunication oc = 		new OverviewCommunication(rs.getString("KOMM_ID"));
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				map.put("kz_edit",				rs.getString("KZ_EDIT"));
				map.put("kz_delete",			rs.getString("KZ_DELETE"));
				map.put("id_entity",			rs.getString("KOMM_ID"));
				map.put("user",					rs.getString("KOMM_USER"));
				map.put("xpts",					rs.getString("KOMM_XPTS"));

				map.put("gstaId",					rs.getString("GSTA_ID"));
				map.put("gstaId_view",				rs.getString("GSTA_BEZEICHNUNG"));
				map.put("kommunikationsart_decode",	rs.getString("KOAR_BEZEICHNUNG"));
				map.put("kommunikationsart",		rs.getString("KOAR_ID"));
				map.put("verbindung",				rs.getString("KOMM_VERBINDUNG"));
				map.put("bevorzugt",				rs.getString("KOMM_KZ_BEVORZUGT"));
				oc.setData(map);
				communicationList.getEntryList().add(oc);
			}
			p.finalizeResults();
			communicationList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
			p.close();
		}
		catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
	}
	public void loadDataImage()
	{
		imageList.clearEntryList();
		HashMap<String, String> map; 	
		int i=0;
		{
			List<BobjBild> bb = null;
			try { bb = Client.getAllSchoolImages(getUser(), getId()); } catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); }

			if(bb!=null)
			{
				Iterator<BobjBild> it = bb.iterator();
				while(it.hasNext())
				{
					BobjBild bild = it.next();
					OverviewImage oi2 = new OverviewImage(bild.getId());
					map = new HashMap<String, String>();
					map.put("id",				String.valueOf(++i));
					map.put("kz_edit",			"0");
					map.put("id_entity",		bild.getId());
					map.put("user",				bild.getOrgUser());
					map.put("xpts",				bild.getPts());
					map.put("tbshDecode",		bild.getTbshDecode());
					map.put("tbshCode",			bild.getTbshCode());
					map.put("name",				bild.getName());
					map.put("geprueft",			bild.getIsGeprueft());
					map.put("groesse",			bild.getSize()+" KB");

					if(Validator.equals(bild.getIsGeprueft(),"1")) map.put("kz_delete",	"1");
					else  map.put("kz_delete",	"0");
					
					oi2.setData(map);
					imageList.getEntryList().add(oi2);
				}
			}
		}
		imageList.setKz_insert("1");
	}

	public void loadDataDirections() throws SQLException
	{
/*		HashMap<String, String> map; 	

		Connection		connection	= null;
	   	SqlProcedure	p			= null;
		try
		{
			connection 	= BasicActionSupport.getConnection();
			p			= new SqlProcedure("psp_getGeschaeftspartnerBeschreibung", getSessionId());
			p.setInt(	"@GEPA_ID",		getSchoolId());
			p.setOut(	"@KZ_INSERT",	Types.BIT);
			p.execute(	connection);
			ResultSet rs = p.getResultSet();
			
			int i=0;
			while(rs!=null && rs.next())
			{
				OverviewCommunication oc = 		new OverviewCommunication(rs.getString("KOMM_ID"));
				map = new HashMap<String, String>();
				map.put("id",					String.valueOf(++i));
				map.put("kz_edit",				rs.getString("KZ_EDIT"));
				map.put("kz_delete",			rs.getString("KZ_DELETE"));
				map.put("id_entity",			rs.getString("KOMM_ID"));
				map.put("user",					rs.getString("KOMM_USER"));
				map.put("xpts",					rs.getString("KOMM_XPTS"));

				map.put("kommunikationsart_decode",	rs.getString("KOAR_BEZEICHNUNG"));
				map.put("kommunikationsart",		rs.getString("KOAR_ID"));
				map.put("verbindung",				rs.getString("KOMM_VERBINDUNG"));
				map.put("bevorzugt",				rs.getString("KOMM_KZ_BEVORZUGT"));
				oc.setData(map);
				communicationList.getEntryList().add(oc);
				
			}
			p.finalizeResults();
			communicationList.setKz_insert(p.getStringParameter("@KZ_INSERT"));
			p.close();
		}
		finally { SqlProcedure.closeConnection(connection); }
		*/
	}
	
	public List<String> saveData() throws SQLException
	{
		List<String> errors = new ArrayList<String>(1);
		
		Connection		connection	= null;
	   	SqlProcedure	p			= null;

		try
		{
			XML xml_ansc = new XML("ISO-8859-15"); 
			List<ComplexEntryList> list = (List<ComplexEntryList>) addressList.getEntryList();
			Iterator<ComplexEntryList> it = list.iterator();			
			
			if(it!=null) while(it.hasNext())
			{
				OverviewAddress address = (OverviewAddress) it.next();
				if(address.isDeleted() || address.isModified())
				{
					
					Element ansc = xml_ansc.createElement("ansc"); 
					ansc.setAttribute("KZ_IS_MODIFIED",		 	(address.isModified()?"1":"0"));
					ansc.setAttribute("KZ_IS_DELETED", 			(address.isDeleted()?"1":"0"));
					ansc.setAttribute("GEPA_ID", 				getId());
					ansc.setAttribute("ANSC_ID", 				address.isInserted()?"0":formatString(address.getId_entity()));
					ansc.setAttribute("ANAR_ID", 				address.getAdressart());
					ansc.setAttribute("ANSC_KZ_SERIENBRIEF",	address.getSerienbrief());
					ansc.setAttribute("PLZV_NUMMER", 			address.getPlz());
					ansc.setAttribute("STRV_NAME", 				address.getStrasse());
					ansc.setAttribute("ANSC_HAUSNR", 			address.getHausnummer_1());
					ansc.setAttribute("ANSC_HAUSNRZ", 			address.getHausnummer_2());
					ansc.setAttribute("ORTV_NAME", 				address.getOrt());
					ansc.setAttribute("ANSC_ADRESSZUSATZ", 		address.getZusatz());
					ansc.setAttribute("ORTV_NATION", 			address.getNation());
					ansc.setAttribute("GSTA_ID",		 		address.getGstaId());
					
					ansc.setAttribute("ANSC_USER", 				address.getUser());
					ansc.setAttribute("ANSC_XPTS", 				address.getXpts());
					

					xml_ansc.getRoot().appendChild(ansc);
				}
			}
//			-----------------------------------------------------------------
			
			
			XML xml_komm = new XML("ISO-8859-15"); 
			{
				List<ComplexEntryList> list1 = (List<ComplexEntryList>) communicationList.getEntryList();
				Iterator<ComplexEntryList> it1 = list1.iterator();			
				
				if(it1!=null) while(it1.hasNext())
				{
					OverviewCommunication communication = (OverviewCommunication) it1.next();
					if(communication.isDeleted() || communication.isModified())
					{
						Element komm = xml_komm.createElement("komm");
						
						komm.setAttribute("KZ_IS_MODIFIED",		 	(communication.isModified()?"1":"0"));
						komm.setAttribute("KZ_IS_DELETED", 			(communication.isDeleted()?"1":"0"));
						komm.setAttribute("GEPA_ID", 				getId());
						komm.setAttribute("KOMM_ID", 				communication.isInserted()?"0":formatString(communication.getId_entity()));
						komm.setAttribute("KOAR_ID", 				communication.getKommunikationsart());
						komm.setAttribute("KOMM_VERBINDUNG", 		communication.getVerbindung());

						komm.setAttribute("GSTA_ID",		 		communication.getGstaId());
						komm.setAttribute("KOMM_KZ_BEVORZUGT", 		communication.getBevorzugt());
						komm.setAttribute("KOMM_USER", 				communication.getUser());
						komm.setAttribute("KOMM_XPTS", 				communication.getXpts());
	
						xml_komm.getRoot().appendChild(komm);
					}
				}
			}
			
			XML xml_gsta = new XML("ISO-8859-15");
			{
				List<ComplexEntryList> list1 =  (List<ComplexEntryList>) schooltractList.getEntryList();
				Iterator<ComplexEntryList> it1 = list1.iterator();			
				if(it1!=null) while(it1.hasNext())
				{
					OverviewSchooltract tract = (OverviewSchooltract) it1.next();
					if(tract.isDeleted() || tract.isModified())
					{
						Element komm = xml_gsta.createElement("gsta");
						komm.setAttribute("KZ_IS_MODIFIED",		(tract.isModified()?"1":"0"));
						komm.setAttribute("KZ_IS_DELETED", 		(tract.isDeleted()?"1":"0"));
						komm.setAttribute("GEPA_ID", 			getId());
						komm.setAttribute("GSTA_BEZEICHNUNG",	tract.getBezeichnung());
						komm.setAttribute("GSTA_ID", 			tract.isInserted()?"0":formatString(tract.getId_entity()));
						komm.setAttribute("GSTA_USER", 			tract.getUser());
						komm.setAttribute("GSTA_XPTS", 			tract.getXpts());
						xml_gsta.getRoot().appendChild(komm);
					}
				}
			}
			
			
			connection 	= BasicActionSupport.getConnection();
			p			 = new SqlProcedure("pss_GEPA_IUD", getSessionId());
			//p.setString("@GEPA_ID",						getId());
			p.setString("@GEPA_USER",					getUser());
			p.setString("@GEPA_XPTS",					getXpts());
			p.setString("@KZ_MODIFIED",					"1");
			p.setString("@kz_deleted",					"0");
			p.setString("@GEPA_ID",						getId());
			
			p.setString("@GSTA_DATA",					new String(xml_gsta.getBytes()).replaceFirst("UTF-8", "unicode") );
			p.setString("@ANSC_DATA",					new String(xml_ansc.getBytes()).replaceFirst("UTF-8", "unicode") );
			p.setString("@KOMM_DATA",					new String(xml_komm.getBytes()).replaceFirst("UTF-8", "unicode") );
			
			p.setString("@SCHULNUMMER",					getSchulnummer());
			p.setString("@GEPA_NAME_1",					getSchulname());
			p.setString("@GEPA_NAME_2",					getSchulname2());
			p.setString("@GEPA_NAME_3",					getSchulname3());
			p.setString("@SCHU_ID",						getSchulart_code());
			p.setString("@GEPA_ID_TRAEGER",				getGepa_id_traeger());
			p.setString("@KREI_ID",						getSchulamt_code());
			
			p.setString("@GEBE_LEITBILD",				Validator.unNull(getLeitbild()));
			p.setString("@GEBE_ID_LEITBILD",			getId_leitbild());
			p.setString("@GEBE_XPTS_LEITBILD",			getXpts_leitbild());
			
			p.setString("@GEBE_WEGBESCHREIBUNG",		Validator.unNull(getWegbeschreibung()));
			p.setString("@GEBE_ID_WEGBESCHREIBUNG",		getId_wegbeschreibung());
			p.setString("@GEBE_XPTS_WEGBESCHREIBUNG",	getXpts_wegbeschreibung());
			
			p.setString("@GEBE_AUFGABEN",				Validator.unNull(getAufgaben()));
			p.setString("@GEBE_ID_AUFGABEN",			getId_aufgaben());
			p.setString("@GEBE_XPTS_AUFG",				getXpts_aufgaben());
			
			p.setString("@GEBE_OEFFNUNGSZEITEN",		Validator.unNull(getOeffnungszeiten()));
			p.setString("@GEBE_ID_OEFFNUNGSZEITEN",		getId_oeffnungszeiten());
			p.setString("@GEBE_XPTS_OEFFNUNGSZEITEN",	getXpts_oeffnungszeiten());


			p.execute(	connection);

			p.finalizeResults();
			if(p.getErrorString()!=null) errors.add(p.getErrorString());
			p.close();
		}	
		catch(SQLException ex) { errors.add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) errors.add(ex.getLocalizedMessage()); }
		finally { SqlProcedure.closeConnection(connection); }
		return errors;
	}

	public void saveImage(String userName, OverviewImage image, File file)
	{
		setErrors(new ArrayList<String>(1));

		if(!"1".equals(image.getDeleted()))
		{
			try
			{
				BobjAnla a = new BobjAnla(file, image.getName());
				a.setTbshId(			getId());
				a.setNutzerkreisCode(	"40");
				a.setTbshCode(			image.getTbshCode());
				a.setTitel(				image.getName());
				log.debug("getUser():"+getUser()+" userName:"+userName);
				com.topdev.aa.data.BobjStandard result = Proxy.insert(userName, getSessionId(), a);
				if(result!=null)
				{
					image.setId_entity(		result.getId());
					image.setUser(			result.getOrgUser());
					image.setXpts(			result.getOrgXPts());
					image.setGeprueft(		"1");
		
					if(result.getValidationErrors()!=null)
					{
						String es = "";
						for(ValidationError ve :result.getValidationErrors()) es+=ve.getText()+" \n";
						if(es.length()>0) getErrors().add(es);
					}
				}
				else getErrors().add("Beim Einfügen des Bildes ist ein Fehler aufgetreten. (EC156)");
			}
			catch(Exception ex) { getErrors().add(ex.getLocalizedMessage()); log.error(ex.getLocalizedMessage()); }
		}
		else
		{
			Connection		connection	= null;
		   	SqlProcedure	p			= null;
	
			try
			{
	//			____________________________________________________________________________________________________
	//			Speichern...
	
				connection 	= BasicActionSupport.getConnection();
				p			 = new SqlProcedure("pss_ANLA_IUD", getSessionId());		
	
				p.setInt(	"@TBSH_ID",				getId());
				p.setString("@TBSH_SHORTNAME",		image.getTbshCode());
				p.setInt(	"@ANLA_ID",				(image.getId_entity()==null || image.getId_entity().length()==0)?"0":image.getId_entity());
				p.setString("@ANLA_USER",			image.getUser()		);
				p.setString("@ANLA_XPTS",			image.getXpts()		);
				p.setInt(	"@ANLA_KZ_MODIFIED",	image.getDeleted().equals("1")?"0":"1");
				p.setInt(	"@ANLA_KZ_DELETED",		image.getDeleted()	);
				p.setString("@ANLA_BEZEICHNUNG",	image.getName() 	);
				p.setString("@ANLA_GROESSE",		image.getGroesse()	);
				p.execute(	connection);
				ResultSet rs = p.getResultSet();
				if(rs!=null && rs.next())
				{
					image.setId_entity(		rs.getString("ANLA_ID"));
					image.setUser(			rs.getString("ANLA_USER"));
					image.setXpts(			rs.getString("ANLA_XPTS"));
					image.setGeprueft(		rs.getString("ANLA_KZ_GEPRUEFT"));
					rs.close();
				}
				p.finalizeResults();
				if(p.getErrorString()!=null) getErrors().add(p.getErrorString());
				p.close();
			}
			catch(SQLException ex) { getErrors().add(ex.getLocalizedMessage()); while((ex = ex.getNextException())!=null) getErrors().add(ex.getLocalizedMessage()); }
			finally { SqlProcedure.closeConnection(connection); }
		}
		
		
		if(getErrors().size()<1 && image.getDeleted()!=null && image.getDeleted().equals("1"))
		{
			image.setId_entity(	null);
			image.setUser(		null);
			image.setXpts(		null);
			image.setGeprueft(	null);
			image.setDeleted(	"0");
		}
	}
	
	public String getSchoolId()
	{
		return schoolId;
	}

	public void setSchoolId(String schoolId)
	{
		this.schoolId = schoolId;
	}

	public ComplexList getAddressList()
	{
		return addressList;
	}

	public void setAddressList(ComplexList addressList)
	{
		this.addressList = addressList;
	}

	public ComplexList getCommunicationList()
	{
		return communicationList;
	}

	public void setCommunicationList(ComplexList communicationList)
	{
		this.communicationList = communicationList;
	}

	public String getAdressart() {
		return adressart;
	}

	public void setAdressart(String adressart) {
		this.adressart = adressart;
	}

	public String getHausnummer_1() {
		return hausnummer_1;
	}

	public void setHausnummer_1(String hausnummer_1) {
		this.hausnummer_1 = hausnummer_1;
	}

	public String getHausnummer_2() {
		return hausnummer_2;
	}

	public void setHausnummer_2(String hausnummer_2) {
		this.hausnummer_2 = hausnummer_2;
	}

	public String getOrt() {
		return ort;
	}

	public void setOrt(String ort) {
		this.ort = ort;
	}

	public String getPlz() {
		return plz;
	}

	public void setPlz(String plz) {
		this.plz = plz;
	}

	public String getSerienbrief() {
		return serienbrief;
	}

	public void setSerienbrief(String serienbrief) {
		this.serienbrief = serienbrief;
	}

	public String getStrasse() {
		return strasse;
	}

	public void setStrasse(String strasse) {
		this.strasse = strasse;
	}

	public String getZusatz() {
		return zusatz;
	}

	public void setZusatz(String zusatz) {
		this.zusatz = zusatz;
	}


	public String getAdressart_decode() {
		return adressart_decode;
	}

	public void setAdressart_decode(String adressart_decode) {
		this.adressart_decode = adressart_decode;
	}

	public String getBevorzugt() {
		return bevorzugt;
	}

	public void setBevorzugt(String bevorzugt) {
		this.bevorzugt = bevorzugt;
	}

	public String getKommunikationsart() {
		return kommunikationsart;
	}

	public void setKommunikationsart(String kommunikationsart) {
		this.kommunikationsart = kommunikationsart;
	}

	public String getVerbindung() {
		return verbindung;
	}

	public void setVerbindung(String verbindung) {
		this.verbindung = verbindung;
	}

	public String getKommunikationsart_decode() {
		return kommunikationsart_decode;
	}

	public void setKommunikationsart_decode(String kommunikationsart_decode) {
		this.kommunikationsart_decode = kommunikationsart_decode;
	}




	public String getAnsc_id() {
		return ansc_id;
	}

	public void setAnsc_id(String ansc_id) {
		this.ansc_id = ansc_id;
	}

	public String getCc_plz_ort() {
		return cc_plz_ort;
	}

	public void setCc_plz_ort(String cc_plz_ort) {
		this.cc_plz_ort = cc_plz_ort;
	}

	public String getCc_schulart_dien_nr() {
		return cc_schulart_dien_nr;
	}

	public void setCc_schulart_dien_nr(String cc_schulart_dien_nr) {
		this.cc_schulart_dien_nr = cc_schulart_dien_nr;
	}

	public String getCc_strasse() {
		return cc_strasse;
	}

	public void setCc_strasse(String cc_strasse) {
		this.cc_strasse = cc_strasse;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGepa_id_traeger() {
		return gepa_id_traeger;
	}

	public void setGepa_id_traeger(String gepa_id_traeger) {
		this.gepa_id_traeger = gepa_id_traeger;
	}

	public String getKrei_id() {
		return krei_id;
	}

	public void setKrei_id(String krei_id) {
		this.krei_id = krei_id;
	}

	public String getLeitbild() {
		return leitbild;
	}

	public void setLeitbild(String leitbild) {
		this.leitbild = leitbild;
	}

	public String getSchu_id() {
		return schu_id;
	}

	public void setSchu_id(String schu_id) {
		this.schu_id = schu_id;
	}

	public String getSchulamt() {
		return schulamt;
	}

	public void setSchulamt(String schulamt) {
		this.schulamt = schulamt;
	}

	public String getSchulamt_code() {
		return schulamt_code;
	}

	public void setSchulamt_code(String schulamt_code) {
		this.schulamt_code = schulamt_code;
	}

	public String getSchulart() {
		return schulart;
	}

	public void setSchulart(String schulart) {
		this.schulart = schulart;
	}

	public String getSchulart_code() {
		return schulart_code;
	}

	public void setSchulart_code(String schulart_code) {
		this.schulart_code = schulart_code;
	}

	public String getSchulname() {
		return schulname;
	}

	public void setSchulname(String schulname) {
		this.schulname = schulname;
	}

	public String getSchulname3() {
		return schulname3;
	}

	public void setSchulname3(String schulname3) {
		this.schulname3 = schulname3;
	}

	public String getSchulnummer() {
		return schulnummer;
	}

	public void setSchulnummer(String schulnummer) {
		this.schulnummer = schulnummer;
	}

	public String getSchultraeger() {
		return schultraeger;
	}

	public void setSchultraeger(String schultraeger) {
		this.schultraeger = schultraeger;
	}

	public String getTelefax() {
		return telefax;
	}

	public void setTelefax(String telefax) {
		this.telefax = telefax;
	}

	public String getTelefon() {
		return telefon;
	}

	public void setTelefon(String telefon) {
		this.telefon = telefon;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getWegbeschreibung() {
		return wegbeschreibung;
	}

	public void setWegbeschreibung(String wegbeschreibung) {
		this.wegbeschreibung = wegbeschreibung;
	}

	public String getId_leitbild()
	{
		return id_leitbild;
	}

	public void setId_leitbild(String id_leitbild)
	{
		this.id_leitbild = id_leitbild;
	}

	public String getId_wegbeschreibung()
	{
		return id_wegbeschreibung;
	}

	public void setId_wegbeschreibung(String id_wegbeschreibung)
	{
		this.id_wegbeschreibung = id_wegbeschreibung;
	}

	public String getXpts_leitbild()
	{
		return xpts_leitbild;
	}

	public void setXpts_leitbild(String xpts_leitbild)
	{
		this.xpts_leitbild = xpts_leitbild;
	}

	public String getXpts_wegbeschreibung()
	{
		return xpts_wegbeschreibung;
	}

	public void setXpts_wegbeschreibung(String xpts_wegbeschreibung)
	{
		this.xpts_wegbeschreibung = xpts_wegbeschreibung;
	}


	public String getSchulname2() {
		return schulname2;
	}

	public void setSchulname2(String schulname2) {
		this.schulname2 = schulname2;
	}
	public String getGepa_id_schulamt() {
		return gepa_id_schulamt;
	}
	public void setGepa_id_schulamt(String gepa_id_schulamt) {
		this.gepa_id_schulamt = gepa_id_schulamt;
	}
	public String getGepa_rolle() {
		return gepa_rolle;
	}
	public void setGepa_rolle(String gepa_rolle) {
		this.gepa_rolle = gepa_rolle;
	}
	public String getCc_name_1_ort()
	{
		return cc_name_1_ort;
	}
	public void setCc_name_1_ort(String cc_name_1_ort)
	{
		this.cc_name_1_ort = cc_name_1_ort;
	}
	public String getTelefon_hort() {
		return telefon_hort;
	}
	public void setTelefon_hort(String telefon_hort) {
		this.telefon_hort = telefon_hort;
	}

	public ComplexList getImageList() {
		return imageList;
	}

	public void setImageList(ComplexList imageList) {
		this.imageList = imageList;
	}

	public ComplexList getSchooltractList() {
		return schooltractList;
	}

	public void setSchooltractList(ComplexList schooltractList) {
		this.schooltractList = schooltractList;
	}

	public String getAufgaben() {
		return aufgaben;
	}

	public void setAufgaben(String aufgaben) {
		this.aufgaben = aufgaben;
	}

	public String getOeffnungszeiten() {
		return oeffnungszeiten;
	}

	public void setOeffnungszeiten(String oeffnungszeiten) {
		this.oeffnungszeiten = oeffnungszeiten;
	}

	public String getId_aufgaben() {
		return id_aufgaben;
	}

	public void setId_aufgaben(String id_aufgaben) {
		this.id_aufgaben = id_aufgaben;
	}

	public String getXpts_aufgaben() {
		return xpts_aufgaben;
	}

	public void setXpts_aufgaben(String xpts_aufgaben) {
		this.xpts_aufgaben = xpts_aufgaben;
	}

	public String getId_oeffnungszeiten() {
		return id_oeffnungszeiten;
	}

	public void setId_oeffnungszeiten(String id_oeffnungszeiten) {
		this.id_oeffnungszeiten = id_oeffnungszeiten;
	}

	public String getXpts_oeffnungszeiten() {
		return xpts_oeffnungszeiten;
	}

	public void setXpts_oeffnungszeiten(String xpts_oeffnungszeiten) {
		this.xpts_oeffnungszeiten = xpts_oeffnungszeiten;
	}

	public String getLeiter() {
		return leiter;
	}

	public void setLeiter(String leiter) {
		this.leiter = leiter;
	}

	public String getAnsprechpartner() {
		return ansprechpartner;
	}

	public void setAnsprechpartner(String ansprechpartner) {
		this.ansprechpartner = ansprechpartner;
	}

	public String getDien_typ() {
		return dien_typ;
	}

	public void setDien_typ(String dien_typ) {
		this.dien_typ = dien_typ;
	}

}