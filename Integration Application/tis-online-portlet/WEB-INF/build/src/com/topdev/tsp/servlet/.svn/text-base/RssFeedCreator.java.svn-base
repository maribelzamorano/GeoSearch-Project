package com.topdev.tsp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.aa.lib.xml.RSS;
import com.topdev.service.alfresco.data.RobjAlfrescoRss;
import com.topdev.service.alfresco.data.SobjAlfrescoRss;
import com.topdev.service.medium.data.BobjMedium;
import com.topdev.service.medium.data.SobjMedium;
import com.topdev.service.schuleschulportrait.data.RobjSchulportraitRss;
import com.topdev.service.schuleschulportrait.data.SobjSchulportraitRss;

public class RssFeedCreator extends HttpServlet
{
	private static final long	serialVersionUID	= 1L;
    private Log log = LogFactory.getLog(this.getClass().getName());
    private SimpleDateFormat PtsTimestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
    private HttpServletRequest Req = null;
    
	@Override
	public void init(ServletConfig sc) throws ServletException
	{
		super.init(sc);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		Req = request;
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		boolean result = CreateMedienFeed() & CreateSchulportraitFeed() & CreateSchulportalFeed();
		
		out.println(result);
	}
	
	private boolean CreateSchulportalFeed() {
		SobjAlfrescoRss sobj = new SobjAlfrescoRss();
		sobj.setUser("");
		
		try {
			sobj = com.topdev.service.alfresco.Client.searchRss(sobj);
		} catch (Exception ex) {
			log.error("Fehler beim Abruf der Schulportral(Alfresco)-Informationen: " + ex.toString());
			return false;
		}
		
		
		String portalFeedPath = getServletContext().getRealPath(getServletContext().getInitParameter("schulportalFeedPath"));
		
		try {
			RSS rss = new RSS(portalFeedPath, true, true);
			
			rss.setTitle("Thüringer Schulportal");
			rss.setTitleLink(GetHomeURL(Req.getRequestURL().toString()));
			rss.setDescription("");
			rss.setPubDate(new Date());
			rss.setImageURL(GetHomeURL(Req.getRequestURL().toString()) + Req.getContextPath() + "/images/ci/logo.jpg");
			if (sobj!=null && sobj.getResults()!=null){
				for (RobjAlfrescoRss robj : sobj.getResults()) {
					log.debug("PTS: "+robj.getPts());
					log.debug("TITEL: "+robj.getTitel());
					log.debug("TEXT: "+robj.getText());
					log.debug("LINK: "+robj.getLink());
					String aenderungsDatum = SimpleDateFormat.getDateInstance(SimpleDateFormat.MEDIUM).format(PtsTimestamp.parse(robj.getPts()));
					RSS.Item item = rss.new Item();
					item.setTitle(aenderungsDatum + ": " + robj.getTitel());
					if (robj.getText()!=null)item.setDescription(robj.getText().length() <= 100 ? robj.getText() :  robj.getText().substring(0, 96) + "...");
					else item.setDescription("");
					item.setLink(robj.getLink());
					item.setPubDate(PtsTimestamp.parse(robj.getPts()));
					rss.addItem(item);
				}
			}
			rss.saveFile();
			log.debug("Schulportal-Feed fertig!");
			
		} catch (Exception e) {
			log.error("Fehler beim Zusammenstellen oder Schreiben des RSS/XML-Contents für die Datei '" + portalFeedPath + "': " + e.toString());
			e.printStackTrace();
			return false;
		}
		
		return true;
	}
	
