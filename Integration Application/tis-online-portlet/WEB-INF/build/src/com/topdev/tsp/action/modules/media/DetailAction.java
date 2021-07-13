package com.topdev.tsp.action.modules.media;

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
import com.topdev.tsp.model.list.modules.media.MediaComputer;
import com.topdev.tsp.model.list.modules.media.MediaITRoom;
import com.topdev.tsp.model.list.modules.media.MediaInternet;
import com.topdev.tsp.model.view.SchoolMedia;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolMedia mainObject;
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolMedia)loadMainObject(getParm("tspi"), new SchoolMedia()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Medienausstattung", "space", "3mm"));
						
		SchoolMedia sm = getMainObject();
		
		// Räume
		ComplexList list = sm.getITroomList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Unterrichtsräume mit PC-Technik", "space", "3mm"));
			
			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			for (ComplexEntryList cel : list.getEntryList())
			{
				MediaITRoom mr = (MediaITRoom)cel;
				
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				Node cell =row.appendChild(xml.createContentElement("table-cell", "")); 
				cell.appendChild(xml.createContentElement("h3", mr.getRaumart()+":"));
				row.appendChild(xml.createContentElement("table-cell", mr.getAnzahl()));
			}
		}
		
		// Computer
		list = sm.getComputerList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Rechnerausstattung im Schülerbereich", "space", "3mm"));
			
			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			for (ComplexEntryList cel : list.getEntryList())
			{
				MediaComputer mc = (MediaComputer)cel;
				
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				Node cell =row.appendChild(xml.createContentElement("table-cell", "")); 
				cell.appendChild(xml.createContentElement("h3", mc.getRechnerart()+":"));
				row.appendChild(xml.createContentElement("table-cell", mc.getAnzahl()));
			}
		}
		
		// Internet
		list = sm.getInternetList();
		if (!list.getEntryList().isEmpty())
		{
			xml.getRoot().appendChild(xml.createContentElement("title", "Internetanschluss", "space", "3mm"));

			Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
			Node body = table.appendChild(xml.createContentElement("table-body", ""));
			
			for (ComplexEntryList cel : list.getEntryList())
			{				
				MediaInternet mi = (MediaInternet)cel;
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				Node cell =row.appendChild(xml.createContentElement("table-cell", "", "colspan", "2")); 
				cell.appendChild(xml.createContentElement("h3", mi.getAnzahl()+" x "+mi.getAnschlussart()));				
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
	public SchoolMedia getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolMedia mainObject)
	{
		this.mainObject = mainObject;
	}
}