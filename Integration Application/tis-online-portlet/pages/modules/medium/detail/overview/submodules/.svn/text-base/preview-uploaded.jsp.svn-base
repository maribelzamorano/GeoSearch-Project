<%@ include file="../init_ns.jsp" %>
<%@ include file="/pages/lib/init/init.jsp" %>
<html>
<body onload="init()">

<div id="errorDiv"><tv2:errors/></div>

<script>
//alert("aa22 "+document.getElementById("errorDiv").innerHTML);

function init()
{
	<s:if test="errors.size>0">
		try
		{
			parent.document.getElementById("topdev_tab_head_errors").innerHTML=document.getElementById("errorDiv").innerHTML;
			//parent.topdev_updateInfoLog(document.getElementById("errorDiv").innerHTML);
		}
		catch(e) {}
	</s:if>
	<s:else>
/*		parent.document.getElementsByName("previewImageId")[0].value = "<s:property value="previewImageId"/>";
		parent.topdev_updateInfoLog("<font color='green'>Das Vorschaubild wurde erfolgreich hochgeladen.<br/>Nach einem Virenscan steht es zur Anzeige zur Verf&uuml;gung.<br/>Dies kann bis zu 30 Minuten dauern.</font>");
		parent.document.getElementById("preview_image_upload_table").style.display="none";
		parent.document.getElementById("preview_image_delete_table").style.display="inline";*/
		parent.goToTab(7, 'uploaded');
	</s:else>
}
</script>

</body>