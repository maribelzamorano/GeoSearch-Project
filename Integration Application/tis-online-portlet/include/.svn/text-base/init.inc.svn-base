<%@ page contentType="text/html;charset=iso-8859-1" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld"	prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld"	prefix="logic"%>
<%@ taglib uri="/WEB-INF/topdev.tld"	prefix="ttl" %>
<logic:present parameter="dialogForm"><% request.setAttribute("dialogForm","true"); %></logic:present>
<html>
<head>
	<ttl:include file="default" type="css"/>

	<script>
		var homeURL = "<bean:write name="container" property="absoluteUrl"/>";
	</script>
	<ttl:include file="default" type="js"/>
	<logic:present name="dialogForm">
		<ttl:include file="pages/dialog/dialog" type="js"/>
		<script>
		var opener = top.frames.layer0.getDialogCaller(window);
//		top.frames.layer0.dialogCallerContext;
		var formDialog	=true;
		top.frames.layer0.setDialogTitle("<ttl:msg name="title" type="text"/>");
		</script>
	</logic:present>
	
	<script>

	function initExt()
	{
		//zum Überschreiben
	}
	
	<logic:notEqual parameter="mode" value="2">
	function init()
	{
		try
		{
			<logic:notPresent parameter="dialogForm">
				<logic:notEqual parameter="mode" value="2">
					obligation_create("cb_save");
				</logic:notEqual>
			</logic:notPresent>
			<logic:present parameter="dialogForm">
				if(document.getElementById("cb_ok"))
					obligation_create("cb_ok");
				else
					obligation_create("cb_save");
				if(window.title) parent.setDialogTitle(window.title);
			</logic:present>
		}
		catch(e){}

		try
		{
			initExt();
		}
		catch(e){}
	}
	</logic:notEqual>
	<logic:equal parameter="mode" value="2">
		function init() {}
	</logic:equal>
	</script>
</head>
<body onload="init()" <logic:present name="dialogForm">style="margin-right:5px"</logic:present>>
<iframe name="submitFrame" style="display:none;" src="javascript:false;"></iframe>