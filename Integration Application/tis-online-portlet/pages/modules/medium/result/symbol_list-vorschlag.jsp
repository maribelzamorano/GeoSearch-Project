<big>
<c:choose>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:1'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Biologie:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:2'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Medizin:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:3'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Wirtschaft:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:4'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Theologie:</b><br/><br/></c:when>
</c:choose>
</big>

<table class="topdev_tickets" width="525px" >
	<colgroup>
		<col width="50%">
		<col width="50%">
	</colgroup>
	<c:set var="i">0</c:set>
	<s:iterator value="mediums" status="rowstatus">
		<c:if test="${i == 0}"><tr></c:if>
		<td valign="top" >
			<a href="media/detail?tspi=123">
				<c:set var="bildliste"><s:property value="bildliste"/></c:set>
				<c:choose>
				<c:when test="${empty bildliste}">
					<img 
						class="topdev_media_result"
						src="<s:url value="/images/icons/medium"/>/<s:property value="mediumArtCode"/>.jpg"
						border="0"/>
				</c:when>
				<c:otherwise>
					<img 
						class="topdev_media_result"
						src="<s:url value="/images/icons/medium"/>/${bildliste}.jpg"
						border="0"/>
				</c:otherwise>
				</c:choose>
				<font class="topdev_media_titel" title="<s:property value="einzeltitel"/>">
					<tui:spacer maxLength="33" maxWordLength="15"><s:property value="einzeltitel"/></tui:spacer>
				</font>
			</a>
			<font class="topdev_zusatzinfo">
				<font title="<s:property value="einzeluntertitel"/>">
					<tui:spacer maxLength="33" maxWordLength="15"><s:property value="einzeluntertitel"/></tui:spacer>
				</font>
			</font>
			<font class="topdev_zusatzinfo_type">
				<s:property value="mediumArtDecode"/> (<s:property value="produktionsjahr"/>)
			</font>
		</td>
		<c:set var="i">${i+1}</c:set>
		<c:if test="${i == 2}"><c:set var="i">0</c:set></tr></c:if>
	</s:iterator>
</table><br/>
<div class="back">
	<img src="/tis-online-portlet/images/icons/portlet/link_intern.gif" title="Alle anzeigen" border="0"/>
	&nbsp;<a class="topdev_link" href="/web/guest/media/search?tspm=<s:property value="tspm"/>&tspi=<s:property value="tspi"/>">Alle anzeigen</a>
</div>