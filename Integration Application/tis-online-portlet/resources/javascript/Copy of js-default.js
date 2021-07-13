var topdev = new Object();
	topdev.xml = new Object();

topdev.xml.xmlTarget="";
topdev.xml.xmlStream="";
topdev.xml.xmlDoc;									//XSL Document das die Formatierung der Liste beherbergt
topdev.xml.processor	= new XSLTProcessor();		//Parser
topdev.xml.xslDoc		= Sarissa.getDomDocument();	//XML Document das die Listeninformationen beherbergt
topdev.xml.lastIndex	= 0;						//zuletzt ausgew?hlte Zeile - nach einen Listenupdate zu markierende Zeile..
topdev.xml.xslLoaded	= false;
topdev.xml.currentXML;
topdev.xml.initCode;
topdev.xml.initDecode;
//_________________________________________________________________________________________________________
topdev.xml.throwEmpty = function()
{
	alert("Keine Daten vorhanden.");
}
//_________________________________________________________________________________________________________
topdev.xml.renderXML = function(t, xmlStream)	//initialisierung / laden / anzeigen des xmls..
{
		alert("xs+"+xmlStream);
 topdev.xml.currentXML	= xmlStream;
 topdev.xml.processor		= new XSLTProcessor();
 topdev.xml.xslDoc		= Sarissa.getDomDocument();
 topdev.xml.lastIndex		= 0;
 
	topdev.xml.xmlTarget = t;
	if(topdev.xml.xmlStream=='null')
	{
		topdev.xml.throwEmpty()
		return false;
	}
	
	//xmlStream beherbergt das von der ActionKlasse zur?ckgegebene XML
	try
	{
		topdev.xml.xmlDoc = topdev.xml.getDocFromXML(xmlStream);
	}
	catch(e)
	{
		alert("Fehler 1 beim parsen von XML");
	}

	try
	{
		topdev.xml.xslDoc = topdev.xml.loadXML(homeURL+"/select-style.xml");
	}
	catch(e)
	{
		alert("Fehler beim laden von XSL");
	}
//		xslLoaded = true;


	try
	{
		alert("ss+"+topdev.xml.xmlDoc);
		topdev.xml.processor.importStylesheet(topdev.xml.xslDoc);
		
		var lr = topdev.xml.xmlDoc.selectSingleNode("/sublist/lr[1]");
		if(!lr)
		{
			topdev.xml.throwEmpty();
			return false;
		}
	
	}
	catch(e)
	{
		alert("Fehler 2 beim parsen von XML"+e);
		throw e;
	}
	


	try
	{
		//parsing und initialisierung festlegen
		if(!document.all)
		{
			topdev.xml.xslDoc.onload = function()
			{
				topdev.xml.parse();
			}
			topdev.xml.xmlDoc.onload = topdev.xml.xslDoc.onload;
			if(topdev.xml.xslLoaded) topdev.xml.xslDoc.onload();
		} else topdev.xml.parse();
	}
	catch(e)
	{
		alert("Fehler 3 beim parsen von XML");
		throw e;
	}
	
}
//________________________________________________________________________________________
topdev.xml.loadXML = function(url)	//xml-DOM-Object erzeugen mit url der xml-Datei als Grundlage
{
	if (window.ActiveXObject)
	{
		topdev.xml.xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		topdev.xml.xmlDoc.async=false;
	}
	else if(document.implementation && document.implementation.createDocument)
	topdev.xml.xmlDoc= document.implementation.createDocument("","doc",null);
	if (typeof topdev.xml.xmlDoc!="undefined")
	topdev.xml.xmlDoc.load(url);
	return topdev.xml.xmlDoc;
}
var xmlTarget;
//_________________________________________________________________________________________________________
topdev.xml.parse = function()	//XSL und XML zu HTML parsen und anschliessend vorgeladene Bilder einf?gen
{
	try
	{
		var newDocument = topdev.xml.processor.transformToDocument(topdev.xml.xmlDoc);
		topdev.xml.xmlTarget.innerHTML=Sarissa.serialize(newDocument);
		//alert(xmlTarget.innerHTML);
	}
	catch(e)
	{
		alert("parse() - error");
	}
}
//_________________________________________________________________________________________________________
topdev.xml.getDocFromXML = function(pXml)	//DOM-Object aus gegebenen XML-String generieren
{
	try
	{
		var doc;
		if(document.all)
		{
			doc = new ActiveXObject("Microsoft.XMLDOM");
			doc.async="false";
			doc.setProperty("SelectionLanguage",	"XPath");
			doc.setProperty("SelectionNamespaces",	"xmlns:xsl='http://www.w3.org/1999/XSL/Transform'");
			doc.loadXML(pXml);
		} else doc = (new DOMParser()).parseFromString(pXml, "text/xml");
		return doc;
	}
	catch(e)
	{
		alert("getDocFromXML() - error");
	}
}
topdev.xml.toggleDiv = function(s, typ)
{
	var e = document.getElementById(s+'_view');
	if(e.style.display=='none')
	{
		e.style.display='inline';
		if(typ=="sublist") topdev.xml.renderSublist(s);
	}
	else
		e.style.display='none';
}

var i = 1;
var xmlx = "";
topdev.xml.renderSublist = function(s)
{
	var e = document.getElementById(s+'_view');
	topdev.xml.renderXML(e, xml);
}

topdev.xml.newLine = function()
{
	xml=xml2;
	topdev.xml.renderSublist("div2");
}