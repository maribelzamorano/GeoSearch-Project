package com.topdev.tsp.action.modules.school_evolution;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionEmphasis;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionInstrument;
import com.topdev.tsp.model.list.modules.school_evolution.EvolutionIntention;
import com.topdev.tsp.model.view.SchoolSchoolEvolution;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolSchoolEvolution mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolSchoolEvolution)loadMainObject(getParm("tspi"), new SchoolSchoolEvolution()));
		setRtErrors(mainObject.getErrors());
	}
	
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Schulentwicklung"));
		
		SchoolSchoolEvolution sse = getMainObject();		
		// Entwicklungsvorhaben "Eigenverantwortliche Schule"
		EvolutionIntention ei = sse.getIntention();		
		if (!empty(ei.getBeschluss()))
		{
			xml.getRoot().appendChild(xml.createContentElement("title",	Message.getText("school_evolution.heading-Entwicklungsvorhaben"), "space", "3mm"));
			String str = Message.getText("school_evolution.text-beschluss1");
			str += " "+ei.getBeschluss()+" ";
			str += Message.getText("school_evolution.text-beschluss2");
			xml.getRoot().appendChild(xml.createContentElement("line",	str));
			if (!empty(ei.getExpertenbesuch()))
			{
				str = Message.getText("school_evolution.label-expertenbesuch")+" "+ei.getExpertenbesuch();
				xml.getRoot().appendChild(xml.createContentElement("line",	str));
			}
			if (!empty(ei.getAbschluss()))
			{				
				str = Message.getText("school_evolution.text-abschluss1")+" "+ei.getAbschluss()+" "+Message.getText("school_evolution.text-abschluss2"); 
				xml.getRoot().appendChild(xml.createContentElement("line",	str));
			}
			if (!empty(ei.getWiederholungsbesuch()))
			{
				xml.getRoot().appendChild(xml.createContentElement("line",	Message.getText("school_evolution.label-wiederholungsbesuch")+" "+ei.getWiederholungsbesuch()));
			}

		}
		
		// Schwerpunkte
		ComplexList list = sse.getEmphasisList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", Message.getText("school_evolution.heading-Schwerpunkte"), "space-before", "3mm"));
			for (ComplexEntryList cel : list.getEntryList())
			{				
				EvolutionEmphasis ee = (EvolutionEmphasis)cel;
				xml.getRoot().appendChild(xml.createContentElement("h3", ee.getEntwicklungsschritt(), "space-before", "3mm"));
				if (!empty(ee.getSchwerpunkt()))
					xml.appendPdfTextChildToRoot("line", ee.getSchwerpunkt(), "space-after", "0");
				if (!empty(ee.getBeteiligte()))
					xml.getRoot().appendChild(xml.createContentElement("line", "Beteiligte: "+ee.getBeteiligte()));
			}
		}
		
		// Qualitätsentwicklung und -sicherung
		list = sse.getInstrumentList();		
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Wichtige Instrumente unserer Qualitätsentwicklung und -sicherung", "space-before", "3mm"));
			for (ComplexEntryList cel : list.getEntryList())
			{				
				EvolutionInstrument einstr = (EvolutionInstrument)cel;
				xml.getRoot().appendChild(xml.createContentElement("h3", einstr.getInstrument_art(), "space-before", "3mm"));
				if (!empty(einstr.getBeschreibung()))
					xml.getRoot().appendChild(xml.createContentElement("line", einstr.getBeschreibung()));
				if (!empty(einstr.getBeteiligte()))
					xml.getRoot().appendChild(xml.createContentElement("line", "Beteiligte: "+einstr.getBeteiligte()));					
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
		setRtErrors(getMainObject().saveData());
		return "saved";
	}

	public SchoolSchoolEvolution getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolSchoolEvolution mainObject)
	{
		this.mainObject = mainObject;
	}
}
