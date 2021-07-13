package com.topdev.tsp.action.modules.neuter_resources;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesCabinet;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesHandicap;
import com.topdev.tsp.model.list.modules.neuter_resources.NeuterResourcesSport;
import com.topdev.tsp.model.view.SchoolNeuterResources;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolNeuterResources mainObject;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolNeuterResources)loadMainObject(getParm("tspi"), new SchoolNeuterResources()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Sächliche Ressourcen"));
		
		
		SchoolNeuterResources s = getMainObject();

		// GebÃ¤ude
		if (!empty(s.getBeschreibung_gebaeude()))
			xml.getRoot().appendChild(xml.createContentElement("title",	"Schulgebäude", "space-before", "3mm"));
		if (!empty(s.getBeschreibung_gebaeude()))
			xml.appendPdfTextChildToRoot("line", s.getBeschreibung_gebaeude(), "space-before", "3mm");
		if (!empty(s.getBeschreibung_weitere_gebaeude()))
			xml.appendPdfTextChildToRoot("line", s.getBeschreibung_weitere_gebaeude(), "space-before", "3mm");
		
		ComplexList list = s.getHandicapList();
		if (!list.getEntryList().isEmpty() || !empty(s.getBesonderheiten_beau()))
		{
			xml.getRoot().appendChild(xml.createContentElement("title",	"Behindertengerechte Ausführung", "space", "3mm"));

			if (!empty(s.getBesonderheiten_beau()))
				xml.appendPdfTextChildToRoot("line", s.getBesonderheiten_beau(), "space-after", "0");	
			
			// Behindertengerechte Ausstattung		
			if (!list.getEntryList().isEmpty())
				{
				Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "1cm"));
				table.appendChild(xml.createContentElement("table-column", ""));					
				Node body = table.appendChild(xml.createContentElement("table-body", ""));				
	
				Node row;
	
				for (ComplexEntryList cel : list.getEntryList())
				{
					NeuterResourcesHandicap nrh = (NeuterResourcesHandicap)cel;
					row = body.appendChild(xml.createContentElement("table-row", "", "height", "15pt"));
					Node cell = row.appendChild(xml.createContentElement("table-cell", "", "width", "0"));
					cell.appendChild(xml.createContentElement("image", "", "src", getConfig("context-url_nonssl")+"/images/ci/list/handicap_"+nrh.getAuar_code()+".gif"));
					row.appendChild(xml.createContentElement("table-cell", nrh.getAuar_decode(), "display-align", "center"));													
				}
			}
		}
		
		// Sporthallen
		list = s.getSportList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title",	"Sportstätten", "space", "3mm"));
			for (ComplexEntryList cel : list.getEntryList())
			{
				NeuterResourcesSport nrs = (NeuterResourcesSport)cel;
				
				Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
				table.appendChild(xml.createContentElement("table-column", ""));					
				Node body = table.appendChild(xml.createContentElement("table-body", ""));				

				Node row;
				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", nrs.getSportstaettenart(), "colspan-font-weight", "2"));
				
				if (!empty(nrs.getBeschreibung()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));					
					row.appendChild(xml.createContentElement("table-cell", nrs.getBeschreibung(), "colspan", "2"));													
				}
				if (!empty(nrs.getEntfernung()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Entfernung von Schule:"));
					row.appendChild(xml.createContentElement("table-cell", nrs.getEntfernung()+" m"));					
				}
				if (!empty(nrs.getGroesse()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Größe:"));
					row.appendChild(xml.createContentElement("table-cell", nrs.getGroesse()+" m²"));					
				}				
				if (!empty(nrs.getAusstattung()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Ausstattung:"));
					row.appendChild(xml.createContentElement("table-cell", nrs.getAusstattung()));					
				}
				if (!empty(nrs.getErreichbarkeit()))
				{
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", "Erreichbarkeit:"));
					row.appendChild(xml.createContentElement("table-cell", nrs.getErreichbarkeit()));					
				}
			}
		}
		
		// UnterrichtsrÃ¤ume und Fachkabinette
		list = s.getCabinetList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title",	"Unterrichtsräume und Fachkabinette", "space", "3mm"));
			for (ComplexEntryList cel : list.getEntryList())
			{
				NeuterResourcesCabinet nrc = (NeuterResourcesCabinet)cel;
				if (!empty(nrc.getNutzungsprofil()))
					xml.getRoot().appendChild(xml.createContentElement("line",	nrc.getNutzungsprofil()+" ("+nrc.getAnzahl()+")"));
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
		HashMap map = getActionParameters();
		mainObject.setBeschreibung_gebaeude(			(String) map.get("beschreibung_gebaeude"));
		mainObject.setBeschreibung_weitere_gebaeude(	(String) map.get("beschreibung_weitere_gebaeude"));
		mainObject.setBesonderheiten_beau(			(String) map.get("besonderheiten_beau"));
		setRtErrors(mainObject.saveData());
		return "saved";
		
    }
	public SchoolNeuterResources getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(SchoolNeuterResources mainObject)
	{
		this.mainObject = mainObject;
	}


}