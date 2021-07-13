<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ tag import="com.topdev.aa.lib.Message"%>
<%@ attribute name="type"		required="true" rtexprvalue="true"%>
<%@ attribute name="submit"		required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="id"			required="false" rtexprvalue="true"%>
<%@ attribute name="scope"		required="false" rtexprvalue="true"%>
<%@ attribute name="value"		required="false" rtexprvalue="true"%>
<%@ attribute name="disabled"	required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%
	if(type.equals("ok") && scope==null)	scope		= "tab";
	if(scope==null)							scope		= "portlet";
	if(submit==null)						submit		= false;
	if(disabled==null)						disabled	= false;
	if(type.equals("ok") || type.equals("save"))disabled	= true;
%>
<input
	type="<%=submit?"submit":"button"%>"
	<% if(type.equals("abort"))
	{
		%>onclick="TopdevUtil.tsp_dialog_request = function() { <jsp:doBody/>; }; TopdevUtil.showRequestDialog('${ns}', 'M&ouml;chten Sie wirklich abbrechen?<br/> Eventuell vorgenommene &Auml;nderungen gehen damit verloren.'); "<%
	}
	else { %>onclick="<%=(type.equals("ok") || type.equals("save"))?"window.location.hash='#top';":""%><jsp:doBody/>"<%} %>
	<%= disabled?"disabled=\"true\"":"" %>
	value="<%=	value!=null?Message.getText(ns+"#button_value-"+value):Message.getText(ns+"#button_value-"+type) %>"
	title="<%=	value!=null?Message.getText(ns+"#button_info-"+value):Message.getText(ns+"#button_info-"+type) %>"
	class="<%=	disabled?"portlet-form-button_disabled":"portlet-form-button" %>"
	<%
		String prefix = "";
		if(scope.equals("tab"))	prefix = ajaxId;
		else					prefix = ns;
		if(id!=null) out.print(" id=\""+id+"\"");
		else out.print(" id=\""+prefix+"_button_"+type+"\"");
	%>
/>
<%
//	out.print(" type=\""+type+"\"");
//	out.print(" id=\""+prefix+"_button_"+type+"\"");
%>