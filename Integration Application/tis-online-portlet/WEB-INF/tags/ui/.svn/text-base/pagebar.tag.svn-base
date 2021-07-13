<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ tag import="com.topdev.tsp.action.basic.SearchActionSupport"%>
<%@ tag import="com.opensymphony.xwork2.ActionContext"%>
<%@ attribute name="rowCounter" required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="maxResults" required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="currentPage" required="false" rtexprvalue="true" type="java.lang.Integer"%>

<%
	if(rowCounter==null || maxResults==null || currentPage==null)
	{
		SearchActionSupport action = (SearchActionSupport)ActionContext.getContext().getActionInvocation().getAction();
		try
		{
			rowCounter = Integer.parseInt(action.getRowCounter());
		}
		catch(Exception e) {}
		if(rowCounter>0)
		{
			maxResults	= Integer.parseInt(action.getMaxResults());
			currentPage	= Integer.parseInt(action.getPage());
		}
	}
	else
	{
		%>
			
		<%
	}
	
	if(rowCounter>0)
	{
		int pageCount	= (int)Math.ceil( (double) rowCounter/maxResults); //Anzahl der Seiten
		int maxPages	= 15;	//muss zwingend ungerade sein
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
<script>
function ${ns}sendCurrentPage(page) 
{
	try
	{
		var t_f = document.getElementById("${ns}_form");
		t_f.page.value = page;
		t_f.submit()
	}
	catch(e) { }
}
</script>
<table cellpadding="0" style="border-width:0" cellspacing="0" border="0" width="100%" height="100%">
<tr>
<td class="label">
<table cellpadding="0" style="border-width:0" cellspacing="0" border="0" align="left" class="RecordPageNavi">
<tr>
<td align="left" valign="top" style="cursor:hand; cursor:pointer;" class="label">
<s:if test="${ pageCount > 1 }">
Seite:&nbsp;&nbsp;
	<s:if test="${ currentPage > 1 }">
		<s:if test="${ pageCount > 2 }">
			<a href="#" onclick="${ns}sendCurrentPage(<%= 1 %>);" title="Erste Seite anzeigen"><b>&lt;&lt;</b>&nbsp;&nbsp;</a>
		</s:if>
		<a href="#"  onclick="${ns}sendCurrentPage(<%= currentPage > 0?currentPage-1:1 %>);" title="Vorrige Seite anzeigen"><b>&lt;</b>&nbsp;</a>
	</s:if>
	<s:else>
		<s:if test="${ pageCount > 2 }">
			<a href="#" style="color: #aaaaaa; cursor: default;"><b>&lt;&lt;</b>&nbsp;&nbsp;</a>
		</s:if>
		<a href="#" style="color: #aaaaaa; cursor: default;"><b>&lt;</b>&nbsp;</a>
	</s:else>
	
	<%
	for(int i=firstPage; i<=lastPage; i++)
	{
		if(currentPage!=i)
		{
			%>
			<a href="#" style="color: #000000;" onclick="${ns}sendCurrentPage(<%= i%>);" title="Seite <%= i %> anzeigen">&nbsp;<%= i %>&nbsp;</a>     
			<%
		} else
		{
			%>
			<a href="#" style="color: black; font-weight:bolder; cursor: default;" title="Aktuelle Seite">&nbsp;[<%= i %>]&nbsp;</a>
			<% 
		}
	}
	
	
	if(pageCount>1)
	{
		if(currentPage<lastPage || pageCount>lastPage)
		{
			%>
			<a href="#" onclick="${ns}sendCurrentPage(<%= currentPage+1 %>);" title="N&auml;chste Seite anzeigen">&nbsp;<b>&gt;</b></a>
			<%
			if(pageCount>2)
			{
				%>
				<a href="#" onclick="${ns}sendCurrentPage(<%= pageCount %>);" title="Letzte Seite anzeigen">&nbsp;&nbsp;<b>&gt;&gt;</b></a>
				<%
			}
		} else
		{
			%>
			<a href="#" style="cursor: default; color: #aaaaaa;">&nbsp;<b>&gt;</b></a>
			<%
			if(pageCount>2)
			{
				%>
				<a href="#" style="cursor: default; color: #aaaaaa;">&nbsp;&nbsp;<b>&gt;&gt;</b></a>
				<%
			}
		}
	}
	%>
</s:if>
	</td>
	</tr>
	</table>
	</td>
<%-- Infoteil _______________________________________________________________--%>
	<td class="label">
	<table style="border-width:0" cellpadding="0" cellspacing="0" border="0" align="right" class="RecordPageNavi">
	<tr>
	<% 
	if(toDS>rowCounter) toDS=rowCounter;
	
	%>
	<td class="label" align="right" valign="top" style="cursor: default;">  <nobr>
	<%= fromDS %> bis <%= toDS %> von <%= rowCounter %> <%=(rowCounter>1)?"Eintr&auml;gen":"Eintrag"%>
	</td>
	
	</tr>
	</table>
	</td>
	</tr>
	</table>




<%
	}
%>
