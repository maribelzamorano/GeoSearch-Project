<%@ include file="init_ns.jsp" %>
<%@ include file="/pages/lib/init/init_modules_v2.jsp" %>
<c:set var="lastMediResultList" scope="session">result</c:set>
<s:if test="searchObj.results.length>0">

<div class="back">
	<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
	&nbsp;<a class="topdev_link" href="/web/guest/media?tspm=clear">Zur&uuml;ck zur &Uuml;bersicht</a>
</div>

<c:set var="heading"><s:property value="heading"/></c:set>
<c:if test="${not empty heading}"><b>${heading}</b><br/></c:if>
<br/>
<%@ include file="symbol_list.jsp" %> 
</s:if>
<s:else>
	<b>Es wurden keine mit Ihrer Suchanfrage &uuml;bereinstimmenden Medien gefunden.</b>
	<br/><br/>
</s:else>

<table class="topdev_view" width="100%" border="0">
	<colgroup><col width="150px"/><col/><col width="150px"/></colgroup>
	<tbody>
		<tr>
			<td align="left">
				<s:if test="searchObj.rowsTotal > 0">
					<input type="button" class="topdev_button_print" value="Drucken" onclick="window.open('<tv2:url>/medium_result/print.action</tv2:url>')"/>
				</s:if>
			</td>
			<td align="center">
				<font color="#666">${topdevPagebarResultInfo}</font>
			</td>
			<td align="right">
				<div class="back">
					<img src="/tis-online-portlet/images/icons/portlet/back.gif" title="zur&uuml;ck" border="0"/>
					&nbsp;<a class="topdev_link" href="/web/guest/media?tspm=clear">Zur&uuml;ck zur &Uuml;bersicht</a>
				</div>
			</td>
		</tr>
	</tbody>
</table>