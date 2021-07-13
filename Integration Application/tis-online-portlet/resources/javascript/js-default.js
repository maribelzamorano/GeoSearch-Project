var xmlTarget="";
var xmlStream="";
var xmlDoc;									//XSL Document das die Formatierung der Liste beherbergt
var processor	= new XSLTProcessor();		//Parser
var xslDoc		= Sarissa.getDomDocument();	//XML Document das die Listeninformationen beherbergt
var lastIndex	= 0;						//zuletzt ausgew?hlte Zeile - nach einen Listenupdate zu markierende Zeile..
var xslLoaded	= false;
var currentXML;
var initCode;
var initDecode;
//_________________________________________________________________________________________________________
function throwEmpty()
{
	alert("Keine Daten vorhanden.");
}
//_________________________________________________________________________________________________________
function renderXML(t, xmlStream)	//initialisierung / laden / anzeigen des xmls..
{
	currentXML	= xmlStream;
	processor	= new XSLTProcessor();
	xslDoc		= Sarissa.getDomDocument();
	lastIndex	= 0;
 	xmlTarget	= t;

	if(xmlStream=='null')
	{
		throwEmpty()
		return false;
	}
	
	//xmlStream beherbergt das von der ActionKlasse zur?ckgegebene XML
	try
	{
		xmlDoc = getDocFromXML(xmlStream);
	}
	catch(e)
	{
		alert("Fehler 1 beim parsen von XML");
	}

	try
	{
		xslDoc = loadXML(homeURL+"/select-style.xml");
	}
	catch(e)
	{
		alert("Fehler beim laden von XSL");
	}
//		xslLoaded = true;

	try
	{
		processor.importStylesheet(xslDoc);
		
		var lr = xmlDoc.selectSingleNode("/sublist/lr[1]");
		if(!lr)
		{
			throwEmpty();
			return false;
		}
	}
	catch(e)
	{
		alert("Fehler 2 beim parsen von XML");
	}
	
	try
	{
		//parsing und initialisierung festlegen
		if(!document.all)
		{
			xslDoc.onload = function()
			{
				var newDocument = processor.transformToDocument(xmlDoc);
				xmlTarget.innerHTML=Sarissa.serialize(newDocument);
			}
			xmlDoc.onload = xslDoc.onload;
			if(xslLoaded) xslDoc.onload();
		} else
		{
			var newDocument = processor.transformToDocument(xmlDoc);
			xmlTarget.innerHTML=Sarissa.serialize(newDocument);
		}
	}
	catch(e)
	{
		alert("Fehler 3 beim parsen von XML");
	}
}
//________________________________________________________________________________________
function loadXML(url)	//xml-DOM-Object erzeugen mit url der xml-Datei als Grundlage
{
	var xmlDoc;
	if (window.ActiveXObject)
	{
		xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
		xmlDoc.async=false;
	}
	else if(document.implementation && document.implementation.createDocument)
	xmlDoc= document.implementation.createDocument("","doc",null);
	if (typeof xmlDoc!="undefined")
	xmlDoc.load(url);
	return xmlDoc;
}
var xmlTarget;

//_________________________________________________________________________________________________________
function getDocFromXML(xml)	//DOM-Object aus gegebenen XML-String generieren
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
			doc.loadXML(xml);
		} else doc = (new DOMParser()).parseFromString(xml, "text/xml");
		return doc;
	} 
	catch(e)
	{
		alert("getDocFromXML() - error");
	}
}
function toggleDiv(s, typ)
{

	var e = document.getElementById(s+'_view');
	if(e.style.display=='none')
	{
		e.style.display='inline';
		if(typ=="sublist") renderSublist(s);
	}
	else
		e.style.display='none';
}

function openList(s, id)
{
//	alert("openList"+id);
	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_view"+i);
		if(!e) break;
		e.style.display="none";
	}

	e = document.getElementById(id);
	e.style.display='inline';

	if(s=="div245") renderXML(e, div245_view_xml);
	if(s=="div2") renderXML(e, div2_view_xml);
	if(s=="div3") renderXML(e, div3_view_xml);
//	renderXML(e, xml);
}
function openForm(s, id)
{
//	alert("openForm"+id);
	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_view"+i);
		if(!e) break;
		e.style.display="none";
	}
	var e = document.getElementById(id);
	e.style.display='inline';
//	alert(document.getElementById(id).style.display);
}

function toggleTabOn(s,tabNr)
{
	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_tab"+i);
		if(!e) break;
		e.className="tab_inactive";
	}
	document.getElementById(s+"_tab"+tabNr).className="tab_active";
	document.getElementById(s+"_view"+tabNr).ondblclick();
}

function toggleDivOn(s,tabNr)
{

	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_nav"+i);
		if(!e) break;
		e.className="nav_inactive";
	}
	document.getElementById(s+"_nav_div"+tabNr).style.display="inline";
	document.getElementById(s+"_nav"+tabNr).className="nav_active";
	document.getElementById(s+"_view"+tabNr).ondblclick();
}

function removeNavDiv(s,nr)
{
	//	alert("removeNavDiv"+nr);
	document.getElementById(s+"_nav_div"+nr).style.display="none";
}

function toggleTabOff(s)
{
	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_tab"+i);
		if(!e) break;
		e.className="tab_inactive";
	}
	for(i=1;i<10;i++)
	{
		var e = document.getElementById(s+"_view"+i);
		if(!e) break;
		e.style.display="none";
	}
}


var i = 1;
var xmlx = "";
function renderSublist(s)
{
	var e = document.getElementById(s+'_view');
	//renderXML(e, xml);
	if(s=="div2") renderXML(e, div2_view_xml);
	if(s=="div3") renderXML(e, div3_view_xml);
	
}

