<%@ include file="../init.jsp" %>
<%@ tag body-content="scriptless" %>
<%
if(bas.getRtErrors()!=null && bas.getRtErrors().size()>0)
{
	%>
	<ul>
		<s:iterator value="rtErrors">
			<li>
				<font color="red">
					<s:property/>
				</font>
			</li>
		</s:iterator>
	</ul>
	<%
}
%>