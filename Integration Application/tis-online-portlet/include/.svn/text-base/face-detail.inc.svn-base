<%@ page contentType="text/html;charset=iso-8859-1" language="java"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld"	prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-html.tld"	prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld"	prefix="logic"%>
<%@ taglib uri="/WEB-INF/topdev.tld"		prefix="ttl" %>
<html>
	<head>
		<title></title>
		<html:base/>
		<script><jsp:include flush="true" page="/resources/javascript/js-common.jsp"/></script>
		<ttl:include file="js-common" type="js"/>
		<ttl:include file="modules/face" type="js"/>
		<script>
		function registerFrames()
		{
			top.frames.head		=window.head;
			top.frames.header	=window.header;
			top.frames.view		=window.view;
			top.frames.face		=window;
		}
		
		function initExt()
		{
			registerFrames();
		}
		
		</script>
	</head>

	<frameset id="fset" rows="30,*,40" border="0" framespacing="0" frameborder="0" onload="init()">
		<frame name="head" 		src="<bean:write name="container" property="absoluteUrl"/>/detail-head.do"	scrolling="no" noresize>
		<frame name="view"		scrolling="auto">
		<frame name="header"	src="<bean:write name="container" property="absoluteUrl"/><bean:write name="faceUrl"/>"	scrolling="no" noresize>
	</frameset>

<body onload="init()">
</body>
</html>