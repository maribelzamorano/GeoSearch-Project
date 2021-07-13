<%@ include file="init.jsp" %>
<s:push value="mainObject">

<table class="topdev_view" width="100%" border="0">
<%--________________________________________________________________________________________________--%>
<s:if test="%{intention}">
<s:push value="intention">
<s:if test="teilnahme == 1"><tr><td class="topdev_title_gray_first" colspan="3"><tui:msg key="Entwicklungsvorhaben" type="heading"/></td></tr>
<tr>
	<td colspan="3">
		<table class="topdev_view" width="100%" cellspacing="0">
			<colgroup>
				<col>
				<col width="200px">
			</colgroup>
			<s:if test="beschluss != null">
			<tr>
				<td class="space left" colspan="2">
					<tui:msg key="beschluss1"/>
					<s:property value="beschluss"/>
					<tui:msg key="beschluss2"/>
				</td>
			</tr>
			</s:if>
			<s:if test="expertenbesuch != null">
			<tr>
				<td class="space_left" colspan="2">
					<tui:msg key="expertenbesuch" type="label"/>
					<s:property value="expertenbesuch"/>
				</td>
			</tr>
			</s:if>
			<s:if test="wiederholungsbesuch != null">
			<tr>
				<td class="space_left" colspan="2">
					<tui:msg key="wiederholungsbesuch" type="label"/>
					<s:property value="wiederholungsbesuch"/>
				</td>
			</tr>
			</s:if>
			<s:if test="abschluss != null">
			<tr>
				<td class="space_left" colspan="2">
					<tui:msg key="abschluss1"/>
					<s:property value="abschluss"/>
					<tui:msg key="abschluss2"/>
				</td>
			</tr>
			</s:if>
			<tr>
				<td colspan="2">
					
				</td>
			</tr>
		</table>
		<br/>
	</td>
</tr>
</s:if>
</s:push>
</s:if>
<%--________________________________________________________________________________________________--%>
	<s:if test="emphasisList.entryList.size>0">
		<tr><td class="topdev_title_gray_first" colspan="3"><tui:msg key="Schwerpunkte" type="heading"/></td></tr>
		<tr>
			<td colspan="3">
				<s:action name="emphasis-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action><br/>
			</td>
		</tr>
	</s:if>
<%--________________________________________________________________________________________________--%>
	<s:if test="instrumentList.entryList.size>0">
		<tr><td class="topdev_title_gray_first" colspan="3"><tui:msg key="Instrumente" type="heading"/></td></tr>
		<tr>
			<td colspan="3">
				<s:action name="instrument-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
				<br/>
			</td>
		</tr>
	</s:if>
<%--________________________________________________________________________________________________--%>
	<%--
		<s:iterator value="emphasisSortList">
			<tr><td class="topdev_title_gray_first" colspan="3"><s:property value="value"/></td></tr>
			<tr><td colspan="3"><s:action name="emphasis-list_view_filter" executeResult="true"><s:param name="filter"><s:property value="key"/></s:param></s:action><br/></td></tr>	
		</s:iterator>
	--%>	

	
<%--________________________________________________________________________________________________--%>

<s:if test="%{intention}">
<s:push value="intention">
	<s:if test="teilnahme == 1 || instrumentList.entryList.size>0 || emphasisList.entryList.size>0">
			<tr height="50px" valign="bottom"> 
				<td class="space_left" ></td>
				<td class="button" align="right">
					<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/school_evolution/print.action</tui:url>')"/>
				</td>
			</tr>
			<tr><td class="change" colspan="3"><tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/></td></tr>
	</s:if>	
	<s:else>
			<tr><td colspan="3"><tui:msg key="keine_daten" type="label"/></td></tr>
	</s:else>
</s:push>
</s:if>
	<tr>
		<td colspan="3">
			<tui:icon type="editViewAction"/>
		</td>	
	</tr>			
</table>

</s:push>