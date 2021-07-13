<%@ taglib prefix="s" uri="/struts-tags" %>
<s:if test="nullable=='true'"><option value=""></option></s:if>
<s:if test="compare_with_row!='DECODE'">
	<s:iterator value="elements" status="rowstatus">
		<option value="<s:property value="CODE"/>" <s:if test="value==CODE">selected="true"</s:if>><s:property value="DECODE"/></option>
	</s:iterator>
</s:if>
<s:if test="compare_with_row=='DECODE'">
	<s:iterator value="elements" status="rowstatus">
		<option value="<s:property value="CODE"/>" <s:if test="value==DECODE">selected="true"</s:if>><s:property value="DECODE"/></option>
	</s:iterator>
</s:if>
<%request.setAttribute("dropdownContent", "true");%>