<%@ include file="init.jsp" %>
<div id="tsp_portlet_div_main_${ns}">
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>


<s:push value="mainObject">
<table class="topdev_view" width="100%" cellspacing="0">
	<s:iterator value="documentSortList">
		<tr>
			<td class="topdev_title_gray_first" colspan="3"><s:property value="decode"/></td>
		</tr>
		<tr>
			<td colspan="3">
				<s:action name="document-list_view_filter" executeResult="true">
					<s:param name="filter"><s:property value="code"/></s:param>
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action><br/>
			</td>
		</tr>	
	</s:iterator>
	
	<s:if test="LinkList.entryList.size > 0">
		<tr>
			<td class="topdev_title_gray_first" colspan="3">Links</td>
		</tr>
		<tr>
			<td colspan="3">
				<s:action name="link-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action><br/>
			</td>
		</tr>	
	</s:if>

	<s:if test="LinkList.entryList.size>0 || DocumentList.entryList.size>0" >
		<tr height="50px" valign="bottom"> 		
			<td class="button" align="right">
				<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/documents/print.action</tui:url>')"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			</td>
			<td class="change">

			</td>
		</tr>
	</s:if>

	<s:if test="DocumentList.entryList.size==0 && LinkList.entryList.size==0 ">
		<tr>
			<td colspan="2"><tui:msg key="keine_daten" type="label"/>
			</td>
		</tr>
	</s:if>
	<tr>
		<td colspan="2">
			<tui:icon type="editViewAction"/>
		</td>
		<td class="change">
		</td>
		
	</tr>
</table>	
</s:push>
</div>


	

	


