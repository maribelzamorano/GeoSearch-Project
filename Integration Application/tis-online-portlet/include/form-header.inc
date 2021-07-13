<form
	<logic:present name="urlSave">action="<bean:write name="container" property="absoluteUrl"/><bean:write name="urlSave"/>"</logic:present>
	target="submitFrame"
	method="post"
	<logic:present name="uploadForm">enctype="multipart/form-data"</logic:present>
	>
<input type="hidden" name="modified" value="0"/>
<logic:present name="dialogForm">
	<table cellspacing=0 cellpadding=0 border="0" width="100%" style="width:100%; padding-right:7px;">
</logic:present>
<logic:notPresent name="dialogForm">
	<table cellspacing=0 cellpadding=0 border="0" width="774" style="width:774px;">
</logic:notPresent>