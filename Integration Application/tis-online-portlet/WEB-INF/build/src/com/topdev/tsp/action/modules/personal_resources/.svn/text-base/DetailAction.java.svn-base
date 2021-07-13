package com.topdev.tsp.action.modules.personal_resources;

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
import com.topdev.tsp.model.list.modules.personal_resources.PersonalResourcesPersonal;
import com.topdev.tsp.model.view.SchoolPersonalResources;


public class DetailAction extends DetailActionSupport
{
	private static final long	serialVersionUID	= 1L;
	SchoolPersonalResources mainObject;
	String apply;
	String anwf;
	
	public void initData(boolean reinit) throws SQLException, PermissionException
	{
		setMainObject((SchoolPersonalResources)loadMainObject(getParm("tspi"), new SchoolPersonalResources()));
		setRtErrors(mainObject.getErrors());
	}

	public String print() throws Exception
    {		
		initData( false);
		XML xml = new XML();

		xml.getRoot().appendChild(xml.createContentElement("heading",	"Thüringer Schulportal - Schulporträt"));
		xml.getRoot().appendChild(xml.createContentElement("logo",	getConfig("context-url_nonssl")+"/images/ci/logo.jpg"));
		xml.getRoot().appendChild(xml.createContentElement("date",	(new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
		xml.getRoot().appendChild(xml.createContentElement("h1",	Message.getText("personal_resources.tabbox1.tablabel1"), "space-after", "3mm"));				
				
		List<Category> list = getMainObject().getPersonalSortList();
		String lastCategory = "";		
		for(Category c : list)
		{						
			for(ComplexEntryList cel : getMainObject().getPersonalList().getEntryList())
			{
				PersonalResourcesPersonal prp = (PersonalResourcesPersonal)cel;
				
				if(prp.getKategorie_code().equals(c.getCode()))
				{								
					if (!lastCategory.equals(prp.getKategorie()))
					{
						lastCategory = prp.getKategorie();
						xml.getRoot().appendChild(xml.createContentElement("title", lastCategory, "space-before", "3mm"));
					}
					Node table = xml.getRoot().appendChild(xml.createContentElement("table", ""));
					table.appendChild(xml.createContentElement("table-column", "", "width", "7cm"));
					table.appendChild(xml.createContentElement("table-column", ""));					
					Node body = table.appendChild(xml.createContentElement("table-body", ""));
					
					Node row = body.appendChild(xml.createContentElement("table-row", ""));
					row.appendChild(xml.createContentElement("table-cell", prp.getFunktion()+":", "font-weight", "bold"));
					row.appendChild(xml.createContentElement("table-cell", prp.getTitel()+" "+prp.getVorname()+" "+prp.getNachname()));
										
					if (!empty(prp.getTelefon()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("personal_resources.field_info-telefon")+":"));
						row.appendChild(xml.createContentElement("table-cell", prp.getTelefon()));						
					}
					if (!empty(prp.getEmail()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("personal_resources.field_info-email")+":"));
						row.appendChild(xml.createContentElement("table-cell", prp.getEmail()));						
					}
					if (!empty(prp.getSprechzeiten()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("personal_resources.field_info-sprechzeiten")+":"));
						row.appendChild(xml.createContentElement("table-cell", prp.getSprechzeiten()));											
					}
					if (!empty(prp.getBemerkung()))
					{
						row = body.appendChild(xml.createContentElement("table-row", ""));
						row.appendChild(xml.createContentElement("table-cell", Message.getText("personal_resources.field_info-bemerkung")+":"));
						row.appendChild(xml.createContentElement("table-cell", prp.getBemerkung()));											
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
	public SchoolPersonalResources getMainObject() {
		return mainObject;
	}
	public void setMainObject(SchoolPersonalResources mainObject) {
		this.mainObject = mainObject;
	}

	public String getApply() {
		return apply;
	}

	public void setApply(String apply) {
		this.apply = apply;
	}

	public String getAnwf() {
		return anwf;
	}

	public void setAnwf(String anwf) {
		this.anwf = anwf;
	}
}