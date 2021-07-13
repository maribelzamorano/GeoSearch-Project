package com.topdev.tsp.action.modules.school_search;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.SqlProcedure;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.SearchActionSupport;
import com.topdev.tsp.model.db.psp_getSchule;




public class SearchAction extends SearchActionSupport
{
	private static final long	serialVersionUID	= 1L;
	private String GEPA_NAME;
	private String DIEN_NR;
	private String STRASSE;
	private String PLZ;
	private String ORT;
	private String SCHU_ID;
	private String KREI_ID;
	private String SCHULTRAEGER;
	private String GEPA_ID_TRAEGER;
	private String SCHU_BEZEICHNUNG;
	private String KREI_BEZEICHNUNG;
	private String suchbegriff;
	private String anwf;
	private String SORT_ID;
	
	private String hashValue = null; 
	private SqlProcedure p = null; 



	@SuppressWarnings("unchecked")
	public String execute() throws Exception
	{
		String hashName		= this.getClass().getName()+"-searchHash"+anwf;
		String resultsName	= this.getClass().getName()+"-searchResults"+anwf;
		 
		hashValue = getSessionAttribute(hashName);
//		System.out.println("pre: getSessionAttribute(hashName):"+getSessionAttribute(hashName));
//		System.out.println("pre: getSessionObject(resultsName):"+getSessionObject(resultsName));

		setRows(		getSessionObject(resultsName)==null?null:((List<Object>)getSessionObject(resultsName)));
		setP(			getSessionObject(resultsName+"_proc")==null?null:(SqlProcedure)getSessionObject(resultsName+"_proc"));
		setRowCounter(	getSessionAttribute(resultsName+"_counter"));
		
	   	Connection		connection	= null;
		try
		{
			connection 	= getDataSource().getConnection();
			setSessionAttribute(hashName, doSearch(connection, false)) ;
			setSessionObject(resultsName, getRows());
			setSessionObject(resultsName+"_proc", getP());
			setSessionAttribute(resultsName+"_counter", getRowCounter());
		}
		catch (Exception ex)
		{
			String error = "Bei der Abfrage von Schulen trat ein Datenbankfehler auf:\n"+ex.getLocalizedMessage();
			getRtErrors().add(error);
			log.error(error);
		}
		finally
		{
			SqlProcedure.closeConnection(connection);
		}
//		System.out.println("post: getSessionAttribute(hashName):"+getSessionAttribute(hashName));
//		System.out.println("post: getSessionObject(resultsName):"+getSessionObject(resultsName));

		//session.setAttribute("school.SearchAction.results", rows);
		if(getRtErrors().size()>0) return ERROR;
		return SUCCESS;
	}

	public String doSearch(Connection connection, boolean print) throws Exception
	{
		if(print) p.setInt(	"@USE_RESULTSET", 1);
		else
		{
			if(Validator.equals(anwf, "media"))
				p = new SqlProcedure("psp_getMedienzentrum", getSessionId());
			else
				p = new SqlProcedure("psp_getSchule", getSessionId());

			p.setInt(	"@ROWS",			getMaxResults());
			p.setInt(	"@MAX_CHAR",		getMaxTokens());
			p.setInt(	"@PAGE",			getPage());
			p.setOut(	"@ROWCOUNTER",		Types.INTEGER);
			p.setString("@GEPA_NAME",		getGEPA_NAME());
			p.setString("@DIEN_NR",			getDIEN_NR());
			p.setString("@STRASSE",			getSTRASSE());
			p.setString("@PLZ",				getPLZ());
			p.setString("@ORT",				getORT());
			p.setInt(	"@SCHU_ID",			getSCHU_ID());
			p.setInt(	"@KREI_ID",			getKREI_ID());
			p.setString("@GEPA_ID_TRAEGER",	getGEPA_ID_TRAEGER());
			p.setString("@SUCHBEGRIFF",		getSuchbegriff());			
			p.setString("@SPSS_CODE",		getSORT_ID());
			
		}
		if(!print && hashValue!=null && hashValue.equals(p.getChecksum())) return hashValue;
		
		p.execute(	connection);
		ResultSet rs = p.getResultSet();
		setRows(new ArrayList<Object>(20));
		if(rs!=null) while(rs.next())
		{
			psp_getSchule schule = new psp_getSchule();
			
			schule.setID(			rs.getString("GEPA_ID"));
			schule.setCC_PLZ_ORT(	rs.getString("CC_PLZ_ORT"));
			schule.setCC_STRASSE(	rs.getString("CC_STRASSE"));
			schule.setCC_NAME_1_ORT(rs.getString("CC_NAME_1_ORT"));
			schule.setSCHULART(		rs.getString("SCHULART"));
			schule.setSCHULNAME(	rs.getString("SCHULNAME"));
			schule.setSCHULNUMMER(	rs.getString("SCHULNUMMER"));
			if(!Validator.equals(anwf, "media"))
				schule.setAENDERUNG(rs.getString("CC_LETZTE_AENDERUNG"));			
			
			getRows().add(schule);
		}
		p.finalizeResults();
		setRowCounter(p.getStringParameter("@ROWCOUNTER"));
		p.close();
		return p.getChecksum();
	}
	
