<%@ page session="true" %>
<%@ page language="java" import="java.sql.*, java.io.*,  java.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld"	prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld"	prefix="logic" %>
<%@ taglib uri="/WEB-INF/topdev.tld" prefix="ttl" %>
<html>
	<head>

<script>
	<logic:equal parameter="formDialog" value="true">
		formDialog = true;
	</logic:equal>
	function sendCurrentPage(curr) 
	{
		<logic:notPresent parameter="foldbox">
			parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.document.forms[0].page.value=curr;
			try		{ parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.searchForm.search(curr); }
			catch(e){ parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.document.forms[0].submit() }
		</logic:notPresent>
		<logic:present parameter="foldbox">
			parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.document.forms[0].page.value=curr;
			try		{ parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.searchForm.search(curr); }
			catch(e){ parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>search.document.forms[0].submit() }
//			parent.<logic:present parameter="prefix"><%=request.getParameter("prefix")%></logic:present>results.selectPage(curr);
		</logic:present>
	}
	
	function out (myObject)
	{
	}
	
	function over (myObject)
	{
	}

</script>
<ttl:include file="css-form" type="css"/>
<script><jsp:include flush="true" page="/resources/javascript/js-common.jsp"/></script>
<ttl:include file="js-common" type="js"/>
<logic:present parameter="multiple">
	<ttl:include file="js-form" type="js"/>
</logic:present>
<logic:equal parameter="formDialog" value="true">
	<ttl:include file="pages/dialog/dialog" type="js"/>
</logic:equal>

</head>

<body bgcolor="#ffffff" topmargin="0" leftmargin="0" ><nobr>
<!--
	<form name='formular' action='results.jsp' method='post' target="recordlist">
	 <input type="hidden" name="Currentpage">
	</form>
-->
<%

//Integer.parseInt(((String)session.getAttribute("search.currentResults")).trim());

int i;


int Currentpage	=1;
int Pagesize	=1;
int Recordcount	=1;


if(request.getParameter("currentpage")!=null)		Currentpage = Integer.parseInt(request.getParameter("currentpage"));
if(request.getParameter("maxresults")!=null)		Pagesize = Integer.parseInt(request.getParameter("maxresults"));
if(request.getParameter("currentresults")!=null)	Recordcount = Integer.parseInt(request.getParameter("currentresults"));

//out.println("<font color=red>"+Currentpage+"-"+Pagesize+"-"+Recordcount+"</font>");

int Pagecount	= 	(int)((float)Math.ceil( (double) Recordcount/Pagesize)); //Anzahl der Seiten


session.setAttribute("search.CPageCount",""+Pagecount);

int maxPages=15;	//muss gerade sein

//Currentpage=1;
int FirstPage =		((int)(float)(Math.ceil((double)(--Currentpage/maxPages))) )*maxPages+1;
int LastPage;


if(Pagecount<maxPages) LastPage=Pagecount; else LastPage	=FirstPage+maxPages-1;

int FromDS		=Currentpage*Pagesize+1; // +2 weil zuvor --
int ToDS		=FromDS+Pagesize-1;

