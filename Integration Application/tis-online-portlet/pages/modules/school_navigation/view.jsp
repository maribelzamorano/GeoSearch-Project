<%@ include file="init.jsp" %>
<c:set var="anwf" scope="request">${(LIFERAY_SHARED_friendlyURL eq '/web/guest/media/mediacenter/overview')?'media':'school'}</c:set>

<div class="school_search_navigation">
<s:push value="schoolEntry">
<div class="schoolname">
	<table cellspacing="0" cellpadding="0" >
		<tr>
		<td class="left"></td>
		<td class="schoolname"><s:property value="CC_NAME_1_ORT"/></td>
		<td class="right">&nbsp;</td>
		</tr>
	</table>
</div>
</s:push>
<br/>

<table width="100%" cellspacing="0" cellpadding="0">
<tdl:var-set name="t_opt">overview</tdl:var-set>			<tdl:var-set name="t_bez">Auf einen Blick</tdl:var-set>				<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
<c:if test="${anwf ne 'media'}">
	<tdl:var-set name="t_opt">personal_resources</tdl:var-set>	<tdl:var-set name="t_bez">Personelle Ressourcen</tdl:var-set>		<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">neuter_resources</tdl:var-set>	<tdl:var-set name="t_bez">S&auml;chliche Ressourcen</tdl:var-set>	<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">school_evolution</tdl:var-set>	<tdl:var-set name="t_bez">Schulentwicklung</tdl:var-set>			<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">contributer</tdl:var-set>			<tdl:var-set name="t_bez">Mitwirkung</tdl:var-set>					<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">school_life</tdl:var-set>			<tdl:var-set name="t_bez">Schulleben</tdl:var-set>					<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">learner_structure</tdl:var-set>	<tdl:var-set name="t_bez">Sch&uuml;lerstrukturdaten</tdl:var-set>	<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">cooperation</tdl:var-set>			<tdl:var-set name="t_bez">Kooperationen</tdl:var-set>				<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
	<tdl:var-set name="t_opt">documents</tdl:var-set>			<tdl:var-set name="t_bez">Dokumente / Links </tdl:var-set>					<tr><td class="${option==t_opt?'highlight':'topdev_nav'}"><a href="${t_opt}?tspi=${tspi}">${t_bez}</a></td></tr>
</c:if>
</table>

<br/>
<div class="back">

	<img src="<s:url value="/images/icons/portlet/back.gif"/>" title="zur&uuml;ck" border="0"/>
	<c:if test="${anwf ne 'media'}">
		<s:if test="${option=='overview'}">
			&nbsp;<a class="topdev_link" href="/web/guest/schools">Zur&uuml;ck zur &Uuml;bersicht</a>
		</s:if>
		<s:else>
			&nbsp;<a class="topdev_link" href="overview?tspi=${tspi}">Zur&uuml;ck</a>
		</s:else>
	</c:if>
	<c:if test="${anwf eq 'media'}">
		&nbsp;<a class="topdev_link" href="../mediacenter">Zur&uuml;ck</a>
	</c:if>
</div>


</div>