package com.topdev.tsp.action.modules.learner_structure;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.simple.SimpleEntry;
import com.topdev.tsp.model.list.simple.SimpleEntryList;
import com.topdev.tsp.model.list.simple.SimpleList;
import com.topdev.tsp.model.view.SchoolLearnerStructure;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolLearnerStructure mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolLearnerStructure)loadMainObject(getParm("tspi"), new SchoolLearnerStructure()));
		setRtErrors(mainObject.getErrors());
	}
	
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Schülerstrukturdaten", "space-after", "3mm"));
				

		Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
		table.appendChild(xml.createContentElement("table-column", "", "width", "6cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "3cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "3cm"));
		
		Node body = table.appendChild(xml.createContentElement("table-body", ""));
		
		// Oberste Zeile
		Node row = body.appendChild(xml.createContentElement("table-row", ""));		
		row.appendChild(xml.createContentElement("table-cell", ""));
		row.appendChild(xml.createContentElement("table-cell", ""));		
		Node cell = row.appendChild(xml.createContentElement("table-cell", "", "colspan", "2"));
		cell.appendChild(xml.createContentElement("h3", "Anzahl der Schüler"));		
		
		row = body.appendChild(xml.createContentElement("table-row", ""));
		cell = row.appendChild(xml.createContentElement("table-cell", ""));
		cell.appendChild(xml.createContentElement("h3", "Klassenstufe"));
				
		cell = row.appendChild(xml.createContentElement("table-cell", ""));
		cell.appendChild(xml.createContentElement("h3", "Anzahl der Klassen"));
		
		cell = row.appendChild(xml.createContentElement("table-cell", ""));
		cell.appendChild(xml.createContentElement("h3", "Gesamt"));
		
		cell = row.appendChild(xml.createContentElement("table-cell", ""));
		cell.appendChild(xml.createContentElement("h3", "Weiblich"));
		
		SimpleList list = getMainObject().getLearnerList();
		for (SimpleEntryList entry : list.getEntryList())
		{
			row = body.appendChild(xml.createContentElement("table-row", ""));
						
			List<SimpleEntry> en = entry.getEntries();
			row.appendChild(xml.createContentElement("table-cell", en.get(0).getDecode()));
			row.appendChild(xml.createContentElement("table-cell", en.get(1).getDecode()));
			row.appendChild(xml.createContentElement("table-cell", en.get(2).getDecode()));
			row.appendChild(xml.createContentElement("table-cell", en.get(3).getDecode()));
		}
				
		boolean change = false;
		if (!empty(getMainObject().getQuelle()))
		{
			change = true;
			xml.getRoot().appendChild(xml.createContentElement("small", "Quelle: "+getMainObject().getQuelle(), "space-before", "1cm"));
		}
		if (!empty(getMainObject().getPts()))
		{
			if (change)
				xml.getRoot().appendChild(xml.createContentElement("small", "Stand: "+getMainObject().getPts()));
			else
				xml.getRoot().appendChild(xml.createContentElement("small", "Stand: "+getMainObject().getPts(), "space-before", "1cm"));
		}	

		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.reset();
		response.setContentType("application/pdf");
		response.getOutputStream().write(Renderer.transformToBytes(xml.render(), getRealPath("/resources/xsl/fo/view.xsl"), Renderer.MODE_PDF));
		response.getOutputStream().close();
		return null;
    }
	
	public SchoolLearnerStructure getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolLearnerStructure mainObject)
	{
		this.mainObject = mainObject;
	}




}