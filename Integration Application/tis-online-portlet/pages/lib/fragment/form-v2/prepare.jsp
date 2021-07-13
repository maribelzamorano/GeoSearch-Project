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
	>
<tv2:js type="hideButtons">true</tv2:js>
<input type="hidden" name="id"			value="<s:property value="id"/>"/>
<input type="hidden" name="id_entity"	value="<s:property value="id_entity"/>"/>
<input type="hidden" name="ns"			value="${ns}"/>
<input type="hidden" name="ajaxId"		value="${ajaxId}"/>
<input type="hidden" name="forwardUrl"	value="<%= request.getAttribute("form_forwardUrl") %>"/>