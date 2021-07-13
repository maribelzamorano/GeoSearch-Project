<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ tag import="com.topdev.aa.lib.Message"%>
<%@ tag import="com.topdev.aa.object.MainObject"%>
<%@ tag import="java.util.Iterator"%>
<%@taglib prefix="tv2" tagdir="/WEB-INF/tags/v2" %>
<%@ attribute name="key" required="false" rtexprvalue="true"%>
<%@ attribute name="nobr"		required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="colspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="rowspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<jsp:doBody  var="resultBodyString" scope="request"/>
<%
if(nobr==null) nobr=false;

String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
if(key==null) key=body;
request.setAttribute("tKey", key);
MainObject mainObject = (MainObject)request.getAttribute("mainObject");


boolean haveError = false;
int errorPos = 0;
if(mainObject!=null)
{
	Iterator<String> it =  mainObject.getErrors().keySet().iterator();
	while(it.hasNext())
	{
		errorPos++;
		if(it.next().equals(key))
		{
			haveError = true;
			break;
		}
	}
}
%>
<td<%
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	if(rowspan!=null) out.print(" rowspan=\""+rowspan+"\"");
	if(mainObject!=null && mainObject.getErrors().containsKey(key))
		out.print(" class='error'");
	%>>
	<%if(nobr) out.print("<nobr>"); %>
	<%=Message.getText(ns+"#label-"+key)%><%= (errorPos>0 && haveError)?(" <sup>F"+errorPos+"</sup>"):"" %>
	<%if(nobr) out.print("</nobr>"); %>
</td>
