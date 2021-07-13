<%@ include file="../init-v2.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ tag import="com.topdev.aa.lib.Message"%>
<%@ attribute name="name"			required="true"		rtexprvalue="true"%>
<%@ attribute name="labelname"		required="false"	rtexprvalue="true"%>
<%@ attribute name="content"		required="false"	rtexprvalue="true"%>
<%@ attribute name="value"			required="false"	rtexprvalue="true"%>
<%@ attribute name="p1"				required="false"	rtexprvalue="true"%>
<%@ attribute name="p2"				required="false"	rtexprvalue="true"%>
<%@ attribute name="onchange"		required="false"	rtexprvalue="true"%>
<%@ attribute name="style"			required="false"	rtexprvalue="true"%>
<%@ attribute name="preload"		required="false"	rtexprvalue="true"%>
<%@ attribute name="anwf"			required="false"	rtexprvalue="true"%>
<%@ attribute name="obligation"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="parameter"		required="false"	rtexprvalue="true"%>
<%@ attribute name="styleClass"		required="false"	rtexprvalue="true"%>
<%@ attribute name="colspan"		required="false"	rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="nullable"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="notd"			required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="compareWithRow"	required="false"	rtexprvalue="true"%>
<%@ attribute name="serviceName"	required="false"	rtexprvalue="true"%>
<%@ attribute name="readonly"		required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="sublistName"	required="false" rtexprvalue="true"%>
<%@ attribute name="tdalign"		required="false" rtexprvalue="true"%>


<%
if(serviceName!=null)		preload = serviceName;
if(compareWithRow==null)	compareWithRow = "CODE";
if(notd==null)				notd=false;
if(nullable==null)			nullable=true;
if(obligation==null)		obligation=false;
if(readonly==null)			readonly=false;
if(labelname==null)			labelname=name+"_view";
//if(obligation) nullable=false;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";

if(!notd)
{
%>

<td<%
	if(tdalign!=null) out.print(" align=\""+tdalign+"\"");

	if(obligation)
	{
		if(value==null || value.length()<1) out.print(" class=\"obligation\"");
		out.print(" id=\""+name+"_td\"");
	}
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	%>>
	<%
}
if(obligation && mode==1)
{
	%>
	<script>
		TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields[TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields.length] = "<%=name%>";
	</script>
	<%
}
%>
<select
	<% if(readonly) out.print("disabled=\"true\""); %>
	<%=style!=null?("style=\""+style+"\""):"" %>
	<%=styleClass!=null?("class=\""+styleClass+"\""):"" %>
	id="<%=name%>"
	name="<%=name%>"
	onfocus="if(currentTr) currentSelectTrIndex = currentTr.rowIndex;"
	onmousedown="TopdevUtil.dropdown(this,'<%=parameter%>',<%=nullable%>);"<%
if(obligation && mode==1)
{
	if(body.length()<1) out.print(" class=\"obligation\"");
	if(onchange==null) out.print(" onchange=\"document.getElementById('"+labelname+"').value=this.options[this.selectedIndex].text; TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"'); " + (sublistName!=null?"TopdevUtil.setModifiedEntry('"+ajaxId+"','"+sublistName+"');":"") + "\" ");
}
else if(onchange==null) out.print(" onchange=\"document.getElementById('"+labelname+"').value=this.options[this.selectedIndex].text; TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"', true); "+ (sublistName!=null?"TopdevUtil.setModifiedEntry('"+ajaxId+"','"+sublistName+"');":"") +"\" ");
if(onchange!=null)  out.print(" onchange=\""+onchange+"\" ");
out.print(" title=\""+Message.getText(ns+"#field_info-"+name)+"\"");
%>>
<% 
if(preload==null)
{
	%>
	<%request.setAttribute("dropdownContent", null);%>
	<jsp:doBody/>
	<%
	if(request.getAttribute("dropdownContent")==null)
	{
		if(value!=null)	out.print("<option selected=\"true\" value=\""+value+"\">"+((content==null)?value:content)+"</option>");
		else if(nullable && !obligation)	out.print("<option value=\"\"></option>");
	}
}
else
{
	%>
	<s:action name="dropdown-content" namespace="/ajax" executeResult="true">
		<s:param name="mode"><%=mode%></s:param>
		<s:param name="TBSH"><%=preload%></s:param>
		<s:param name="value"><%=value%></s:param>
		<s:param name="nullable"><%=nullable%></s:param>
		<s:param name="compare_with_row"><%=compareWithRow%></s:param>
		<%if(anwf!=null) { %><s:param name="ANWF"><%=anwf%></s:param><%} %>
		<%if(p1!=null) { %><s:param name="p1"><%=p1%></s:param><%} %>
		<%if(p2!=null) { %><s:param name="p2"><%=p2%></s:param><%} %>
		<%if(serviceName!=null) { %><s:param name="serviceClientClass"><%=serviceName%></s:param><%} %>
	</s:action>
	<%
}
%>

</select>
<input type="hidden" name="<%=labelname%>" id="<%=labelname%>" value="<%=((content==null)?"":content)%>"/>
<% if(!notd) { %></td><% } %>
