package com.topdev.aa.lib.xml;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class RSS {
	private Log log = LogFactory.getLog(this.getClass());
    private SimpleDateFormat rssTimestamp = new SimpleDateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", new Locale("en"));
	private File xmlFile;
	
	private boolean staticGuid;
	private String title;		//Der Titel des RSS-Feeds [obligatorisch]
	private String titleLink;	//Der Link, der auf dem Titel des Feeds hinterlegt ist [obligatorisch]
	private Date pubDate;		//Das Veröffentlichungsdatum des Feeds (i.d.R. das Erstellungsdatum) [obligatorisch]
	private String description;	//Eine Beschreibung des Feed-Inhaltes [obligatorisch]
	private String imageURL;	//Eine URL zu einem Logo/Titelbild, das im Feed angezeigt werden soll [optional]
	
	private List<Item> items = new ArrayList<Item>(10);
	
	public RSS(String filename, boolean overwriteOldFile, boolean staticGuid) throws Exception
	{
		this.staticGuid = staticGuid;
		xmlFile = new File(filename);
		
		if (!overwriteOldFile && xmlFile.exists())
			throw new Exception("Datei für RSS-Feed '" + filename + "' existiert bereits, Abbruch!");
		else if (xmlFile.exists() && !xmlFile.canWrite())
			throw new Exception("Schreibzugriff auf Datei für RSS-Feed '" + filename + "' verweigert!");
	}
	
	public void saveFile() throws Exception
	{
		if (xmlFile.exists())
			xmlFile.delete();
		
		log.debug("Schreibe RSS-Feed in '" + xmlFile.getAbsolutePath());
		
		FileOutputStream fs = null;
		XMLStreamWriter writer = null;
		
		try
		{
			fs = new FileOutputStream(xmlFile);
			writer = XMLOutputFactory.newInstance().createXMLStreamWriter(fs);
			
			writer.writeStartDocument();
			writer.writeStartElement("rss");
			writer.writeAttribute("version", "2.0");
			
			  writer.writeStartElement("channel");
			  writeRssElement(writer, "title", title);
			  writeRssElement(writer, "link", titleLink);
			  writeRssElement(writer, "description", description);
			  writeRssElement(writer, "pubDate", formatDateTime(new Date(pubDate.getTime() + 1000 * 60 * 60 * 2)));
			    
			    if (imageURL != null) {
				  writer.writeStartElement("image");
				  writeRssElement(writer, "url", imageURL);
				  writeRssElement(writer, "title", title);
				  writeRssElement(writer, "link", titleLink);
				  writer.writeEndElement();
			    }
			    
			    int i = 0;
			    for (Item item : items) {
			      i++;
				  writer.writeStartElement("item");
				    writeRssElement(writer, "title", item.title);
				    writeRssElement(writer, "description", item.description);
				    writeRssElement(writer, "link", item.link);
				    writeRssElement(writer, "pubDate", formatDateTime(item.pubDate));
				    if (staticGuid) {
				      writeRssElement(writer, "guid", String.valueOf(i));
				    } else if (item.guid != null) {
				      writeRssElement(writer, "guid", item.guid);
				    }
				  writer.writeEndElement();
			    }
			    
			  writer.writeEndElement();
			writer.writeEndElement();
			writer.writeEndDocument();
			
			writer.close();
			fs.close();
		}
		catch (Exception ex) {
			if (writer != null)
				writer.close();
			
			if (fs != null)
				fs.close();
			
			throw ex;
		}
	}
	
	public void addItem(Item item)
	{
		items.add(item);
	}
	
	private void writeRssElement(XMLStreamWriter writer, String elementName, String elementContent) throws XMLStreamException {
		writer.writeStartElement(elementName);
		  writer.writeCharacters(elementContent);
		writer.writeEndElement();
	}
	
	private String formatDateTime(Date date) {
		return rssTimestamp.format(new Date(date.getTime() - 1000 * 60 * 60 * 2));
	}
	
	public class Item
	{
		private String title;
		private String link;
		private String description;
		private Date pubDate;
		private String guid;
		
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public String getDescription() {
			return description;
		}
		public void setDescription(String description) {
			this.description = description;
		}
		public Date getPubDate() {
			return pubDate;
		}
		public void setPubDate(Date pubDate) {
			this.pubDate = pubDate;
		}
		public String getGuid() {
			return guid;
		}
		public void setGuid(String guid) {
			this.guid = guid;
		}
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitleLink() {
		return titleLink;
	}
	public void setTitleLink(String titleLink) {
		this.titleLink = titleLink;
	}
	public Date getPubDate() {
		return pubDate;
	}
	public void setPubDate(Date pubDate) {
		this.pubDate = pubDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
}
