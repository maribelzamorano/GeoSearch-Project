<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/section_documents/documents-detail</tdl:var-set>

<s:if test="documentList.entryList.size > 0">
	<ul class="topdev_documents" style="padding-bottom:0px; margin-bottom:0px">
		<s:iterator value="complexEntryList" status="rowstatus">
		<tdl:var-set name="downloadURL">/download/virtual/<s:property value="name"/></tdl:var-set>
		<li>
			<a class="topdev_link"
				href="<tui:url>${downloadURL}</tui:url>&ANLA_ID=<s:property value="id_entity"/>"
				target="_blank">
				<tui:spacer maxWordLength="27"><s:property value="beschreibung"/></tui:spacer>
			</a>
			 (<s:property value="groesse"/>)
		</li>
		</s:iterator>
	</ul>
</s:if>

<s:if test="linkList.entryList.size > 0">
	<ul class="topdev_link_extern" style="padding-top:0px; margin-top:0px">
		<s:iterator value="complexLinkEntryList" status="rowstatus">
			<li><a class="topdev_link" href="<s:property value="url"/>" target="_blank"><s:property value="text"/></a></li>
		</s:iterator>
	</ul>
</s:if>