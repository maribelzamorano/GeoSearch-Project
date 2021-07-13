package com.topdev.tsp.action.modules.school_library;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.school_library.SchoolLibrary;
import com.topdev.tsp.model.view.SchoolSchoolLibrary;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolSchoolLibrary mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolSchoolLibrary)loadMainObject(getParm("tspi"), new SchoolSchoolLibrary()));
		setRtErrors(mainObject.getErrors());
	}
	
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Schulbibliothek", "space", "3mm"));
						
		SchoolSchoolLibrary ssl = getMainObject();
		
		// Verwaltung
		ComplexList list = ssl.getLibraryList_manage();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Verwaltung", "space", "3mm"));
			
			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			table.appendChild(xml.createContentElement("table-column", "", "width", "6cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", ""));
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			for (ComplexEntryList cel : list.getEntryList())
			{
				SchoolLibrary sl = (SchoolLibrary)cel;
				
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				Node cell =row.appendChild(xml.createContentElement("table-cell", "")); 
				cell.appendChild(xml.createContentElement("h3", sl.getMerkmal()+":"));
				row.appendChild(xml.createContentElement("table-cell", sl.getAngabe()));
			}
		}
		
		// Verwaltung
		list = ssl.getLibraryList_equipe();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Austattung", "space", "3mm"));

			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", ""));
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			for (ComplexEntryList cel : list.getEntryList())
			{				
				SchoolLibrary sl = (SchoolLibrary)cel;
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				Node cell =row.appendChild(xml.createContentElement("table-cell", "")); 
				cell.appendChild(xml.createContentElement("h3", sl.getMerkmal()+":"));
				row.appendChild(xml.createContentElement("table-cell", sl.getAngabe()));
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
	
	public SchoolSchoolLibrary getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolSchoolLibrary mainObject)
	{
		this.mainObject = mainObject;
	}
}