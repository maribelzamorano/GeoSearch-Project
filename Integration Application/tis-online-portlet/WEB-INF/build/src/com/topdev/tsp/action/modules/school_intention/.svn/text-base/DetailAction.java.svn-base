package com.topdev.tsp.action.modules.school_intention;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.simple.SimpleEntry;
import com.topdev.tsp.model.view.SchoolSchoolIntention;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolSchoolIntention mainObject = new SchoolSchoolIntention();
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolSchoolIntention)loadMainObject(getParm("tspi"), new SchoolSchoolIntention()));
		setRtErrors(mainObject.getErrors());
	}
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Inhaltliche Schwerpunkte"));
		
		// Teilnahme
		SchoolSchoolIntention ssi = getMainObject();
		ComplexList list = ssi.getIntentionList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Wir nehmen teil am:", "space", "3mm"));
			for (ComplexEntryList entry : list.getEntryList())
			{
				List<SimpleEntry> en = entry.getEntries();				
				xml.getRoot().appendChild(xml.createContentElement("line", en.get(0).getDecode(), "space-after", "3mm"));
			}
		}
		
		// Fremdsprachen
		list = ssi.getForeignlanguageList();
		if (!list.getEntryList().isEmpty())
		{
			String str;
			if (list.getEntryList().size() > 1) str = "Fremdsprachen";
			else str = "Fremdsprache";
					
			xml.getRoot().appendChild(xml.createContentElement("title", "Wir bieten folgende "+str+" an: ", "space", "3mm"));
			
			for (ComplexEntryList entry : list.getEntryList())
			{
				List<SimpleEntry> en = entry.getEntries();		
				xml.getRoot().appendChild(xml.createContentElement("line", en.get(0).getDecode(), "space-after", "3mm"));
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
	public SchoolSchoolIntention getMainObject()
	{
		return mainObject;
	}
	public void setMainObject(SchoolSchoolIntention mainObject)
	{
		this.mainObject = mainObject;
	}




}