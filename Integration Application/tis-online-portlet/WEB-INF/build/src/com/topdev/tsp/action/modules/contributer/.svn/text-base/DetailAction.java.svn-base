package com.topdev.tsp.action.modules.contributer;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Node;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.tsp.action.basic.DetailActionSupport;
import com.topdev.tsp.exception.PermissionException;
import com.topdev.tsp.model.list.Category;
import com.topdev.tsp.model.list.complex.ComplexEntryList;
import com.topdev.tsp.model.list.modules.contributer.Contributer;
import com.topdev.tsp.model.view.SchoolContributer;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolContributer mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolContributer)loadMainObject(getParm("tspi"), new SchoolContributer()));
		setRtErrors(mainObject.getErrors());
	}
	
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	Message.getText("contributer.tabbox1.tablabel1")));
				
		List<Category> list = getMainObject().getContributerSortList();
		
		String lastCategory = "";
		
		Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
		table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "5cm"));
		table.appendChild(xml.createContentElement("table-column", "", "width", "8cm"));
		
		Node body = table.appendChild(xml.createContentElement("table-body", ""));
		Node row;		
		for(Category c : list)
		{
			for(ComplexEntryList cel : getMainObject().getContributerList().getEntryList())
			{
				Contributer con = (Contributer)cel;
				if(con.getKategorie_code().equals(c.getCode()))
				{						
					if (!lastCategory.equals(con.getKategorie()))
					{
						lastCategory = con.getKategorie();						
						
						row = body.appendChild(xml.createContentElement("table-row", ""));						
						Node cell = row.appendChild(xml.createContentElement("table-cell", "", "colspan-space", "3"));
						cell.appendChild(xml.createContentElement("title", lastCategory));
						
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Name", "font-weight", "bold"));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("contributer.field_info-funktion_code"), "font-weight", "bold"));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("contributer.field_info-erreichbarkeit"), "font-weight", "bold"));
					}
					row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", con.getTitel()+" "+con.getVorname()+" "+con.getNachname()));
					row.appendChild(xml.createContentElement("table-cell", con.getFunktion()));
					row.appendChild(xml.createContentElement("table-cell", con.getErreichbarkeit()));
				}
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
	public SchoolContributer getMainObject() {
		return mainObject;
	}
	public void setMainObject(SchoolContributer mainObject) {
		this.mainObject = mainObject;
	}

	
	
}