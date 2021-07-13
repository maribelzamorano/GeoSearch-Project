package com.topdev.tsp.action.modules.businesspartner;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.simple.SimpleEntry;
import com.topdev.tsp.model.view.SchoolOverview;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolOverview schoolOverview;
	SchoolOverview mainObject = new SchoolOverview();
	String apply;
	String anwf;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolOverview)loadMainObject(getParm("tspi"), new SchoolOverview()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {
		initData( false);
		XML xml = new XML();
		SchoolOverview s = getMainObject();		
		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - "+(Validator.equals(anwf, "media")?"Medienzentrum":"Schulporträt")));
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",										s.getSchulname()));
		xml.getRoot().appendChild(xml.createContentElement("small",										s.getCc_schulart_dien_nr(), "space-after", "5mm"));
		xml.getRoot().appendChild(xml.createContentElement("line",										s.getCc_strasse()));
		xml.getRoot().appendChild(xml.createContentElement("line",										s.getCc_plz_ort(), 		"space-after", "3mm"));
		if (!empty(s.getTelefon()))
			xml.getRoot().appendChild(xml.createContentElement("line",	"Telefon:  "					+s.getTelefon()));
		if (!empty(s.getTelefon_hort()))
			xml.getRoot().appendChild(xml.createContentElement("line",	"Telefon (Hort):  "				+s.getTelefon_hort()));
		if (!empty(s.getTelefax()))
				xml.getRoot().appendChild(xml.createContentElement("line",	"Telefax:  "				+s.getTelefax()));
		if (!empty(s.getEmail()))
				xml.getRoot().appendChild(xml.createContentElement("line",	"E-Mail:  "					+s.getEmail()));
		if (!empty(s.getUrl()))
				xml.getRoot().appendChild(xml.createContentElement("line",	"Internet:  "				+s.getUrl()));
		boolean change = false;
		if (!empty(s.getSchultraeger()))		
		{
			xml.getRoot().appendChild(xml.createContentElement("line",	"Schulträger:  "			+s.getSchultraeger(), "space-before", "3mm"));
			change = true;
		}
		if (!empty(s.getSchulamt()))
		{
			if (!change)
				xml.getRoot().appendChild(xml.createContentElement("line",	"Schulamt:  "+				s.getSchulamt(), "space-before", "3mm"));
			else
				xml.getRoot().appendChild(xml.createContentElement("line",	"Schulamt:  "+				s.getSchulamt()));
		}
			
		
		// Schulteile
		ComplexList list = s.getSchooltractList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("businesspartner.label-schulteile"), "space-before", "3mm"));
			for (ComplexEntryList entry : list.getEntryList())
			{
				List<SimpleEntry> en = entry.getEntries();				
				
				Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
				table.appendChild(xml.createContentElement("table-column", ""));
				Node body = table.appendChild(xml.createContentElement("table-body", ""));
				
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", en.get(0).getDecode(), "font-weight", "bold"));

				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", en.get(2).getDecode(), "colspan", "2"));

				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", en.get(1).getDecode(), "colspan", "2"));
				
				if (!empty(en.get(3).getDecode()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Telefon:"));
					row.appendChild(xml.createContentElement("table-cell", en.get(3).getDecode()));			
				}
				if (!empty(en.get(3).getDecode()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Telefax:"));
					row.appendChild(xml.createContentElement("table-cell", en.get(4).getDecode()));			
				}
				if (!empty(en.get(3).getDecode()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Email:"));
					row.appendChild(xml.createContentElement("table-cell", en.get(5).getDecode()));			
				}

			}
		}
		
		if (!empty(s.getLeitbild()))
		{
			xml.getRoot().appendChild(xml.createContentElement("title","Leitbild","space", "3mm"));
			String leitbild = s.getLeitbild();
			String str = leitbild.replaceAll("\\[list\\]","").replaceAll("\\[/list\\]","").replaceAll("\\[\\*\\]","- ");
			xml.appendPdfTextChildToRoot("line",str, "space-after", "3mm");			
		}
		if (!empty(s.getWegbeschreibung()))
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("businesspartner.field_info-wegbeschreibung"), "space-after", "3mm"));
			xml.appendPdfTextChildToRoot("line",s.getWegbeschreibung(), "space-after", "0");
		}
		
		change = false;
		if (!empty(getMainObject().getPts()))
		{
			change = true;
			xml.getRoot().appendChild(xml.createContentElement("small", "Letzte Änderung: "+getMainObject().getPts(), "space-before", "1cm"));
		}
		if (!empty(getMainObject().getQuelle()))
		{
			if (change)
				xml.getRoot().appendChild(xml.createContentElement("small", "Quelle: "+getMainObject().getQuelle()));
			else
				xml.getRoot().appendChild(xml.createContentElement("small", "Quelle: "+getMainObject().getQuelle(), "space-before", "1cm"));
		}	
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/pdf");
		response.getOutputStream().write(Renderer.transformToBytes(xml.render(), getRealPath("/resources/xsl/fo/view.xsl"), Renderer.MODE_PDF));
		response.getOutputStream().close();
		return null;
    }


	public String save() throws Exception
	{
		super.init("save");
		HashMap map = getActionParameters();
		//getMainObject().setSchulnummer(		(String) map.get("schulnummer"));
		getMainObject().setSchulname(		(String) map.get("schulname"));
		getMainObject().setSchulname2(		(String) map.get("schulname2"));
		getMainObject().setSchulname3(		(String) map.get("schulname3"));
		getMainObject().setSchulart_code(	(String) map.get("schulart_code"));
		getMainObject().setGepa_id_traeger(	(String) map.get("gepa_id_traeger"));
		getMainObject().setSchulamt_code(	(String) map.get("schulamt_code"));
		getMainObject().setWegbeschreibung(	(String) map.get("wegbeschreibung"));
		getMainObject().setLeitbild(		(String) map.get("leitbild"));
		getMainObject().setAufgaben(		(String) map.get("aufgaben"));
		getMainObject().setOeffnungszeiten(	(String) map.get("oeffnungszeiten"));
		setRtErrors(getMainObject().saveData());
		if(Validator.equals(apply, "true") && getRtErrors().size()<1) getMainObject().loadData();
		return "saved";
	}
	public SchoolOverview getSchoolOverview() {
		return schoolOverview;
	}
	public void setSchoolOverview(SchoolOverview schoolOverview) {
		this.schoolOverview = schoolOverview;
	}


	public SchoolOverview getMainObject()
	{
		return mainObject;
	}


	public void setMainObject(SchoolOverview mainObject)
	{
		this.mainObject = mainObject;
	}

	public String getApply() {
		return apply;
	}

	public void setApply(String apply) {
		this.apply = apply;
	}

	public String getAnwf() {
		return anwf;
	}

	public void setAnwf(String anwf) {
		this.anwf = anwf;
	}
}