function newLine()
{
	xml=getMore();
	var e = document.getElementById('div2_view1');
	renderXML(e, xml);
}

var topdev			= new Object();
	topdev.sublist	= new Object();

topdev.sublist.sublistAction = function(flag,id,foldbox,divNr,nr)
{
	
	if(foldbox=="div245" && flag=="KZ_EDIT")
	{
		if(nr=="1") toggleDivOn(foldbox,divNr);
		else
		location.href=detailUrl;
	}
	if(foldbox=="div2" && flag=="KZ_EDIT")
	{
		if(nr=="1") toggleDivOn(foldbox,divNr);
		else
		location.href=detailUrl;
	}
	else if(foldbox=="div3")
	{
		var tDoc = getDocFromXML(div3_view_xml);
		if(flag=="KZ_EDIT")
		{
			for(n=1; n<50;n++)
			{
				if(nr != n)
				{
					if(!tDoc.selectSingleNode("/sublist/lr["+n+"]")) break;
					for(i=1; i<50;i++)
					{
						var tField = document.getElementById(foldbox+"_"+divNr+"_"+n+"_"+i);
						if(!tField) i=52;
						else tDoc.selectSingleNode("/sublist/lr["+n+"]/lc["+i+"]").setAttribute("newValue", tField.value);//tField.value);
					}
				}
			}

			var lr = tDoc.selectSingleNode("/sublist/lr["+nr+"]");
			lr.setAttribute("m","e");
			for(i=1; i<50;i++)
			{
				if(!tDoc.selectSingleNode("/sublist/lr["+nr+"]/lc["+i+"]")) break;
				tDoc.selectSingleNode("/sublist/lr["+nr+"]/lc["+i+"]").setAttribute("newValue", tDoc.selectSingleNode("/sublist/lr["+nr+"]/lc["+i+"]").firstChild.nodeValue);//tField.value);
			}
		}
		if(flag=="KZ_DELETE")
		{
			for(n=1; n<50;n++)
			{
				if(nr != n)
				{
					if(!tDoc.selectSingleNode("/sublist/lr["+n+"]")) break;
					for(i=1; i<50;i++)
					{
						var tField = document.getElementById(foldbox+"_"+divNr+"_"+n+"_"+i);
						if(!tField) i=52;
						else tDoc.selectSingleNode("/sublist/lr["+n+"]/lc["+i+"]").setAttribute("newValue", tField.value);//tField.value);
					}
				}
			}

			var lr = tDoc.selectSingleNode("/sublist/lr["+nr+"]");
			lr.setAttribute("m","");
			lr.setAttribute("deleted","1");
		}
		else if(flag=="KZ_SAVE")
		{
			var lr = tDoc.selectSingleNode("/sublist/lr[@id='"+id+"']");
			lr.setAttribute("m","");
			for(i=1; i<10;i++)
			{
				var tField = document.getElementById(foldbox+"_"+divNr+"_"+nr+"_"+i);
				if(!tField) break;
				var lc = tDoc.selectSingleNode("/sublist/lr[@id='"+id+"']/lc["+i+"]").firstChild.nodeValue = tField.value;
			}
		}
		else if(flag=="KZ_ABORT")
		{

			for(n=1; n<50;n++)
			{
				if(nr != n)
				{
					if(!tDoc.selectSingleNode("/sublist/lr["+n+"]")) break;
					for(i=1; i<50;i++)
					{
						var tField = document.getElementById(foldbox+"_"+divNr+"_"+n+"_"+i);
						if(!tField) i=52;
						else tDoc.selectSingleNode("/sublist/lr["+n+"]/lc["+i+"]").setAttribute("newValue", tField.value);//tField.value);
					}
				}
			}
			
			var lr = tDoc.selectSingleNode("/sublist/lr["+(nr)+"]");
			tid = lr.getAttribute("id");
			if(tid=="0")	tDoc.selectSingleNode("/sublist").removeChild(lr);
			else
			{
				lr.setAttribute("m","");
				lr.setAttribute("deleted","");
				for(i=1; i<50;i++)
				{
					lc = tDoc.selectSingleNode("/sublist/lr["+(nr)+"]/lc["+i+"]");
					if(lc) lc.setAttribute("newValue", "");
					else break;
				}
			}
		}
		else if(flag=="kz_insert")
		{
			for(n=1; n<50;n++)
			{
				if(nr != n)
				{
					if(!tDoc.selectSingleNode("/sublist/lr["+n+"]")) break;
					for(i=1; i<50;i++)
					{
						var tField = document.getElementById(foldbox+"_"+divNr+"_"+n+"_"+i);
						if(!tField) i=52;
						else tDoc.selectSingleNode("/sublist/lr["+n+"]/lc["+i+"]").setAttribute("newValue", tField.value);//tField.value);
					}
				}
			}
			var lr = tDoc.createElement("lr");
			lr.setAttribute("m","e");
			lr.setAttribute("id","0");
			
			var lc = tDoc.createElement("lc");
			lc.setAttribute("t","c");
			lc.appendChild(tDoc.createTextNode("0"));
			lr.appendChild(lc);
			
			lc = tDoc.createElement("lc");
			lc.appendChild(tDoc.createTextNode(""));
			lr.appendChild(lc);
			var sublist = tDoc.selectSingleNode("/sublist").appendChild(lr);
		}

		div3_view_xml = Sarissa.serialize(tDoc);
		renderXML(document.getElementById('div3_view1'), div3_view_xml)
	}
}
var submodules = new Object;
var	submodulesInitIterator = 0;
submodules.list = new Array();
window.onload = function()
{
	try{ document.getElementById("div245_view1").ondblclick(); }catch(e){}
	if(submodules.list && submodules.list[0])
		submodules.list[0].init();
	
}
