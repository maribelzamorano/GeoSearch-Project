<% boolean uploadForm = request.getAttribute("form_upload")!=null; %>
<div id="${ajaxId}_infoDiv">
	
</div>
<iframe style="display:none" src="javascript:false" name="${ajaxId}_frame"></iframe>
<form
	accept-charset="UTF-8"
	method="post"
	id="${ajaxId}_form"
	name="${ajaxId}_form"
	<%if(uploadForm) {%>
		action="<%= request.getAttribute("form_upload_url") %>"
		target="${ajaxId}_frame"
		enctype="multipart/form-data"
	<% } %>
	<c:if test="${not empty scriptOnSubmit}">onsubmit="${scriptOnSubmit}; return false;"</c:if>
	<c:if test="${doOnlySubmitIfThereAreNoObligations eq 'true'}">onsubmit="if(!document.getElementById('${ns}_button_save').disabled) document.getElementById('<s:property value="ajaxId"/>_form').submit(); else return false;"</c:if>
	>
<tui:js type="hideButtons">true</tui:js>
<input type="hidden" name="id"			value="<s:property value="id"/>"/>
<input type="hidden" name="id_entity"	value="<s:property value="id_entity"/>"/>
<input type="hidden" name="ns"			value="${ns}"/>
<input type="hidden" name="ajaxId"		value="${ajaxId}"/>
<input type="hidden" name="forwardUrl"	value="<%= request.getAttribute("form_forwardUrl") %>"/>

<c:set var="doOnlySubmitIfThereAreNoObligations">false</c:set>