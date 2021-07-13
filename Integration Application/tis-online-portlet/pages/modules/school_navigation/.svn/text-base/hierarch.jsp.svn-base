<%@ include file="init.jsp" %>

<div class="school_search_navigation">
<div class="schoolname">
<s:push value="schoolEntry">
	<table cellspacing="0" cellpadding="0" >
		<tr>
		<td class="left"></td>
		<td class="schoolname">
			<s:if test="lastSchoolName!=null">
				<s:property value="lastSchoolName"/>
			</s:if>
			<s:else>
				<s:property value="CC_NAME_1_ORT"/>
			</s:else>
		</td>
		<td class="right">&nbsp;</td>
		</tr>
	</table>
</s:push>
</div>
<br/>
  <table width="100%" cellspacing="0" cellpadding="0">
<tr>
<td <% out.print("class=\"highlight\""); %> class="topdev_nav">
<a href="">
	<s:if test="tspm=='hierarch1'">Schultr&auml;ger</s:if>
	<s:else>Schulamt</s:else>
</a></td>
</tr>
</table>
<div class="topdev_nav_hierarch"></div>
<s:if test="lastSchoolId!=null">
	<div class="back"><br/><img src="<s:url value="/images/icons/portlet/back.gif"/>" title="zur&uuml;ck" border="0"/>
		<a class="topdev_link" href="../overview?tspi=<s:property value="lastSchoolId"/>">Zur&uuml;ck zur Schule</a>
	</div>
</s:if>
	