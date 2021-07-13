<%@ include file="init_ns.jsp" %>
<%@ include file="/pages/lib/init/init_modules_v2.jsp" %>
<c:set var="lastMediResultList" scope="session">result_favorite</c:set>
<c:set var="heading"><s:property value="heading"/></c:set>
<c:set var="userName"><s:property value="userName"/></c:set>
<c:if test="${not empty heading}"><b>${heading}</b><br/><br/></c:if>
<%@ include file="/pages/modules/medium/result/symbol_list.jsp" %>

<table class="topdev_view" width="100%" border="0">
	<colgroup><col width="100px"/><col/><col width="100px"/></colgroup>
	<tbody>
		<tr>
			<td align="left">
				<s:if test="searchObj.rowsTotal > 0">
					<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tv2:url>/medium_result_favorite/print.action</tv2:url>')"/>
				</s:if>
			</td>
			<td align="center">
				<font color="#666">${topdevPagebarResultInfo}</font>
			</td>
			<td align="right">
				<div class="back">
					<c:set var="tspm"><s:property value="tspm"/></c:set>
					<c:set var="showAllUrl">/web/guest/media/search?tspm=${(empty tspm)?'alle':tspm}&tspi=<s:property value="tspi"/></c:set>
					<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Alle anzeigen" border="0"/>
					&nbsp;<a class="topdev_link" href="${showAllUrl}">Alle anzeigen</a>
				</div>
			</td>
		</tr>
	</tbody>
</table>