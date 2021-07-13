<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="name"		required="true" rtexprvalue="true"%>
<%@ attribute name="obligation"	required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="width"		required="false" rtexprvalue="true"%>
<%@ attribute name="colspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="rowspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="maxlength"	required="false" rtexprvalue="true" type="java.lang.Integer"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
if(obligation==null) obligation=false;
if(maxlength==null) maxlength=1000;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
%>

<td<%
	if(obligation)
	{
		if(body.length()<1) out.print(" class=\"obligation\"");
		out.print(" id=\""+name+"_td\"");
	}
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	if(rowspan!=null) out.print(" rowspan=\""+rowspan+"\"");
	%>>
	<%
	if(obligation && mode==1)
	{
		%>
		<script>
			TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields[TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields.length] = "<%=name%>";
		</script>
		<%
	}
	%>
	<input type="file" style="height:18px; border: 1px solid #7F9DB9; <%=width!=null?("width:"+width):""%>;" name="<%=name%>" id="<%=name%>" maxlength="<%=maxlength %>" value="<%= body %>"<%
	if(obligation && mode==1)
	{
		if(body.length()<1) out.print(" class=\"obligation\"");
		out.print(" onkeyup=\"TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"')\" ");
		out.print(" onchange=\"TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"')\" ");
	}
	out.print(" title=\""+bas.getText(ns, "field_info-"+name)+"\"");
	%>/>
</td>
