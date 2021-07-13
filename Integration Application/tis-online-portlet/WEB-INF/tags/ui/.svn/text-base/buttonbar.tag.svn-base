<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%@ attribute name="scope"		required="false" rtexprvalue="true"%>

<%
String id=ajaxId;
if(scope==null) scope="portlet";
if(scope.equals("portlet")) id = ns+"_buttonbar";

%>

<div align="right">
	<div id="<%=id%>">
	<table class="topdev_form" >
		<tr>
			<td>
				<jsp:doBody/>
				</td>
			</tr>
		</table>
		</div>
	</div>
