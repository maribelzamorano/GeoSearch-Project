package com.topdev.tsp.action.modules.school_life;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.Category;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeContest;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeOffer;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeProject;
import com.topdev.tsp.model.list.modules.school_life.SchoolLifeTradition;
import com.topdev.tsp.model.view.SchoolSchoolLife;

public class DetailAction extends DetailActionSupport
{

	private static final long	serialVersionUID	= 1L;
	SchoolSchoolLife mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolSchoolLife)loadMainObject(getParm("tspi"), new SchoolSchoolLife()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Schulleben"));
	
		// Teilnahme an Wettbewerben
		List<Category> list = getMainObject().getContestSortList();
		String lastCategory = "";
		if (!list.isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("school_life.label-attent_contest"), "space-before", "3mm"));
			for(Category c : list)
			{
				for(ComplexEntryList cel : getMainObject().getContestList().getEntryList())
				{
					SchoolLifeContest slc = (SchoolLifeContest)cel;
					if(slc.getKategorie_code().equals(c.getCode()))
					{						
						if (!lastCategory.equals(slc.getKategorie()))
						{
							lastCategory = slc.getKategorie();						
							xml.getRoot().appendChild(xml.createContentElement("h3",	lastCategory, "space-before", "3mm"));						
						}
						
						if (!empty(slc.getWett_bezeichnung()))
							xml.getRoot().appendChild(xml.createContentElement("line", slc.getWett_bezeichnung()));
					}
				}
			}
		}
		
		// Förderangebote
		ComplexList clist = getMainObject().getOfferList();		
		if (!clist.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Förderangebote", "space-before", "3mm"));
			for (ComplexEntryList cel : clist.getEntryList())
			{
				SchoolLifeOffer slo = (SchoolLifeOffer)cel;				

				xml.getRoot().appendChild(xml.createContentElement("h3", slo.getFoan_bezeichnung(), "space-before", "3mm"));
				if (!empty(slo.getFoan_beschreibung()))
				{				
					xml.appendPdfTextChildToRoot("line", slo.getFoan_beschreibung(), "space-before", "0");
				}
				
				if (!empty(slo.getFaecher()) || 
					!empty(slo.getKlassenstufen()) || 
					!empty(slo.getWeitere_informationen()))
				{
					Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
					table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
					table.appendChild(xml.createContentElement("table-column", ""));					
					Node body = table.appendChild(xml.createContentElement("table-body", ""));				

					Node row;
					if (!empty(slo.getFaecher()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Fächer:"));
						row.appendChild(xml.createContentElement("table-cell", slo.getFaecher()));													
					}							
					if (!empty(slo.getKlassenstufen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Klassenstufen"));
						row.appendChild(xml.createContentElement("table-cell", slo.getKlassenstufen()));													
					}
					if (!empty(slo.getWeitere_informationen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Weitere Informationen"));
						row.appendChild(xml.createContentElement("table-cell", slo.getWeitere_informationen()));													
					}
				}
			}
		}

		// Projekte
		clist = getMainObject().getProjectList();		
		if (!clist.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("school_life.tabbox1.tablabel2"), "space-before", "3mm"));
			for (ComplexEntryList cel : clist.getEntryList())
			{
				SchoolLifeProject slp = (SchoolLifeProject)cel;								
				
				xml.getRoot().appendChild(xml.createContentElement("h3", slp.getEipr_bezeichnung(), "space-before", "3mm"));
				if (!empty(slp.getEipr_beschreibung()))
				{				
					xml.appendPdfTextChildToRoot("line", slp.getEipr_beschreibung(), "space-before", "0");
				}
				
				if (!empty(slp.getFaecher()) || 
					!empty(slp.getKlassenstufen()) || 
					!empty(slp.getWeitere_informationen()))
				{
					Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
					table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
					table.appendChild(xml.createContentElement("table-column", ""));					
					Node body = table.appendChild(xml.createContentElement("table-body", ""));				
	
					Node row;
					if (!empty(slp.getFaecher()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Fächer:"));
						row.appendChild(xml.createContentElement("table-cell", slp.getFaecher()));													
					}									
					if (!empty(slp.getKlassenstufen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Klassenstufen:"));
						row.appendChild(xml.createContentElement("table-cell", slp.getKlassenstufen()));													
					}				
					if (!empty(slp.getWeitere_informationen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Weitere Informationen:"));
						row.appendChild(xml.createContentElement("table-cell", slp.getWeitere_informationen()));													
					}
				}
			}
		}
		
		// Traditionen
		clist = getMainObject().getTraditionList();		
		if (!clist.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("school_life.tabbox1.tablabel3"), "space-before", "3mm"));
			for (ComplexEntryList cel : clist.getEntryList())
			{
				SchoolLifeTradition slt = (SchoolLifeTradition)cel;				

				xml.getRoot().appendChild(xml.createContentElement("h3", slt.getTrad_bezeichnung(), "space-before", "3mm"));
				if (!empty(slt.getTrad_beschreibung()))
				{				
					xml.appendPdfTextChildToRoot("line", slt.getTrad_beschreibung(), "space-before", "0");
				}
				
				if (!empty(slt.getFaecher()) || 
					!empty(slt.getKlassenstufen()) || 
					!empty(slt.getWeitere_informationen()))
				{
					Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
					table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
					table.appendChild(xml.createContentElement("table-column", ""));					
					Node body = table.appendChild(xml.createContentElement("table-body", ""));				
	
					Node row;
					if (!empty(slt.getFaecher()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Fächer:"));
						row.appendChild(xml.createContentElement("table-cell", slt.getFaecher()));													
					}									
					if (!empty(slt.getKlassenstufen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Klassenstufen:"));
						row.appendChild(xml.createContentElement("table-cell", slt.getKlassenstufen()));													
					}				
					if (!empty(slt.getWeitere_informationen()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Weitere Informationen:"));
						row.appendChild(xml.createContentElement("table-cell", slt.getWeitere_informationen()));													
					}
				}
			}
		}

		boolean change = false;
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
		init("save");
		setRtErrors(mainObject.saveData());
		return "saved";
    }

	public SchoolSchoolLife getMainObject() {
		return mainObject;
	}
	public void setMainObject(SchoolSchoolLife mainObject) {
		this.mainObject = mainObject;
	}

	
}