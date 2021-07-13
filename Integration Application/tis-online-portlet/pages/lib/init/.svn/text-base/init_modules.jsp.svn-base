<%@ include file="/pages/lib/init/init.jsp" %>
<%@taglib prefix="tv2" tagdir="/WEB-INF/tags/v2" %>
<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@taglib prefix="tdl" tagdir="/WEB-INF/tags/data" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<portlet:defineObjects/>
<%
	boolean browser_ie = false;
	boolean browser_ff = false;
	if(request.getHeader("User-Agent")!=null && request.getHeader("User-Agent").indexOf("MSIE")>-1) browser_ie = true;
	else browser_ff = true;
	request.setAttribute("browser_ie", new Boolean(browser_ie));
	request.setAttribute("browser_ff", new Boolean(browser_ff));
%>
<script>
	homeUrl = "<s:url value="/"/>";
</script>
<link style="display:none" href="<s:url value="/resources/stylesheet/default-portlet.css"/>" rel="stylesheet" type="text/css"></link>
<script src="<s:url value="/resources/javascript/js-portlet.js"/>"  type="text/javascript"></script>
<%-- 
<script src="/tis-online-portlet/resources/javascript/lib/sarissa.js"  type="text/javascript"></script>
<script src="/tis-online-portlet/resources/javascript/lib/sarissa_ieemu_xslt.js"  type="text/javascript"></script>
<script src="/tis-online-portlet/resources/javascript/lib/sarissa_dhtml.js"  type="text/javascript"></script>
<script src="/tis-online-portlet/resources/javascript/lib/sarissa_ieemu_xpath.js"  type="text/javascript"></script>
<script src="/tis-online-portlet/resources/javascript/js-default.js"  type="text/javascript"></script>
--%>
<%
	request.setAttribute("ajaxId",request.getAttribute("ns"));
	if(request.getAttribute("jsInitialized")==null)
	{
		String ns = String.valueOf(request.getAttribute("ns"));
		%>
		<script>
			var homeURL = "/tis-online-portlet";
			TopdevUtil.objs["<%=ns%>"]			= new Object();
			TopdevUtil.objs["<%=ns%>"].tabs		= new Array();
			TopdevUtil.objs["<%=ns%>"].og		= true;			//noch pflichtfelder unausgefüllt?
			TopdevUtil.objs["<%=ns%>"].tabIds	= new Array();
			TopdevUtil.namespaces[TopdevUtil.namespaces.length] = "<%=ns%>";
			
			window.onload = function()
			{
				var nss = TopdevUtil.namespaces;
				for(i1=0; i1<nss.length; i1++)
				{
					var tabIds = TopdevUtil.objs[nss[i1]].tabIds
					for(i2=0; i2<tabIds.length; i2++)
						TopdevUtil.ogCheckTab(nss[i1], tabIds[i2]);
				}
			}
		</script>
		<%
		request.setAttribute("jsInitialized", "true");
	}
%>
<tdl:var-set name="mode"><s:property value="mode"/></tdl:var-set>
<div id="${ns}_info"><tui:errors/></div>