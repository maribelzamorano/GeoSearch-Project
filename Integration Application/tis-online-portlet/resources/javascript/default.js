var browser_ie_mac = navigator.userAgent.search(/mac/i)!=-1 && navigator.userAgent.search(/msie/i)!=-1;
var browser_ie_win = navigator.userAgent.search(/win/i)!=-1 && navigator.userAgent.search(/msie/i)!=-1;
var ms = (!document.all && document.getElementById);
var ie = (document.all);
var obligation				=false;
var formModified			=false;
var formStorable			=false;
var formObligation			=false; //noch pflichtfelder unausgef?llt?
var obligation_buttonId		="";
var obligation_fields		=new Array();	//strings mit den namen der input-daten-felder
var obligation_values		=new Array();	//strings mit den letzten werten der input-daten-felder
var obligation_innerHtml	="<b>x</b>";
var saveButton;
var formDialog				=false; //In Dialog geöffnet?
var fensterdialog			=false;	//deprecated


//dialoge
var msgURL="dialog.do";
function msg(text,title,button,focus,symbol)
{
		var option = "dialogWidth: 300px;"
			+"dialogHeight: 100px;"
			+"center: yes; help: no; "
			+"resizable: no; scroll: no; status: no;";
		var url=msgURL+"?text="+text+"&title="+title+"&button="+button+"&focus="+focus+"&symbol="+symbol;
		return window.showModalDialog(url, title, option);
}

//zum schliessen mit escape
function key() {
	if (event.keyCode == 27) {
		parent.window.close();
	}
}

function disable(myObject) {
	myObject.checked=!myObject.checked;
}

