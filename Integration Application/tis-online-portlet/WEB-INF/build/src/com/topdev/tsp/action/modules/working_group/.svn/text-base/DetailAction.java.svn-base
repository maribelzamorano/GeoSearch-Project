package com.topdev.tsp.action.modules.working_group;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.complex.ComplexList;
import com.topdev.tsp.model.list.modules.working_group.WorkingGroup;
import com.topdev.tsp.model.view.SchoolWorkingGroup;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolWorkingGroup schoolWorkingGroup;
	SchoolWorkingGroup mainObject;

	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolWorkingGroup)loadMainObject(getParm("tspi"), new SchoolWorkingGroup()));
		setRtErrors(mainObject.getErrors());
		schoolWorkingGroup = mainObject;
	}
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();
		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Arbeitsgemeinschaften", "space-after", "3mm"));


		SchoolWorkingGroup swg = getMainObject();
		Map<String, String>map = swg.getWorkinggroupSortList();
		for (Entry<String, String> entry : map.entrySet())
		{			
			String value = entry.getValue();
			ComplexList list = swg.getWorkinggroupList();
			if (!list.getEntryList().isEmpty())
			{		
				xml.getRoot().appendChild(xml.createContentElement("title", value, "space", "3mm"));
				
				Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
				table.appendChild(xml.createContentElement("table-column", "", "width", "8cm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
				table.appendChild(xml.createContentElement("table-column", "", "width", "2cm"));
				
				Node body = table.appendChild(xml.createContentElement("table-body", ""));						
				Node row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", ""));
				Node cell = row.appendChild(xml.createContentElement("table-cell", "", "colspan", "2"));
				cell.appendChild(xml.createContentElement("h3", "Anzahl Schüler"));
				row.appendChild(xml.createContentElement("table-cell", ""));
				
				row = body.appendChild(xml.createContentElement("table-row", ""));
				row.appendChild(xml.createContentElement("table-cell", ""));
				cell = row.appendChild(xml.createContentElement("table-cell", ""));
				cell.appendChild(xml.createContentElement("h3", "Gesamt"));
				cell = row.appendChild(xml.createContentElement("table-cell", ""));
				cell.appendChild(xml.createContentElement("h3", "Weiblich"));
				cell = row.appendChild(xml.createContentElement("table-cell", ""));
				cell.appendChild(xml.createContentElement("h3", "Gruppe(n)"));
				cell = row.appendChild(xml.createContentElement("table-cell", ""));
				cell.appendChild(xml.createContentElement("h3", "Wochenstunde(n)"));
				
				for (ComplexEntryList cel : list.getEntryList())
				{
					WorkingGroup wg = (WorkingGroup)cel;
					if (wg.getKategorie().equals(value))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						cell = row.appendChild(xml.createContentElement("table-cell", ""));
						cell.appendChild(xml.createContentElement("h3", wg.getInhalt()));
						row.appendChild(xml.createContentElement("table-cell", wg.getAnzahl_schueler()));
						row.appendChild(xml.createContentElement("table-cell", wg.getAnzahl_weiblich()));
						row.appendChild(xml.createContentElement("table-cell", wg.getAnzahl_gruppen()));
						row.appendChild(xml.createContentElement("table-cell", wg.getAnzahl_wochenstunden()));
					}
				}
	
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
	public SchoolWorkingGroup getSchoolWorkingGroup() {
		return schoolWorkingGroup;
	}

	public void setSchoolWorkingGroup(SchoolWorkingGroup schoolWorkingGroup) {
		this.schoolWorkingGroup = schoolWorkingGroup;
	}

	public SchoolWorkingGroup getMainObject()
	{
		return mainObject;
	}

	public void setMainObject(SchoolWorkingGroup mainObject)
	{
		this.mainObject = mainObject;
	}
}