<%@ include file="init.jsp" %>
<c:set var="anwf" scope="request">${(LIFERAY_SHARED_friendlyURL eq '/web/guest/media/mediacenter')?'media':''}</c:set>
<c:set var="ns" scope="request">${ns}${anwf}</c:set>


<form id="${ns}_form" action="<tui:url action="true">search</tui:url>" method="post">
	<%@ include file="/pages/modules/school_search/form.jsp" %>
</form>
<s:if test="rows.size">
	<tui:pagebar/>
		<s:if test="RowCounter>0">
			<%@ include file="/pages/modules/school_search/list.jsp" %>
		</s:if>
		<s:else>
			<b><tui:msg key="school_search" type="label"/></b><br/>
		</s:else>
		<br/>
	<tui:pagebar/>
</s:if>
