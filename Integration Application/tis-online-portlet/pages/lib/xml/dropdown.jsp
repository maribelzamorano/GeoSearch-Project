<?xml version="1.0"?>
<%@ taglib prefix="s" uri="/struts-tags" %>
<root targetElement="<s:property value="targetElement"/>">
<s:iterator value="elements" status="rowstatus"><option value="<s:property value="CODE"/>"><s:property value="DECODE"/></option></s:iterator>
</root>