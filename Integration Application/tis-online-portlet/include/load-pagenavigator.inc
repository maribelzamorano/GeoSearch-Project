<%--  Einbau in results.jsp --%>
	try {
	if(parent.pagenavigator && parent.pagenavigator.location)
		parent.pagenavigator.location.replace("<bean:write name="container" property="absoluteUrl"/>/<%
	String	s  = "pagenavigator.do?currentresults="+request.getAttribute("Cresults");
			s += "&maxresults="+request.getAttribute("CmaxResults");
			s += "&currentpage="+request.getAttribute("Cpage");
	out.print(s);
	%>"); } catch(pagenavigator_error) {}
