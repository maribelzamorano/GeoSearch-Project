//browser erkennung
var browser_ie_mac = navigator.userAgent.search(/mac/i)!=-1 && navigator.userAgent.search(/msie/i)!=-1;
var browser_ie_win = navigator.userAgent.search(/win/i)!=-1 && navigator.userAgent.search(/msie/i)!=-1;
var ms = (!document.all && document.getElementById);
var ie = (document.all);

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
