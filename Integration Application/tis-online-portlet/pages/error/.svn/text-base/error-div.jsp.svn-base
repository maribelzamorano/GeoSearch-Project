<div id="errorDiv">
	<font color="red">
	Ein Fehler ist aufgetreten:<br/>
	<%
	if(request.getAttribute("error")!=null)
		out.print(request.getAttribute("error"));
	%>
	</font>
</div>
<script>
try
{
	top.frames.layer0.alertDialog(
		document.getElementById("errorDiv").innerHTML,
		3,
		true,
		";",
		400,
		170);
}
catch(e){}
</script>