if(Recordcount!=0)
{
if(LastPage>Pagecount) LastPage = Pagecount;

	int cp = Currentpage + 1;
	int middlePage=7;
	if(cp>middlePage+1)
	{
		FirstPage=cp-7;
		LastPage=cp+7;
		if(LastPage>Pagecount)
		{
			FirstPage-=LastPage-Pagecount;
			LastPage = Pagecount;
		}
	}
	if(FirstPage<0) FirstPage=1;

if(Currentpage >= 0)
{
	%>
	<%//=Currentpage%>
	<%//=Pagesize%>
	<%//=Recordcount%>
	<table cellpadding="0" style="border-width:0" cellspacing="0" border="0" width="100%" height="100%">
	<tr>
	<td class="label">
	<table cellpadding="0" style="border-width:0" cellspacing="0" border="0" align="left" class="RecordPageNavi">
	<tr>
	<td align="left" valign="top" style="cursor:hand; cursor:pointer;" class="label">Seite:&nbsp;&nbsp;
	<%
	//pfeile nach links 
if(Pagecount>1)
{
	if(Currentpage >= 1)
	{
		if(Pagecount>2)
		{
			%>
			<a href="javascript:;" onclick="sendCurrentPage(<%= 1 %>);" title="Erste Seite anzeigen"><b>&lt;&lt;</b>&nbsp;&nbsp;</a>
			<%
		}
		%>
		<a href="javascript:;"  onclick="sendCurrentPage(<%= Currentpage>0?Currentpage:1 %>);" title="Vorrige Seite anzeigen"><b>&lt;</b>&nbsp;</a>
		<%
	} else 
	{
		if(Pagecount>2)
		{
			%>
			<a href="javascript:;" style="color: #aaaaaa; cursor: default;"><b>&lt;&lt;</b>&nbsp;&nbsp;</a>
			<%
		}
		%>
		<a href="javascript:;" style="color: #aaaaaa; cursor: default;"><b>&lt;</b>&nbsp;</a>
		<% 
	}
}

//Seitenlinks Mittelteil	
	for(i=FirstPage; i<=LastPage; i++)
	{
		if(Currentpage+1!=i)
		{
			%>
			<a href="javascript:;" style="color: #000000;" onclick="sendCurrentPage(<%= i%>);" title="Seite <%= i %> anzeigen">&nbsp;<%= i %>&nbsp;</a>     
			<%
		} else
		{
			%>
			<a href="javascript:;" style="color: black; font-weight:bolder; cursor: default;" title="Aktuelle Seite">&nbsp;[<%= i %>]&nbsp;</a>
			<% 
		}
	}
	%>
	<% 
//pfeile nach rechts
if(Pagecount>1)
{
	if((Currentpage+1)<LastPage || Pagecount>LastPage)
	{
		%>
		<a href="javascript:;" onclick="sendCurrentPage(<%= Currentpage+2 %>);" title="Nächste Seite anzeigen">&nbsp;<b>&gt;</b></a>
		<%
		if(Pagecount>2)
		{
			%>
			<a href="javascript:;" onclick="sendCurrentPage(<%= Pagecount %>);" title="Letzte Seite anzeigen">&nbsp;&nbsp;<b>&gt;&gt;</b></a>
			<%
		}
	} else
	{
		%>
		<a href="javascript:;" style="cursor: default; color: #aaaaaa;">&nbsp;<b>&gt;</b></a>
		<%
		if(Pagecount>2)
		{
			%>
			<a href="javascript:;" style="cursor: default; color: #aaaaaa;">&nbsp;&nbsp;<b>&gt;&gt;</b></a>
			<%
		}
	}
}
	%>

	<%
	//= Currentpage+"-"+Pagesize+"-"+Pagecount+"-"+Recordcount+"-"+FromDS+"-"+ToDS 
	%>
	</td>
	</tr>
	</table>
	</td>
<%-- Infoteil _______________________________________________________________--%>
	<td class="label">
	<table style="border-width:0" cellpadding="0" cellspacing="0" border="0" align="right" class="RecordPageNavi">
	<tr>
	<% 
	if(ToDS>Recordcount) ToDS=Recordcount;
	
	%>
	<td class="label" align="right" valign="top" style="cursor: default;">  <nobr>
	<%= FromDS %> <bean:message key="reda.pagenavi.pagenavigator.bis"/> <%= ToDS %> <bean:message key="reda.pagenavi.pagenavigator.von"/> <%= Recordcount %>
	
	<% if(Recordcount>1) { %><bean:message key="reda.pagenavi.pagenavigator.eintraegen"/><% }  
	else  { %><bean:message key="reda.pagenavi.pagenavigator.eintrag"/><% }
	%>
	</td>
	
	<logic:present parameter="multiple">
		<logic:equal parameter="multiple" value="true">
			<td align="right" valign="top" class="field"><nobr>
				<ttl:commandButton name="cb_ok" 	function="parent.results.multipleOkButton()"/>
				<ttl:commandButton name="cb_abort" 	function="top.frames.searchdialog.triggerClose();"/>
			</td>
		</logic:equal>
	</logic:present>
	
	</tr>
	</table>
	</td>
	</tr>
	</table>
	
	
	
<% 
}
} else
{
%>
	<logic:present parameter="multiple">
		<logic:equal parameter="multiple" value="true">
		<table width="100%" cellspacing=0 cellpadding=0>
			<tr>
				<td align="right" valign="top" class="field" width="100%"><nobr>
					<ttl:commandButton name="cb_ok" 	function="top.frames.searchdialog.triggerClose();"/>
					<ttl:commandButton name="cb_abort" 	function="top.frames.searchdialog.triggerClose();"/>
				</td>
			</tr>
		</table>
		</logic:equal>
	</logic:present>

<%
}

%>