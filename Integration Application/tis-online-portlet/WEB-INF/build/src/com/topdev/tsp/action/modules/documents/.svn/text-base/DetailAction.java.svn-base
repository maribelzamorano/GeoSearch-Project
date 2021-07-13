package com.topdev.tsp.action.modules.documents;

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
import com.topdev.tsp.model.list.Category;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.documents.Documents;
import com.topdev.tsp.model.list.modules.documents.Link;
import com.topdev.tsp.model.view.SchoolDocuments;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolDocuments mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolDocuments)loadMainObject(getParm("tspi"), new SchoolDocuments()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {
		initData( false);
		XML xml = new XML();
		
		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Dokumente / Links"));
		
		Node table, body, row;
		// Dokumente		
		List<Category> list = getMainObject().getDocumentSortList();
		String lastCategory = "";		
		int counter=0;
		for(Category c : list)
		{
			// Nur 30 Datensätze auf einer Seite darstellen, ansonsten Seitenumbruch und dann weiter darstellen
			if (counter >= 30)
			{
				xml.getRoot().appendChild(xml.createContentElement("title", c.getDecode(), "break", "3mm"));
				counter = 0;
			}
			else
				xml.getRoot().appendChild(xml.createContentElement("title", c.getDecode(), "space", "3mm"));
			
			table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			table.appendChild(xml.createContentElement("table-column", "", "width", "8cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", "3cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", "4cm"));
			body = table.appendChild(xml.createContentElement("table-body", ""));

			for(ComplexEntryList cel : getMainObject().getDocumentList().getEntryList())
			{
				Documents doc = (Documents)cel;
				if(doc.getDokumentart_code().equals(c.getCode()))
				{
					if (!lastCategory.equals(doc.getDokumentart_decode()))
					{
						lastCategory = doc.getDokumentart_decode();
						
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Beschreibung", "font-weight", "bold"));
						row.appendChild(xml.createContentElement("table-cell", "Typ", "font-weight", "bold"));
						row.appendChild(xml.createContentElement("table-cell", "Größe", "font-weight", "bold"));
						row.appendChild(xml.createContentElement("table-cell", "letzte Aktualisierung", "font-weight", "bold"));
					}
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", doc.getBeschreibung()));
					row.appendChild(xml.createContentElement("table-cell", doc.getTyp()));
					row.appendChild(xml.createContentElement("table-cell", doc.getGroesse()));
					row.appendChild(xml.createContentElement("table-cell", doc.getDatum()));
					
					counter++;
				}
				
			}
		}
				
		// Links
		ComplexList cl = getMainObject().getLinkList();
		if (!cl.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Links", "space", "3mm"));
			table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			table.appendChild(xml.createContentElement("table-column", "", "width", "8cm"));
			table.appendChild(xml.createContentElement("table-column", "", "width", "6cm"));
			
			body = table.appendChild(xml.createContentElement("table-body", ""));
			row = body.appendChild(xml.createContentElement("table-row", ""));
			row.appendChild(xml.createContentElement("table-cell", "Verweis", "font-weight", "bold"));
			row.appendChild(xml.createContentElement("table-cell", "Letzte Aktualisierung", "font-weight", "bold"));
			
			for (ComplexEntryList entry : cl.getEntryList())
			{
				Link link = (Link)entry;
				
				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", link.getText()));
				row.appendChild(xml.createContentElement("table-cell", link.getDatum()));				
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

	public SchoolDocuments getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolDocuments mainObject)
	{
		this.mainObject = mainObject;
	}

	
}