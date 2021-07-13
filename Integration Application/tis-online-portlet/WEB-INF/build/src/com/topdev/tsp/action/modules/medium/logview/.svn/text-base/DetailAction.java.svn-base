package com.topdev.tsp.action.modules.medium.logview;

import java.net.InetAddress;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.w3c.dom.Element;

import com.topdev.aa.lib.Message;
import com.topdev.aa.lib.Validator;
import com.topdev.aa.lib.xml.Renderer;
import com.topdev.aa.lib.xml.XML;
import com.topdev.aa.model.action.Ajax;
import com.topdev.aa.model.action.AjaxImpl;
import com.topdev.service.eafimport.data.BobjLog;
import com.topdev.service.eafimport.data.SobjLog;
import com.topdev.service.eafimport.Client;



public class DetailAction extends AjaxImpl implements Ajax
{
	private static final long	serialVersionUID	= 1L;

	String dateVon;
	String dateBis;
	String logLevelCode;
	
	List<String> errorOutput;

	SobjLog logObj;
	
	public String search() throws Exception
	{
	    logObj = new SobjLog(  getUserName());
		logObj.setDateVon(    dateVon);
		logObj.setDateBis(    dateBis);
		logObj.setLevel(      logLevelCode);
		
		logObj.clearErrors();
	    logObj = Client.search(logObj);
	    storeSessionObject(logObj);
	    
	    return "success";
	}
	
	
	public String form() throws Exception
	{
		logObj = (SobjLog) getSessionObject(SobjLog.class);
		if(logObj==null)
        {
            logObj = new SobjLog( getUserName());
            logObj.clearErrors();
        }
        errorOutput= new ArrayList<String>();
        if (logObj.getErrors()!=null && logObj.getErrors()[0]!=null && logObj.getErrors()[1]!=null && logObj.getErrors()[2]!=null && logObj.getErrors()[3]!=null){
            if(!logObj.getErrors()[0].equals("")){
    		    String loggedMsg = "Fehler: "+logObj.getErrors()[0]+" bei Produktionsjahr Von";
    		    loggedMsg=loggedMsg.replaceAll("&#xF6;","ö");
                loggedMsg=loggedMsg.replaceAll("&#xFC;","ß");
    		    errorOutput.add(loggedMsg);		    
    		}
    		if(!logObj.getErrors()[1].equals("")){
    		    String loggedMsg = "Fehler: "+logObj.getErrors()[1]+" bei Produktionsjahr Bis";
    		    loggedMsg=loggedMsg.replaceAll("&#xF6;","ö");
                loggedMsg=loggedMsg.replaceAll("&#xFC;","ß");
    		    errorOutput.add(loggedMsg);            
            }
    		if(!logObj.getErrors()[2].equals("")){
                String loggedMsg = "Fehler: "+logObj.getErrors()[2]+" bei Produktionsjahr Von";
                loggedMsg=loggedMsg.replaceAll("&#xF6;","ö");
                loggedMsg=loggedMsg.replaceAll("&#xFC;","ß");
                errorOutput.add(loggedMsg);
                String loggedMsg2 = "Fehler: "+logObj.getErrors()[3]+" bei Produktionsjahr Bis";
                loggedMsg2=loggedMsg2.replaceAll("&#xF6;","ö");
                loggedMsg2=loggedMsg2.replaceAll("&#xFC;","ß");
                errorOutput.add(loggedMsg2); 
            }
		}
        logObj.clearErrors();
		return "success";
	}
	
	public String print() throws Exception
    {
        logObj = (SobjLog) getSessionObject(SobjLog.class);
        List<BobjLog> results = null;
        if(logObj==null)
        {
            logObj = new SobjLog( getUserName());
        }
        logObj = Client.search(logObj);
        if (logObj.getResults()!= null){
            results = Arrays.asList(logObj.getResults());
        }
        XML xml = new XML();
        Element list, column, row, cell;

        list = xml.createElement("list");
        column = xml.createElement("column");
        column.setAttribute("width", "3cm");
        list.appendChild(column);
        column = xml.createElement("column");
        column.setAttribute("width", "10cm");
        list.appendChild(column);
        column = xml.createElement("column2");
        column.setAttribute("width", "3cm");
        list.appendChild(column);

        row     = xml.createElement("row");
        row.appendChild(xml.createContentElement("list-headercell", "Fehlerklasse"));
        row.appendChild(xml.createContentElement("list-headercell", "Fehlermeldung"));
        row.appendChild(xml.createContentElement("list-headercell", "Zeitpunkt"));


        list.appendChild(row);

        if(results!=null)
        {
            Iterator<BobjLog> it = results.iterator();
            while(it.hasNext())
            {   
                BobjLog log = (BobjLog)it.next();
                row = xml.createElement("row");
                row.appendChild(xml.createContentElement("list-cell", log.getLogLevel()));
                row.appendChild(xml.createContentElement("list-cell", log.getUserMessage()));
                row.appendChild(xml.createContentElement("list-cell", log.getCreationDate()));
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
        response.getOutputStream().write(Renderer.transformToBytes(xml.render(), ServletActionContext.getServletContext().getRealPath("/resources/xsl/fo/import_error_list.xsl"), Renderer.MODE_PDF));
        response.getOutputStream().close();
        return null;
    }
	
	 public static String CorrectDate(String dateString)
	    {
	        if(dateString==null || dateString.trim().length() < 1) return "";
	        try
	        {
	            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
	            Date date = df.parse(dateString);
	            return new SimpleDateFormat("dd.MM.yyyy HH:mm").format(date);
	        } catch(Exception ex) {return "";}
	    }
	
    public static boolean isCorrectDateFormatOrEmty(String dateString)
    {
        if(dateString==null || dateString.trim().length() < 1) return true;
        try
        {
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
            Date date = df.parse(dateString);
            
            if((new SimpleDateFormat("dd.MM.yyyy HH:mm")).format(date).equals(dateString)) return true;
        } catch(Exception ex) {}
        return false;
    }
	
	public static boolean isCorrectTimeLine(String dateString1, String dateString2)
    {
        if(dateString1==null || dateString1.trim().length() < 1) return true;
        try
        {
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT, Locale.GERMANY);
            Date date1 = df.parse(dateString1);
            Date date2 = df.parse(dateString2);
            
            if(date2.after(date1)){return true;};
        } catch(Exception ex) {}
        return false;
    }
	
	public List<String> getErrorOutput() {
        return errorOutput;
    }

    public void setErrorOutput(List<String> errorOutput) {
        this.errorOutput = errorOutput;
    }
	
    public String getDateVon() {
        return dateVon;
    }


    public void setDateVon(String dateVon) {
        this.dateVon = dateVon;
    }


    public String getDateBis() {
        return dateBis;
    }


    public void setDateBis(String dateBis) {
        this.dateBis = dateBis;
    }

    public SobjLog getLogObj() {
        return logObj;
    }


    public void setLogObj(SobjLog logObj) {
        this.logObj = logObj;
    }


    public String getLogLevelCode() {
        return logLevelCode;
    }


    public void setLogLevelCode(String logLevelCode) {
        this.logLevelCode = logLevelCode;
    }
}