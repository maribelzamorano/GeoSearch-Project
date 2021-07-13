package com.topdev.tsp.action.modules.medium.result_favorite;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Element;

import com.topdev.aa.lib.Constants;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.exception.StandardException;
import com.topdev.service.medium.Client;
import com.topdev.service.medium.data.BobjMedium;
import com.topdev.service.medium.data.SobjMedium;

public class DetailAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;

	SobjMedium searchObj;
	String page;
	String heading;

	public String view() throws Exception
	{
		searchObj =  new SobjMedium(getUserName());
		searchObj.setSortation(Constants.SEARCH_SORTATION_FAVORITES);
		searchObj.setRowsMax("5000");
		searchObj.setCurrentPage("1");
		searchObj.setRowsPerPage("10");
		if(!Validator.empty(getTspm()))
		{
			if(getTspm().indexOf("_:_")>-1) heading = "\""+getTspm().substring( getTspm().indexOf("_:_")+3 )+"\"";
			if(getTspm().startsWith("sachgebiete"))
			{
				searchObj.setSachgebiete(getTspi());
				heading = "Sachgebiet "+heading;
			}
			if(getTspm().startsWith("adressaten"))
			{
				searchObj.setAdressaten(getTspi());
				heading = "Adressatenbereich  "+heading;
			}
		}
		if(!Validator.empty(page))
		{
		    searchObj = (SobjMedium) getSessionAttribute(getClass().getName()+"_searchObj");
		    searchObj.setCurrentPage(page);
		}
		searchObj = Client.search(searchObj);
		if(searchObj!=null && searchObj.getResults()!=null)
			for(int i=0; i< searchObj.getResults().length; i++)
				searchObj.getResults()[i].setPreviewImageUrl(  initDownload(searchObj.getResults()[i].getId(), "MEDI") );
		
		setSessionAttribute(getClass().getName()+"_searchObj",searchObj);
		return "success";
	}
	
	public String print() throws Exception
    {
		searchObj = (SobjMedium) getSessionAttribute(getClass().getName()+"_searchObj");

        try
        {
            searchObj.setUse_ResultSet("1");
            searchObj = Client.search(searchObj);
        }
        catch(StandardException permissionDenied){ searchObj=null; }
		if(searchObj!=null && searchObj.getResults()!=null)
		{
			List<BobjMedium> results = Arrays.asList(searchObj.getResults());
            XML xml = new XML();
            Element list, column, row, cell;
    
            list = xml.createElement("list");
            column = xml.createElement("column");
            column.setAttribute("width", "6cm");
            list.appendChild(column);
            column = xml.createElement("column");
            column.setAttribute("width", "4cm");
            list.appendChild(column);
            column = xml.createElement("column2");
            column.setAttribute("width", "6cm");
            list.appendChild(column);
            list.appendChild(xml.createElement("column"));
    
            row     = xml.createElement("row");
            row.appendChild(xml.createContentElement("list-headercell", "Medientitel"));
            row.appendChild(xml.createContentElement("list-headercell", "Untertitel"));
            row.appendChild(xml.createContentElement("list-headercell", "Mediumart"));
            row.appendChild(xml.createContentElement("list-headercell", "Produktionsjahr"));
    
    
            list.appendChild(row);
            if(results!=null)
            {
                Iterator<BobjMedium> it = results.iterator();
                while(it.hasNext())
                {   
                    BobjMedium medium = (BobjMedium)it.next();
                    row = xml.createElement("row");
                    row.appendChild(xml.createContentElement("list-cell", medium.getEinzeltitel()));
                    row.appendChild(xml.createContentElement("list-cell", medium.getEinzeluntertitel()));
                    row.appendChild(xml.createContentElement("list-cell", medium.getMediumArtDecode()));
                    row.appendChild(xml.createContentElement("list-cell", medium.getProduktionsjahr()));
                    list.appendChild(row);
                }
            }
            InetAddress inet = InetAddress.getLocalHost();
            xml.getRoot().appendChild(list);
            xml.getRoot().appendChild(xml.createContentElement("logo",  "http://"+inet.getHostAddress()+"/tis-online-portlet/images/ci/logo.jpg"));
            xml.getRoot().appendChild(xml.createContentElement("date",  (new SimpleDateFormat("dd.MM.yyyy")).format(new Date())));
            HttpServletResponse response = ServletActionContext.getResponse();
            response.reset();
            response.setContentType("application/pdf");
            response.getOutputStream().write(Renderer.transformToBytes(xml.render(), ServletActionContext.getServletContext().getRealPath("/resources/xsl/fo/medium_list.xsl"), Renderer.MODE_PDF));
            response.getOutputStream().close();
		}
        return null;
    }
	
	public SobjMedium getSearchObj()
	{
		return searchObj;
	}
	public void setSearchObj(SobjMedium searchObj)
	{
		this.searchObj = searchObj;
	}

	public String getPage() {
        return page;
    }

    public void setPage(String page) {
        this.page = page;
    }

    public String getHeading()
	{
		return heading;
	}

	public void setHeading(String heading)
	{
		this.heading = heading;
	}
}