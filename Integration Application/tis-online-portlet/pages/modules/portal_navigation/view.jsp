<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="tui" tagdir="/WEB-INF/tags/ui" %>
<%@taglib prefix="tdl" tagdir="/WEB-INF/tags/data" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="portal_navigation">
<ul class="topdev_link_extern">
	<li ><a class="topdev_link" href="http://www.thueringen.de/de/tkm" target="_blank">Thüringer Kultusministerium</a>
	</li>
	<li ><a class="topdev_link" href="http://www.thillm.de" target="_blank">Thillm</a>
	</li>
	<%
if(request.getUserPrincipal()!=null)
{
	%>
	<li ><a class="topdev_link" href="https://topdevcl001/tis-online-thillm/init-login.jsp" target="_blank">TIS-Online</a>
	</li>
	<%
}
else
{
	%>
	<li ><a class="topdev_link" href="https://topdevcl001/tis-online-thillm" target="_blank">TIS-Online</a>
	</li>
	<%
}
%>
	<li ><a class="topdev_link" href="http://www.kompetenztest.de" target="_blank">Evaluationsportal der FSU Jena</a>
	</li>
</ul>
</div>