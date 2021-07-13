<%@ include file="init.jsp" %>

<%
if(request.getAttribute("LIFERAY_SHARED_tspm")!=null && ((String)request.getAttribute("LIFERAY_SHARED_tspm")).startsWith("adressaten")) request.setAttribute("adressaten",new Boolean(true));
else request.setAttribute("adressaten",new Boolean(false)); 
if(request.getAttribute("LIFERAY_SHARED_tspm")!=null && ((String)request.getAttribute("LIFERAY_SHARED_tspm")).startsWith("sachgebiete")) request.setAttribute("sachgebiete",new Boolean(true));
else request.setAttribute("sachgebiete",new Boolean(false)); 
%>
<div class="back">
	<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
	&nbsp;<a class="topdev_link" href="/web/guest/media?tspm=clear">Zur&uuml;ck zur &Uuml;bersicht</a>
</div>
<br/>
<h4 class = "topdev_link_menu"><tui:msg key="adressaten" type="heading" /></h4>
<ul class="topdev_link_menu">
<s:iterator value="adressaten">
	<c:set var="tCode"><s:property value="code"/></c:set>
	<li>
		<c:choose>
			<c:when test="${adressaten and LIFERAY_SHARED_tspi eq tCode}">
					<font class="topdev_active"><s:property value="decode"/></font>
			</c:when>
			<c:otherwise>
				<a href="/web/guest/media/search?tspi=${tCode}&tspm=adressaten_:_<s:property value="decode"/>"><s:property value="decode"/></a>
			</c:otherwise>
		</c:choose>
		<br/>
	</li>
</s:iterator>
</ul>


<h4 class = "topdev_link_menu"><tui:msg key="sachgebiete" type="heading" /></h4>
<ul class="topdev_link_menu">
<s:iterator value="sachgebiet">
	<c:set var="tCode"><s:property value="code"/></c:set>
	<li>
		<c:choose>
			<c:when test="${sachgebiete and LIFERAY_SHARED_tspi eq tCode}">
				<font class="topdev_active"><s:property value="decode"/></font>
			</c:when>
			<c:otherwise>
				<a href="/web/guest/media/search?tspi=${tCode}&tspm=sachgebiete_:_<s:property value="decode"/>"><s:property value="decode"/></a>
			</c:otherwise>
		</c:choose>
		<br/>
	</li>
</s:iterator>
</ul>
<br/>
<div class="back">
	<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
	&nbsp;<a class="topdev_link" href="/web/guest/media?tspm=clear">Zur&uuml;ck zur &Uuml;bersicht</a>
</div>

<tv2:permission object="button_insert" action="insert">
		<br/><br/><br/>
		<div>
			<a href="/web/guest/media/detail?tspi=0"><img src="/tis-online-portlet/images/icons/portlet/add.png" title="Medium hinzuf&uuml;gen" border="0"/></a>
			&nbsp;<a href="/web/guest/media/detail?tspi=0">Medium hinzuf&uuml;gen</a>
		</div>
		<div>
			<a href="/web/guest/media/logview"><img src="/tis-online-portlet/images/icons/edit_in_use.gif" title="Importerlog Ansehen" border="0"/></a>
			&nbsp;<a href="/web/guest/media/logview">Importerlog ansehen</a>
		</div>
</tv2:permission>
