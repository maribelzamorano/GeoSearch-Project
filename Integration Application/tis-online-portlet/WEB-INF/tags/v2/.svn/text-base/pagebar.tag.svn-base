<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ tag import="com.opensymphony.xwork2.ActionContext"%>
<%@ attribute name="rowCounter" required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="maxResults" required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="currentPage" required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="extractResultInfo" required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<c:set var="tagDivClass">topdev_tag_pagebar</c:set>
<div class="${tagDivClass}">
<%
	if(extractResultInfo==null) extractResultInfo = false;
	if(rowCounter>0 && rowCounter>maxResults)
	{
		int pageCount	= (int)Math.ceil( (double) rowCounter/maxResults); //Anzahl der Seiten
		int maxPages	= 7;	//muss zwingend ungerade sein
		int pageDiff	= (int)(maxPages-1)/2;
		int firstPage	= ((int)(Math.ceil((double)((currentPage-1)/maxPages))))*maxPages+1;
		int lastPage;
	
		if(pageCount<maxPages) lastPage	= pageCount;
		else
		{
			lastPage	= firstPage+maxPages-1;
			if( (currentPage-pageDiff)>0 && (currentPage+pageDiff)<pageCount )
			{
				firstPage	= currentPage-pageDiff;
				lastPage	= currentPage+pageDiff;
			}
			else if((currentPage-pageDiff)<1)
			{
				lastPage = maxPages;
			}
			else if((currentPage+pageDiff)>=pageCount)
			{
				lastPage = pageCount;
			}
			firstPage	= lastPage-maxPages+1;
			if(firstPage<1) firstPage = 1;
		}
		if(lastPage>pageCount) lastPage = pageCount;
		if(lastPage<1) lastPage = 1;
		if(firstPage<1) firstPage = 1;
		
		int fromDS		=((currentPage-1)*maxResults)+1;
		int toDS		=fromDS+maxResults-1;
		
		request.setAttribute("maxResults",	maxResults);
		request.setAttribute("currentPage",	currentPage);
		request.setAttribute("rowCounter",	rowCounter);
		request.setAttribute("pageCount",	pageCount);
		request.setAttribute("maxPages",	maxPages);
		request.setAttribute("firstPage",	firstPage);
		request.setAttribute("lastPage",	lastPage);
		request.setAttribute("fromDS",		fromDS);
		request.setAttribute("toDS",		toDS);
	

%>
<table cellpadding="0" cellspacing="0" border="0" align="center">
<tr>
<td align="left" valign="top">
Seiten:&nbsp;&nbsp;
<s:if test="${ pageCount > 1 }">
	<s:if test="${ currentPage > 1 }">
		<s:if test="${ pageCount > 2 }"><a href="javascript:;" onclick="${ns}_changeSearchPage(<%= 1 %>);" title="Erste Seite anzeigen" class="${tagDivClass}_dblBack">&lt;&lt;</a>&nbsp;&nbsp;</s:if>
		<a href="javascript:;"  onclick="${ns}_changeSearchPage(<%= currentPage > 0?currentPage-1:1 %>);" title="Vorrige Seite anzeigen" class="${tagDivClass}_back">&lt;</a>&nbsp;
	</s:if>
	<s:else>
		<s:if test="${ pageCount > 2 }"> <a class="${tagDivClass}_dblBack_disabled">&lt;&lt;</a>&nbsp;&nbsp;</s:if>
		<a class="${tagDivClass}_back_disabled">&lt;</a>&nbsp;
	</s:else>
	
	<%
	for(int i=firstPage; i<=lastPage; i++)
	{
		if(currentPage!=i)	{ %><a href="javascript:;" class="${tagDivClass}_goToOtherPage" onclick="${ns}_changeSearchPage(<%= i%>);" title="Seite <%= i %> anzeigen">&nbsp;<%= i %></a>&nbsp;<% }
		else				{ %><a href="javascript:;" class="${tagDivClass}_goToCurrentPage" title="Aktuelle Seite">&nbsp;[<%= i %>]</a>&nbsp;<% }
	}
	if(pageCount>1)
	{
		if(currentPage<lastPage || pageCount>lastPage)
		{
			%><a href="javascript:;" onclick="${ns}_changeSearchPage(<%= currentPage+1 %>);" title="N&auml;chste Seite anzeigen" class="${tagDivClass}_forward">&nbsp;&gt;</a><%
			if(pageCount>2) { %><a href="javascript:;" onclick="${ns}_changeSearchPage(<%= pageCount %>);" title="Letzte Seite anzeigen" class="${tagDivClass}_dblForward">&nbsp;&nbsp;&gt;&gt;</a><% }
		}
		else
		{
			%><a class="${tagDivClass}_forward_disabled">&nbsp;&gt;</a><%
			if(pageCount>2) { %><a class="${tagDivClass}_dblForward_disabled">&nbsp;&nbsp;&gt;&gt;</a><% }
		}
	}
	if(toDS>rowCounter) toDS=rowCounter;
	%>
	</td>
	</tr>
	<%
	
	request.setAttribute("topdevPagebarResultInfo","( "+fromDS+" bis "+toDS+" von "+rowCounter+" Einträgen)");
	
	if(!extractResultInfo)
	{ %>
		<tr>
			<td valign="top" class="${tagDivClass}_resultInfo"> 
				<center><nobr>${topdevPagebarResultInfo}</nobr></center>
			</td>
		</tr>
	<% } %>
	</table>
</s:if>
<% } %>
</div>