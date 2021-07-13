package com.topdev.tsp.action.modules.cooperation;

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
import com.topdev.tsp.model.list.modules.cooperation.CooperationPartner;
import com.topdev.tsp.model.view.SchoolCooperation;

public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolCooperation mainObject;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolCooperation)loadMainObject(getParm("tspi"), new SchoolCooperation()));
		setRtErrors(mainObject.getErrors());
	}
	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));		
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	"Kooperationen"));
		
		SchoolCooperation sc = getMainObject();		
		List<Category> list = sc.getPartnerSortList();
		String lastCategory = "";
		for(Category c : list)
		{
			for(ComplexEntryList cel : getMainObject().getPartnerList().getEntryList())
			{
				CooperationPartner cp = (CooperationPartner)cel;
				if(cp.getKategorie_code().equals(c.getCode()))
				{		
					
					if (!lastCategory.equals(cp.getKategorie()))
					{
						lastCategory = cp.getKategorie();
						xml.getRoot().appendChild(xml.createContentElement("title",	lastCategory, "space-before", "3mm"));
					}

					String str = cp.getName();
					if (!empty(cp.getPartnerart()))
						str += " ("+cp.getPartnerart()+")";					
					
					Node table = xml.getRoot().appendChild(xml.createContentElement("table", "", "margin-top", "3mm"));
					table.appendChild(xml.createContentElement("table-column", "", "width", "4cm"));
					table.appendChild(xml.createContentElement("table-column", ""));					
					Node body = table.appendChild(xml.createContentElement("table-body", ""));
					
					Node row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", str, "colspan-font-weight", "2"));
					
					if (!empty(cp.getSchwerpunkt()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Schwerpunkt:"));
						row.appendChild(xml.createContentElement("table-cell", cp.getSchwerpunkt()));
					}
					
					if (!empty(cp.getBeginn()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Partner seit:"));
						row.appendChild(xml.createContentElement("table-cell", cp.getBeginn()));						
					}
					
					if (!empty(cp.getLand()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Land:"));
						row.appendChild(xml.createContentElement("table-cell", cp.getLand()));
					}
					
					str = "";
					if (!empty(cp.getStrasse())) str += cp.getStrasse();
					if (!empty(cp.getHausnummer())) str += " "+cp.getHausnummer();
					if (!empty(cp.getHausnummerzusatz())) str += " "+cp.getHausnummerzusatz();
					if (!empty(cp.getPlz())) str += ", "+cp.getPlz();
					if (!empty(cp.getOrt())) str += " "+cp.getOrt();
					if (!empty(str))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Adresse:"));											
						row.appendChild(xml.createContentElement("table-cell", str));
					}
					
					if (!empty(cp.getHomepage()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", "Homepage:"));
						row.appendChild(xml.createContentElement("table-cell", cp.getHomepage()));
					}					
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
	public SchoolCooperation getMainObject() {
		return mainObject;
	}
	public void setMainObject(SchoolCooperation mainObject) {
		this.mainObject = mainObject;
	}
}