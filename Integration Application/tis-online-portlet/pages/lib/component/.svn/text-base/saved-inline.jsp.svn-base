<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@taglib prefix="tdl" tagdir="/WEB-INF/tags/data" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="ajaxId">
	<tdl:var-set name="ajaxId"><s:property value="ajaxId"/></tdl:var-set>
</s:if>
<% 
if(request.getParameter("ns")!=null && !request.getParameter("ns").equals("null"))
	request.setAttribute("ns", request.getParameter("ns"));
if(request.getAttribute("ns")==null) request.setAttribute("ns","defaultNamespace"); 

if(request.getAttribute("ajaxId")==null || ((String)request.getAttribute("ajaxId")).trim().length()<1)
	request.setAttribute("ajaxId",request.getParameter("ajaxId"));

%>

<html>
<head>
</head>
<body>
<div id="${ns}_infoDiv">
<s:if test="rtErrors.size>0">
	<tui:errors/>
</s:if>
</div>

<script>
	try
	{
		parent.document.getElementById("<%=request.getAttribute("ajaxId") %>_infoDiv").style.display="inline";
		parent.document.getElementById("<%=request.getAttribute("ajaxId") %>_infoDiv").innerHTML = document.getElementById("${ns}_infoDiv").innerHTML;
	}
	catch(e) {}

	if(document.getElementById("${ns}_infoDiv").innerHTML.length<10)
	{
		try
		{
			parent.document.getElementById("<%=request.getAttribute("ajaxId") %>_infoDiv").innerHTML = "<ul><li><font color=\"green\">Die Daten wurden erfolgreich gespeichert.<br/></font></li></ul>"
		}
		catch(e) { alert(e); }
		try
		{
			<%
			if(request.getParameter("leave")!=null && request.getParameter("leave").equals("true"))
			{
				%>
					parent.location.replace(parent.backUrl);
				<%
			}
			else
			{
				%>
				parent.TopdevUtil.updateTab(
					'<%=request.getParameter("ns") %>',
					'<%=request.getAttribute("ajaxId") %>',
					'<%=request.getParameter("forwardUrl") %>');
				<%
			}
			%>
		}
		catch(e) { alert(e); }
	}
	if(document.all) parent.setTimeout("TopdevUtil.rebuildElements();",200);
</script>
</body>
</html>