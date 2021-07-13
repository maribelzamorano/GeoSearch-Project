<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="name"		required="true" rtexprvalue="true"%>
<%@ attribute name="obligation"	required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="useMode"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="colspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>
<%@ attribute name="rowspan"	required="false" rtexprvalue="true" type="java.lang.Integer"%>

<jsp:doBody  var="resultBodyString" scope="request"/>
<%
if(obligation==null) obligation=false;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null)		body="";
if(useMode!=null)	mode=useMode;
%>

<td <%
	if(obligation)
	{
		if(body.trim().equals("0")) out.print(" class=\"obligation\"");
		out.print(" id=\""+name+"_cb_td\"");
	}
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	if(rowspan!=null) out.print(" rowspan=\""+rowspan+"\"");
%>>
<%
if(mode==1)
{
	if(obligation)
	{
		%>
		<script>
			TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields[TopdevUtil.objs["<%=ns%>"].tabs["<%=ajaxId%>"].obligationFields.length] = "<%=name%>_cb";
		</script>
		<%
	}

	%>
	<nobr>
		<input
			style="width:14px; height:15px; margin-bottom:0px; margin-left:0px;"
			class="topdev_checkbox"
			type="checkbox"
			value="1"
			name="<%=name%>_cb"
			id="<%=name%>_cb"
			onchange="if(this.checked) document.getElementById('<%=name%>').value='1'; else  document.getElementById('<%=name%>').value='0';"
			<%=body.equals("1")?"checked=\"true\"":""%>
			<%
			if(obligation)
			{
				if(body.length()<1) out.print(" class=\"obligation\"");
				out.print(" onclick=\"TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"')\" ");
			}
			else out.print(" onclick=\"TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"', true)\" ");
			 %>
			/>
		<input
			type="hidden"
			name="<%=name%>"
			id="<%=name%>"
			value="<%=body%>"/>
		<label for="<%=name%>_cb">
			<%= bas.getText(ns+".label-"+name) %>
		</label>
	</nobr>
<%
}
else if(body.trim().equals("1"))
{
	
	%>
		<img class="img_checkbox" src="<s:url value="/images/nothing.gif"/>" border="0"<%=" title=\""+bas.getText(ns, "img_info-checkbox")+"\""%>/>
	<%
}%>
</td>

