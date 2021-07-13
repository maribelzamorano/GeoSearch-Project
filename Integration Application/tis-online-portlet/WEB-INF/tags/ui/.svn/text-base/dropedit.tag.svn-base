<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="name"	required="false" rtexprvalue="true"%>
<%@ attribute name="value"	required="false" rtexprvalue="true"%>
<%@ attribute name="notd"	required="false" rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="obligation"		required="false"	rtexprvalue="true" type="java.lang.Boolean"%>
<%@ attribute name="colspan"		required="false"	rtexprvalue="true" type="java.lang.Integer"%>

<%
if(notd==null)				notd=true;
if(name==null)	name	="";
if(value==null)	value	="";
if(obligation==null)		obligation=false;

if(!notd)
{
%>
<td <%
	if(obligation)
	{
		if(value==null || value.length()<1) out.print(" class=\"obligation\"");
		out.print(" id=\""+name+"_td\"");
	}
	if(colspan!=null) out.print(" colspan=\""+colspan+"\"");
	%>>
	<%
}
%>
<div style="position:relative; top:0px;" name="<%=name%>">
	<div class="topdev_dropedit1">
		<input
			<%if(obligation){%>
				onchange="TopdevUtil.ogCheck(this, '${ns}', '${ajaxId}');"
			<%
			} else out.print(" onchange=\"TopdevUtil.ogCheck(this, '"+ns+"', '"+ajaxId+"', true)\" ");
			%>
			onkeyup="this.onchange()"
			onblur="this.onchange()"
			class="topdev_dropedit1"
			type="text"
			name="<%=name%>"
			id="<%=name%>"
			value="<%=value%>"/>
	</div>
	<div class="topdev_dropedit2">
		<jsp:doBody/>
	</div>
</div>

<% if(!notd) { %></td><% } %>