package com.topdev.tsp.action.modules.activate_quality;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.activate_quality.ActivateQualityExpertise;
import com.topdev.tsp.model.view.SchoolActivateQuality;


public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolActivateQuality mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolActivateQuality)loadMainObject(getParm("tspi"), new SchoolActivateQuality()));
		setRtErrors(mainObject.getErrors());
	}

	public String save() throws Exception
    {
		init("save");
		setRtErrors(mainObject.saveData());
		return "saved";
		
    }
	
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Wirkungsqualitäten", "space-after", "3mm"));
								
		SchoolActivateQuality saq = getMainObject();
		ComplexList list = saq.getExpertiseList();
		if (!list.getEntryList().isEmpty())
		{
			for (ComplexEntryList cel : list.getEntryList())
			{
				ActivateQualityExpertise aqe = (ActivateQualityExpertise)cel;
				xml.getRoot().appendChild(xml.createContentElement("line", aqe.getBeschreibung(), "space-after", "3mm"));
				//xml.getRoot().appendChild(xml.createContentElement("line", aqe.getSortierung()));
				
			}
		}
		
		xml.getRoot().appendChild(xml.createContentElement("small", "(Auswahl an Ergebnissen der Kompetenztests und ThüNIS)", "space-before", "1cm"));
		xml.getRoot().appendChild(xml.createContentElement("small", "letzte Änderung: "+getMainObject().getPts()));

		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/pdf");
		response.getOutputStream().write(Renderer.transformToBytes(xml.render(), getRealPath("/resources/xsl/fo/view.xsl"), Renderer.MODE_PDF));
		response.getOutputStream().close();
		return null;
    }
	public SchoolActivateQuality getMainObject() {
		return mainObject;
	}
	public void setMainObject(SchoolActivateQuality mainObject) {
		this.mainObject = mainObject;
	}



	
}