	private boolean CreateSchulportraitFeed() {
		SobjSchulportraitRss sobj = new SobjSchulportraitRss();
		sobj.setUser("");
		sobj.setRowsPerPage("10");
		sobj.setSessionId(Req.getSession().getId());
		
		try {
			sobj = com.topdev.service.schuleschulportrait.Client.searchRss(sobj);
		} catch (Exception ex) {
			log.error("Fehler beim Abruf der Schulportrait-Informationen: " + ex.toString());
			return false;
		}
		
		String portraitFeedPath = getServletContext().getRealPath(getServletContext().getInitParameter("schulportraitFeedPath"));
		
		try {
			RSS rss = new RSS(portraitFeedPath, true, true);
			
			rss.setTitle("Schulporträt TSP");
			rss.setTitleLink(GetHomeURL(Req.getRequestURL().toString()) + "/web/guest/schools");
			rss.setDescription("");
			rss.setPubDate(new Date());
			rss.setImageURL(GetHomeURL(Req.getRequestURL().toString()) + Req.getContextPath() + "/images/ci/logo.jpg");
			
			if (sobj!=null && sobj.getResults()!=null){
				for (RobjSchulportraitRss robj : sobj.getResults()) {
					String aenderungsDatum = robj.getPts().split(" ")[0];
					
					RSS.Item item = rss.new Item();
					item.setTitle(aenderungsDatum + ": " + robj.getSchulname());
					item.setDescription("Änderung im Bereich: \"" + robj.getNavigationspukt() + "\"");
					item.setLink(rss.getTitleLink() + robj.getLink());
					item.setPubDate(new SimpleDateFormat("dd.MM.yyyy HH:mm:ss").parse(new String(robj.getPts().trim())));
					rss.addItem(item);
				}
			}
			rss.saveFile();
			log.debug("Schulportrait-Feed fertig!");
			
		} catch (Exception e) {
			log.error("Fehler beim Zusammenstellen oder Schreiben des RSS/XML-Contents für die Datei '" + portraitFeedPath + "': " + e.toString());
			return false;
		}
		
		return true;
	}
	
	private boolean CreateMedienFeed()
	{
		SobjMedium sobj = new SobjMedium();
		sobj.setUser("");
		sobj.setSortation(SobjMedium.SEARCH_SORTATION_LATEST);
		sobj.setRowsPerPage("10");
		
		try {
			sobj = com.topdev.service.medium.Client.search(sobj);
		} catch (Exception ex) {
			log.error("Fehler beim Abruf der Medieninformationen: " + ex.toString());
			return false;
		}
		
		String medienFeedPath = getServletContext().getRealPath(getServletContext().getInitParameter("medienFeedPath"));
		
		try {
			RSS rss = new RSS(medienFeedPath, true, true);
			
			rss.setTitle("Mediothek TSP");
			rss.setTitleLink(GetHomeURL(Req.getRequestURL().toString()) + "/web/guest/media");
			rss.setDescription("");
			rss.setPubDate(new Date());
			rss.setImageURL(GetHomeURL(Req.getRequestURL().toString()) + Req.getContextPath() + "/images/ci/logo.jpg");
			
			log.debug("Starte mit dem Auflisten der Medien für Datei '" + medienFeedPath + "'");
			if (sobj!=null && sobj.getResults()!=null){
				for (BobjMedium medi : sobj.getResults()){
					BobjMedium medium = com.topdev.service.medium.Client.getById("", medi.getId());	//Medium wird für RSS erneut mit allen Infos abgerufen
					
					log.debug("Medium '" + medium.getEinzeltitel() + "' wird geschrieben");
					
					String subtitle = ""; 		//Wenn vorhanden, Untertitel aufbereiten
					if (medium.getEinzeluntertitel() != null && medium.getEinzeluntertitel().length() > 0)
						subtitle = " / " + medium.getEinzeluntertitel();
					
					String kurzinhalt = "";		//Wenn vorhanden, Kurzinhalt aufbereiten
					if (medium.getKurzinhalt() != null)
						kurzinhalt = (medium.getKurzinhalt().length() <= 100 ? medium.getKurzinhalt() :  medium.getKurzinhalt().substring(0, 96) + "...");
					
					String prodJahr = "";			//Wenn vorhanden, Produktionsjahr aufbereiten;
					if (medium.getProduktionsjahr() != null)
						prodJahr = " / " + medium.getProduktionsjahr();
					
					String erstellDatum = SimpleDateFormat.getDateInstance(SimpleDateFormat.MEDIUM).format(PtsTimestamp.parse(medium.getPts())) + ": ";
					
					RSS.Item item = rss.new Item();
					item.setTitle(erstellDatum + medium.getEinzeltitel() + subtitle + prodJahr);
					item.setDescription(kurzinhalt);
					item.setLink(GetHomeURL(Req.getRequestURL().toString()) + "/web/guest/media/detail?tspi=" + medium.getId());
					item.setPubDate(PtsTimestamp.parse(medium.getPts()));
					rss.addItem(item);
				}
			}
			rss.saveFile();
			log.debug("Medien-RSS-Feed fertig!");
			
		} catch (Exception e) {
			log.error("Fehler beim Zusammenstellen oder Schreiben des RSS/XML-Contents für die Datei '" + medienFeedPath + "': " + e.toString());
			return false;
		}
		
		return true;
	}
	
	private String GetHomeURL(String url) {
		String protocol = url.split("//")[0];
		String domain = url.substring(protocol.length(), url.indexOf("/", protocol.length()+2));
		
		return protocol + domain;
	}
}