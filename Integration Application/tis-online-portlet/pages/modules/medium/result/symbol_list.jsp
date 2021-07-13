<big>
<c:choose>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:1'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Biologie:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:2'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Medizin:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:3'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Wirtschaft:</b><br/><br/></c:when>
	<c:when test="${LIFERAY_SHARED_tspm eq 'category:4'}">${ns eq 'medium_result_favorite'?'Beliebteste':'Neueste'} Medien in der Kategorie <b>Theologie:</b><br/><br/></c:when>
</c:choose>
</big>


<table cellpadding="5">
	<colgroup>
		<col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/><col width="20%"/>
	</colgroup>
	<c:set var="i">0</c:set>
	<s:iterator value="searchObj.results" status="rowstatus">
		<c:if test="${i == 0}"><tr></c:if>
		<td valign="top" style="padding-bottom:15px; padding-right:3px">
			<a href="/web/guest/media/detail?tspi=<s:property value="id"/>">
				<c:set var="bildliste"><s:property value="bildliste"/></c:set>
				<c:choose>
				<c:when test="${empty bildliste}">
					<img 
						height="75px" 
						width="100px" 
						src="<s:property value="previewImageUrl"/>"
						border="0"/><br/>
				</c:when>
				<c:otherwise>
					<img 
						height="75px" 
						width="100px" 
						src="<s:property value="previewImageUrl"/>"
						border="0"/><br/>
				</c:otherwise>
				</c:choose>
				</a>
				<a href="/web/guest/media/detail?tspi=<s:property value="id"/>">
				<font title="<s:property value="einzeltitel"/>">
					<tv2:spacer maxLength="33" maxWordLength="15"><s:property value="einzeltitel"/></tv2:spacer>
				</font>
			</a><br/>
			<font class="topdev_zusatzinfo">
				<s:if test="einzeluntertitel!=null && einzeluntertitel!=''">
					<font title="<s:property value="einzeluntertitel"/>">
						<tv2:spacer maxLength="33" maxWordLength="15"><s:property value="einzeluntertitel"/></tv2:spacer><br/>
					</font>
				</s:if>
				<tv2:spacer maxLength="53" maxWordLength="25">
					<i><s:property value="mediumArtDecode"/> <s:if test="produktionsjahr!=null && produktionsjahr!='' && produktionsjahr!=0">(<s:property value="produktionsjahr"/>)</s:if></i>
				</tv2:spacer>
			</font>
		</td>
		<c:set var="i">${i+1}</c:set>
		<c:if test="${i == 5}"><c:set var="i">0</c:set></tr></c:if>
	</s:iterator>
</table>

<s:if test="searchObj.rowsMax > 10">
	<div>
		<c:set var="rowCounter"><s:property value="searchObj.rowsTotal"/></c:set>
		<c:set var="maxResults"><s:property value="searchObj.rowsPerPage"/></c:set>
		<c:set var="currentPage"><s:property value="searchObj.currentPage"/></c:set>
		<tv2:pagebar rowCounter="${rowCounter}" maxResults="${maxResults}" currentPage="${currentPage}" extractResultInfo="true"/>
	</div>
</s:if>