	public String print() throws Exception
	{
		if(Validator.equals(anwf, "media")) return printMedia();
		else return printSchools();
	}
	@SuppressWarnings("unchecked")
	public String printSchools() throws Exception
	{
		String resultsName	= this.getClass().getName()+"-searchResults"+anwf;
		//setRows((List<Object>)getSessionObject(resultsName));
		setP(	getSessionObject(resultsName+"_proc")==null?null:(SqlProcedure)getSessionObject(resultsName+"_proc"));
	   	Connection		connection	= null;
		try
		{
			connection 	= getDataSource().getConnection();
			doSearch(connection, true);
		}
		catch (Exception ex)
		{
			String error = "Bei der Abfrage von Schulen trat ein Datenbankfehler auf:\n"+ex.getLocalizedMessage();
			getRtErrors().add(error);
			log.error(error);
		}
		finally
		{
			SqlProcedure.closeConnection(connection);
		}
			
		XML xml = new XML();
		
		xml.getRoot().appendChild(xml.createContentElement("heading",	"Schulporträt"));
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		
		Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "1.7cm"));
		table.appendChild(xml.createContentElement("table-column", ""));
		table.appendChild(xml.createContentElement("table-column", "", "width", "2.5cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "2.5cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "2.5cm"));
				
		Node head = table.appendChild(xml.createContentElement("table-head", ""));
		Node row = head.appendChild(xml.createContentElement("table-row", ""));
		row.appendChild(xml.createContentElement("table-cell-header", "Schulnr."));
		row.appendChild(xml.createContentElement("table-cell-header", "Schulnahularme"));
		row.appendChild(xml.createContentElement("table-cell-header", "Sct"));
		row.appendChild(xml.createContentElement("table-cell-header", "PLZ / Ort"));
		row.appendChild(xml.createContentElement("table-cell-header", "Straße"));		
				
		Node foot = table.appendChild(xml.createContentElement("table-foot", ""));
		row = foot.appendChild(xml.createContentElement("table-row", ""));
		row.appendChild(xml.createContentElement("table-cell", ""));
		
		Node body = table.appendChild(xml.createContentElement("table-body", ""));

		if(getRows()!=null)
		{
			Iterator it = getRows().iterator();
			while(it.hasNext())
			{
				psp_getSchule schule = (psp_getSchule) it.next();
				row = body.appendChild(xml.createContentElement("table-row", ""));
				
				row.appendChild(xml.createContentElement("table-cell", schule.getSCHULNUMMER()));
				Node cell = row.appendChild(xml.createContentElement("table-cell", ""));
				cell.appendChild(xml.createContentElement("line", schule.getSCHULNAME()));
				cell.appendChild(xml.createContentElement("line-small", schule.getAENDERUNG()));
				row.appendChild(xml.createContentElement("table-cell", schule.getSCHULART()));
				row.appendChild(xml.createContentElement("table-cell", schule.getCC_PLZ_ORT()));
				row.appendChild(xml.createContentElement("table-cell", schule.getCC_STRASSE()));
				
			}
		}		
				
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/pdf");
		response.getOutputStream().write(Renderer.transformToBytes(xml.render(), getRealPath("/resources/xsl/fo/list.xsl"), Renderer.MODE_PDF));
		response.getOutputStream().close();
		return null;
	}
	@SuppressWarnings("unchecked")
	public String printMedia() throws Exception
	{
		String resultsName	= this.getClass().getName()+"-searchResults"+anwf;
		//setRows((List<Object>)getSessionObject(resultsName));
		setP(	getSessionObject(resultsName+"_proc")==null?null:(SqlProcedure)getSessionObject(resultsName+"_proc"));
	   	Connection		connection	= null;
		try
		{
			connection 	= getDataSource().getConnection();
			doSearch(connection, true);
		}
		catch (Exception ex)
		{
			String error = "Bei der Abfrage von Medienzentren trat ein Datenbankfehler auf:\n"+ex.getLocalizedMessage();
			getRtErrors().add(error);
			log.error(error);
		}
		finally
		{
			SqlProcedure.closeConnection(connection);
		}
			
		XML xml = new XML();
		
		xml.getRoot().appendChild(xml.createContentElement("heading",	"Medienzentren"));
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));

		Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
		table.appendChild(xml.createContentElement("table-column", ""));
		table.appendChild(xml.createContentElement("table-column", ""));
				
		Node head = table.appendChild(xml.createContentElement("table-head", ""));
		Node row = head.appendChild(xml.createContentElement("table-row", ""));
		row.appendChild(xml.createContentElement("table-cell-header", "Nummer."));
		row.appendChild(xml.createContentElement("table-cell-header", "Name"));
		row.appendChild(xml.createContentElement("table-cell-header", "PLZ / Ort"));
		row.appendChild(xml.createContentElement("table-cell-header", "Straße"));
				
		Node foot = table.appendChild(xml.createContentElement("table-foot", ""));
		row = foot.appendChild(xml.createContentElement("table-row", ""));
		row.appendChild(xml.createContentElement("table-cell", ""));
		
		Node body = table.appendChild(xml.createContentElement("table-body", ""));

		if(getRows()!=null)
		{
			Iterator it = getRows().iterator();
			while(it.hasNext())
			{
				psp_getSchule schule = (psp_getSchule) it.next();
				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", schule.getSCHULNUMMER()));
				row.appendChild(xml.createContentElement("table-cell", schule.getSCHULNAME()));
				row.appendChild(xml.createContentElement("table-cell", schule.getCC_PLZ_ORT()));
				row.appendChild(xml.createContentElement("table-cell", schule.getCC_STRASSE()));				
			}
		}
				
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/pdf");
		response.getOutputStream().write(Renderer.transformToBytes(xml.render(), getRealPath("/resources/xsl/fo/list.xsl"), Renderer.MODE_PDF));
		response.getOutputStream().close();
		return null;
	}
	public String getAnwf()
	{
		return anwf;
	}

	public void setAnwf(String anwf)
	{
		this.anwf = anwf;
	}
	
	public String getDIEN_NR()
	{
		return DIEN_NR;
	}

	public void setDIEN_NR(String dien_nr)
	{
		DIEN_NR = dien_nr;
	}

	public String getGEPA_NAME()
	{
		return GEPA_NAME;
	}

	public void setGEPA_NAME(String gepa_name)
	{
		GEPA_NAME = gepa_name;
	}

	public String getKREI_ID()
	{
		return KREI_ID;
	}

	public void setKREI_ID(String krei_id)
	{
		KREI_ID = krei_id;
	}

	public String getORT()
	{
		return ORT;
	}

	public void setORT(String ort)
	{
		ORT = ort;
	}

	public String getPLZ()
	{
		return PLZ;
	}

	public void setPLZ(String plz)
	{
		PLZ = plz;
	}

	public String getSCHU_ID()
	{
		return SCHU_ID;
	}

	public void setSCHU_ID(String schu_id)
	{
		SCHU_ID = schu_id;
	}

	public String getSCHULTRAEGER()
	{
		return SCHULTRAEGER;
	}

	public void setSCHULTRAEGER(String schultraeger)
	{
		SCHULTRAEGER = schultraeger;
	}

	public String getSTRASSE()
	{
		return STRASSE;
	}

	public void setSTRASSE(String strasse)
	{
		STRASSE = strasse;
	}

	public String getKREI_BEZEICHNUNG() {
		return KREI_BEZEICHNUNG;
	}

	public void setKREI_BEZEICHNUNG(String krei_bezeichnung) {
		KREI_BEZEICHNUNG = krei_bezeichnung;
	}

	public String getSCHU_BEZEICHNUNG() {
		return SCHU_BEZEICHNUNG;
	}

	public void setSCHU_BEZEICHNUNG(String schu_bezeichnung) {
		SCHU_BEZEICHNUNG = schu_bezeichnung;
	}

	public String getGEPA_ID_TRAEGER()
	{
		return GEPA_ID_TRAEGER;
	}

	public void setGEPA_ID_TRAEGER(String gepa_id_traeger)
	{
		GEPA_ID_TRAEGER = gepa_id_traeger;
	}

	public SqlProcedure getP() {
		return p;
	}

	public void setP(SqlProcedure p) {
		this.p = p;
	}

	public String getSuchbegriff() {
		return suchbegriff;
	}

	public void setSuchbegriff(String suchbegriff) {
		this.suchbegriff = suchbegriff;
	}

	public String getHashValue() {
		return hashValue;
	}

	public void setHashValue(String hashValue) {
		this.hashValue = hashValue;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public String getSORT_ID()
    {
    	return SORT_ID;
    }

	public void setSORT_ID(String sort_id)
    {
    	SORT_ID = sort_id;
    }





}