function deunicode(s) {
	s = s.replace(/\&quot;/g,"\"");
	s = s.replace(/\&#39;/g,"'");
	s = s.replace(/\&amp;/g,"&");
	s = s.replace(/\&lt;/g,"<");
	s = s.replace(/\&gt;/g,">");
	
	return s;
}

function unicode(s) {
	s = s.replace(/\&/g,"&amp;");
	s = s.replace(/</g,"&lt;");
	s = s.replace(/>/g,"&gt;");
	
	return s;
}

function unicodeQuotes(s) {
	return s.replace(/\"/g,"&quot;").replace(/\'/g,"&#39");
}

function dblUnicodeQuotes(s) {
	return s.replace(/\"/g,"&quot;").replace(/\'/g,"&#39").replace(/\&/g,"&amp;");
}



function docClick(event)
{
	if(!formDialog)
	{
		top.frames.layer0.mainFrameClick(event);
	}
	else
		top.frames.layer0.clearToDialog(window);
}
document.onmousedown = docClick;

// ************************** ?berpr?ft die Speicherbarkeit des Formulars
function obligation_isStorable()
{
	if(document.getElementById(obligation_buttonId))
		return document.getElementById(obligation_buttonId).disabled!=false;
	return false;
}

// ************************** Setzt Pflichtfeldkreuze und gibt zur?ck ob Formular speicherbar ist oder nicht
function obligation_check_x(fieldName)
{
	
	var storable = true; //speicherbar?
	for (i=0; i<obligation_fields.length; i++)
	{
		var field = document.getElementsByName(obligation_fields[i])[0];
		
		if(field.value == "")
		{
			document.getElementById(obligation_fields[i]+"_m").style.visibility='visible';
			storable = false;
		}
		else document.getElementById(obligation_fields[i]+"_m").style.visibility='hidden';
	}
	return storable;
}

function obligation_setModified()
{
	formModified=true;
	if(document.forms[0] && document.forms[0].modified) 
		document.forms[0].modified.value="1";
}

// ************************** Zum checken und auswirken von fomular?nderungen
function obligation_check(initial,fieldName)
{
	if(fieldName)
	{
		if(!initial)
		{
			var t_new = document.getElementsByName(fieldName)[0].value;
	
			if(!obligation_values[fieldName] && !t_new) return;
			if(obligation_values[fieldName]==t_new) return;
	
			if(t_new.length>0 && obligation_values[fieldName].length>0)
			{
				if(!formModified)
				{
					obligation_setModified();
					if(formStorable)
					{
						try { top.frames.view.triggerEvent(top.events.formChange, window); } catch(e) {}
						disableButtonTag( document.getElementById(obligation_buttonId), false);
					}
					obligation_spezial(fieldName);
					return;
				}
			}
			obligation_setModified();
			obligation_values[fieldName] = t_new;
		}
	}
	var storable = obligation_check_x(fieldName);
	formStorable = storable;
	disableButtonTag( document.getElementById(obligation_buttonId), !storable);

	if(!fieldName)	obligation_spezial(initial);
	else			obligation_spezial(fieldName);

	try { top.frames.view.triggerEvent(top.events.formChange, window); } catch(e) {}
}

// ************************** Zum ?berschreiben f?r prozeduren nach dem check
function obligation_spezial(fieldName) {
}

// ************************** sets listeners (diese funktion is vorerst nicht in verwendung)
function obligation_listener(fieldTag, fieldName) {
	fieldTag.onchange	= function() {	obligation_check(false,fieldName);}
	fieldTag.onkeyup	= function() {	obligation_check(false,fieldName);}
}

// ************************** Zum initialisieren des Formulars (ben?tig die id des lokalen save-buttons, ist in der onload funktion des Body-tags aufzurufen
function obligation_create(s)
{
	obligation_buttonId=s;
	saveButton = document.getElementById(obligation_buttonId);

	obligation_fields	=new Array();
	xfs=document.getElementsByName("xf");
	for(i=0;i<xfs.length;i++)
	{
		obligation_fields[i]=xfs[i].id.substring(0,xfs[i].id.length-2);
		obligation_values[obligation_fields[i]] = document.getElementsByName(obligation_fields[i])[0].value;
	}
	
	var t_inputs = document.getElementsByTagName("input");
	for(i=0;i<t_inputs.length;i++)
		if(t_inputs[i].name)
		{
			obligation_values[t_inputs[i].name] = t_inputs[i].value;
//			obligation_listener(t_inputs[i], t_inputs[i].name);
		}
	
	var t_inputs = document.getElementsByTagName("textarea");
	for(i=0;i<t_inputs.length;i++)
	{
		obligation_values[t_inputs[i].name] = t_inputs[i].value;
//		obligation_listener(t_inputs[i], t_inputs[i].name);
	}

	obligation_check(true);
}


//wandelt string in float um
function toFloat(s)
{
	if(!s) return 0;
	return parseFloat(s.replace(/,/,"."));
}

//wandelt >f< in string mit >,< als trennzeichen und 2 nachkommastellen
function formatFloat(f)
{
	var s=String(Math.floor(f*100)/100);
	var a=s.split(".");
	if(a.length>1)
	{
		if(a[1].length==1) s+="0";
	} else s+=".00";
	
	return s.replace(/\./,",");
}

//wandelt 1.000,24 oder 23.42 in 1000.24 bzw. 23.42 um
function toNumeric(s)
{
	var result	="";
	s			=s.replace(",",".");
	var array	=s.split(".");

	if(array.length > 2)
	{
		for(i=0; i<(array.length-1); i++)
			result+=array[i]
		result+="."+array[array.length-1];
	} else result=s;
	result++;
	result--;
	return result;
}


	//Saubere Methode f?r Konvertierung von float zu W?hrung
	Math.floatToCurrency = function(f)
	{
		f = String(f);
		var parts;
		if(f.indexOf(".")==-1) parts = new Array(f,"00");
		else
		{
			parts = f.split(".");
			if(parts[1].length == 1) parts[1] += "0";
			if(parts[1].length >= 3)
			{
				parts[1] = parts[1].substring(0,2) + "." + parts[1].substring(2,parts[1].length);
				parts[1] = Math.round(parseFloat(parts[1]));
			}
		}
		return parts[0] + "," + parts[1];
	}

	//Rundet auf 2 Nachkommastellen
	Math.currencyRound = function(f)
	{
		return round(parseFloat(f)*100)/100;
	}

	
	
var fenster;
var fenster2;
var labelname;
var fieldname;
var threedot_value		= "";
var threedot_old_value	= "";
var threedot_new_value	= "";
var threedotFieldName	= "";
var threedotLabelName	= "";

function threedot_mark(p1, mark)
{
	fieldname=p1;
	if(mark)
		document.getElementById("threedot_"+fieldname).style.border="1px solid black";
	else
		document.getElementById("threedot_"+fieldname).style.border="1px solid #d0d0d9";
}

function threedot(context, element, event, fieldName, labelName , url, width, x, y, mode)
{
	threedot_old_value = threedot_value;
	threedot_value = "";
	//mode = 1 || xmllist => modaldialog
	//bei xmllist aufruf= ("xmllist",url,id,x,y)
	if(context == "xmllist")
	{
		var s	= (element.split("?").length > 1)?"&":"?";
		element		= element+s+"id="+event+"&dialogForm=true";
		top.frames.layer0.dialogCallerContext	= window;
		top.frames.layer0.dialogWidth			= fieldName?fieldName:250;
		top.frames.layer0.dialogHeight			= labelName?labelName:400;
		top.frames.layer0.dialogUrl				= element;
		top.frames.layer0.openModalDialog(element, window);
	}
	else
	{
		try { threedot_value = document.getElementsByName(fieldName)[0].value; } catch(e){}
		var s	= (url.split("?").length > 1)?"&":"?";
		url		= url+s+"name="+fieldName; //+"&id="+threedot_value

		threedotFieldName	= fieldName;
		threedotLabelName	= labelName;

		if(mode==1)
		{
				top.frames.layer0.dialogCallerContext	= context;
				top.frames.layer0.dialogWidth			= x?x:250;
				top.frames.layer0.dialogHeight			= y?y:400;
				top.frames.layer0.dialogUrl				= url;
				top.frames.layer0.openModalDialog(url, window);
		}
		else
		{
			if(url.search(/threedotmulti-select/)!=-1)
			{
//				url=url.replace(/threedotmulti-select/,"select-multi");
				top.frames.layer0.dialogCallerContext	= context;
				top.frames.layer0.dialogWidth			= x?x:250;
				top.frames.layer0.dialogHeight			= 400;
				top.frames.layer0.dialogUrl				= url;
				top.frames.layer0.openModalDialog(url, window);
			}
			else
			{

				url=url.replace(/threedot-select/,"select");
				top.frames.layer0.openSelectDialog(window, element, event, url, width, x=="null"?false:x);
			}
		}
	}
}

function threedot_open(fieldname,url,o,x,y)
{
	//veraltet
}

function threedot_prepare(fieldname,url)
{
	return true;
}


function threedot_select(p,l,v,n)
{
	p = deunicode(p);
	l = deunicode(l);
	v = deunicode(v);
	n = deunicode(n);
	
	try	{ document.getElementsByName(p)[0].value=v; } catch(e) {}
	try { document.getElementsByName(p+'_view')[0].value=l; } catch(e) {}
	try { if(labelname) document.getElementsByName(labelname)[0].value=l; } catch(e) {}


	try	{ document.getElementById(p).value=v; } catch(e) {}
	try { document.getElementById(p+'_view').value=l; } catch(e) {}
	try { if(labelname) document.getElementById(labelname).value=l; } catch(e) {}
	threedot_new_value=v;
	if(threedot_new_value!=threedot_old_value)
		obligation_check(false,p);
	
	window.setTimeout("threedot_select_extra(\""
		+unicodeQuotes(p)+"\",\""
		+unicodeQuotes(l)+"\",\""
		+unicodeQuotes(v)+"\");",200);
}

//Funktion zum ?berschreiben falls bei auswahl etwas geschehen soll...
function threedot_select_extra(p,l,v) {};

function close_window()
{
	try
	{
		if(fenster) 
		{
			if(fenster.formDialog)
				fenster.triggerClose();
			else
			{
				fenster.close();
				fenster=false;
			}
					
		}
		if(!formDialog)
		{
			if(fenster2) 
			{
				fenster2.close();
				fenster2=false;
			}
		}
		if(fenster3)
		{
			fenster3.close();
			fenster3=false;
		}
	} catch(e)
	{
	}
}


function buttonHighlight(o, c)
{
	switch(c)
	{
		case 0:	//mouseover
		o.style.backgroundImage="url("+homeURL+"/images/design/buttons/button-highlight.jpg)";
		break;
	
		case 1:	//mouseout
		o.style.backgroundImage="url("+homeURL+"/images/design/buttons/button.jpg)";
		break;
	
		case 2: //mousedown
		o.style.backgroundImage="url("+homeURL+"/images/design/buttons/button-active.jpg)";
		break;
	
		case 3:	//mouseup
		o.style.backgroundImage="url("+homeURL+"/images/design/buttons/button-highlight.jpg)";
		break;
	
	}
}

function disableButton(o,b)
{
	if(b)
	{
		if(o.tag.disabled) return;
		o.tag.disabled 				= true;
		o.tag.style.backgroundImage	="url("+homeURL+"/images/design/buttons/"+o.tag.img+"-disabled.gif)";
		o.tag.style.cursor			="default";
	}
	else if(o.tag.disabled)
	{
		o.tag.disabled = false;
		o.tag.style.backgroundImage="url("+homeURL+"/images/design/buttons/"+o.tag.img+".gif)";
		o.tag.style.cursor			="hand";
	}
}

function disableButtonTag(tag,b)
{
	try
	{
		if(b)
		{
			if(tag.disabled) return;
			tag.disabled 				= true;
			tag.style.backgroundImage	= "url("+homeURL+"/images/design/buttons/"+tag.img+"-disabled.gif)";
			tag.style.cursor			= "default";
		}
		else if(tag.disabled)
		{
			
			tag.disabled = false;
			tag.style.backgroundImage	= "url("+homeURL+"/images/design/buttons/"+tag.img+".gif)";
			tag.style.cursor			= "hand";
		}
	}
	catch(e) {}
	
}

function disable(id, b)
{
	if(b)
	{
		if(document.getElementById(id).disabled) return;
		document.getElementById(id).className	= "disabled";
		document.getElementById(id).disabled	= true;
	}
	else if(document.getElementById(id).className == "disabled")
	{
		document.getElementById(id).disabled	= false;
		document.getElementById(id).className	= "none";
	}
}

function isAction(e)
{
	var kc;
	if(!e) if(document.all) kc = window.event.keyCode; else return false;
	if(!document.all) kc = e.which;
	if(kc != 13 && kc != 0 && kc != 32 && kc != 1) return false;
	return true;
}
function suppressDel(e)
{
	if(!e) if(document.all) e = window.event; else return false;
	if(e.keyCode==8) return false;
	return true;
}

checkbox_unchecked	= new Image();checkbox_unchecked.src= homeURL+"/images/icons/form/checkbox-unchecked.jpg";
checkbox_checked 	= new Image();checkbox_checked.src 	= homeURL+"/images/icons/form/checkbox-checked.jpg";
checkbox_or			= new Image();checkbox_or.src 		= homeURL+"/images/icons/form/checkbox-or.jpg";

function changeCheckbox(o,status)
{
	if(o.readonly) return;
	var oldStatus = o.inputTag.value;

	if(status) o.inputTag.value=status;
	else
	{
		if(o.type=="triple")
		{
			if(o.inputTag.value<2) o.inputTag.value++;
			else o.inputTag.value=0;
		}
		else o.inputTag.value = o.inputTag.value=="0"?1:0;
	}
	if(oldStatus != o.inputTag.value)
	{
		var v=o.inputTag.value;
		if(v==0) o.imgTag.src=checkbox_unchecked.src;
		else if(v==1) o.imgTag.src=checkbox_checked.src;
		else if(v==2) o.imgTag.src=checkbox_or.src;
		obligation_check(o.inputTag.name);
	}
}

function checkCheckbox(o,b)
{
	o.inputTag.value=b?1:0;
	var v=o.inputTag.value;
	if(v==0) o.imgTag.src=checkbox_unchecked.src;
	else if(v==1) o.imgTag.src=checkbox_checked.src;
	else if(v==2) o.imgTag.src=checkbox_or.src;
	if(obligation_check) obligation_check();
}