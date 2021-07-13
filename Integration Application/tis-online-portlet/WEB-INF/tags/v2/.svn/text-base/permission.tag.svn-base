<%@ include file="../init-common.jsp" %>
<%@ tag import="com.topdev.service.client.BerechtigungClient"%>
<%@ tag body-content="scriptless" %>
<%@ attribute name="object" required="true" rtexprvalue="true" %>
<%@ attribute name="action" required="false" rtexprvalue="true" %>
<c:set var="userName" scope="request"><s:property value="userName"/></c:set>
<%
String userName = (String)request.getAttribute("userName");
String tObject = request.getServletPath().replaceAll("/",".").replaceFirst(".","");
tObject = tObject.substring(0, tObject.lastIndexOf("."));
tObject += "."+object;
final String permissionTagPrefix = "permission.tag_"+userName+"#";
boolean havePermission = false;
if(action==null) action="read";
if(action.equals("read"))			action=com.topdev.service.client.BerechtigungClient.ACTION_READ;
else if(action.equals("edit"))		action=com.topdev.service.client.BerechtigungClient.ACTION_EDIT;
else if(action.equals("insert"))	action=com.topdev.service.client.BerechtigungClient.ACTION_INSERT;
else if(action.equals("delete"))	action=com.topdev.service.client.BerechtigungClient.ACTION_DELETE;

try
{
	if(session.getAttribute(permissionTagPrefix+tObject)!=null)
		havePermission = (Boolean) session.getAttribute(permissionTagPrefix+tObject);
	else
	{
		havePermission = com.topdev.service.client.BerechtigungClient.checkPermissionForAction(userName, tObject, action);
		session.setAttribute(permissionTagPrefix+tObject, new Boolean(havePermission));
		System.out.println(":: Berechtigung für Objekt:"+tObject+" und Aktion:"+action+" als ["+havePermission+"] in Sitzung geladen.");
	}
}
catch(Exception ex) { havePermission = false; System.out.println("Permission-Tag-error:"+ex.toString()); }

if(havePermission)
{
	%><jsp:doBody/><%
}
%>