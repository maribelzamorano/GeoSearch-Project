package com.topdev.tsp.action.modules.pupil_magazine;

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
import com.topdev.tsp.model.view.SchoolPupilMagazine;
 
public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolPupilMagazine mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolPupilMagazine)loadMainObject(getParm("tspi"), new SchoolPupilMagazine()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Schülerzeitung", "space-after", "3mm"));
								
		SchoolPupilMagazine spm = getMainObject();
		
		if (spm.getPupilmagazineList().getEntryList().size() > 0)
		{
			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			table.appendChild(xml.createContentElement("table-column", "", "width", "4cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", "4cm"));
			
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			// Oberste Zeile
			Node row = body.appendChild(xml.createContentElement("table-row", ""));		
			Node cell = row.appendChild(xml.createContentElement("table-cell", ""));
			cell.appendChild(xml.createContentElement("h3", "Ausgabezyklus"));		
			cell = row.appendChild(xml.createContentElement("table-cell", ""));
			cell.appendChild(xml.createContentElement("h3", "Auflagenhöhe"));		
			
			SimpleList list = spm.getPupilmagazineList();
			for (SimpleEntryList entry : list.getEntryList())
			{			
				List<SimpleEntry> en = entry.getEntries();
			
				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", en.get(0).getDecode()));
				row.appendChild(xml.createContentElement("table-cell", en.get(1).getDecode()));
			}
		}
		
		boolean change = false;
		if (!empty(getMainObject().getPts()))
		{
			change = true;
			xml.getRoot().appendChild(xml.createContentElement("small", "Quelle: "+getMainObject().getQuelle(), "space-before", "1cm"));
			
		}
		if (!empty(getMainObject().getQuelle()))
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
	
	public SchoolPupilMagazine getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolPupilMagazine mainObject)
	{
		this.mainObject = mainObject;
	}
}