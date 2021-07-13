<%@ include file="init.jsp" %>
<s:push value="mainObject">
<table class="topdev_view" width="100%" border="0">
<tdl:var-set name="topdev_ul_layout">1</tdl:var-set>
<s:if test="%{contestList}">
	<s:if test="contestList.entryList.size>0">
		<tr>
			<td colspan="3" class="topdev_title_gray">
				<tui:msg key="attent_contest" type="label"/>
			</td>
		</tr>
		<tr>
			<td colspan="3">
				<table width="100%" class="topdev_hitlist_head" cellpadding="0" cellspacing="1">
					<s:iterator value="contestSortList">
						<tr class="row_odd">
							<td class="first">
								<b><s:property value="decode"/></b>
							</td>
						</tr>
						<tr>
							<td class="first">
								<s:action name="contest-list_view_filter" executeResult="true">
									<s:param name="tspi" value="tspi"/>
									<s:param name="tspm" value="tspm"/>
									<s:param name="vsid" value="vsid"/>
									<s:param name="mode" value="mode"/>
									<s:param name="filter"><s:property value="code"/></s:param>
								</s:action>
							</td>
						</tr>
					</s:iterator>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="3">	&nbsp;	
			</td>
		</tr>	
	</s:if>
</s:if>
<tdl:var-set name="topdev_ul_layout">0</tdl:var-set>
<s:if test="%{offerList}">
	<s:if test="offerList.entryList.size>0">
		<tr>
			<td class="topdev_title_gray" colspan="3">
					F&#246;rderangebote
			</td>
		</tr>
		<tr>	
			<td colspan="3">
				<s:action name="offer-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
			</td>
		</tr>
		<tr>
			<td colspan="3">	&nbsp;	
			</td>
		</tr>
	</s:if>
</s:if>
<s:if test="%{projectList}">
	<s:if test="projectList.entryList.size>0">
		<tr>
			<td class="topdev_title_gray" colspan="3">
				Schuleigene Projekte
			</td>
		</tr>	
		<tr>
			<td colspan="3">
				<s:action name="project-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>				
			</td>
		</tr>
		<tr>
			<td colspan="3">		&nbsp;
			</td>
		</tr>	
	</s:if>
</s:if>
<s:if test="%{traditionList}">
	<s:if test="traditionList.entryList.size>0">	
		<tr>
			<td class="topdev_title_gray" colspan="3">
				Schultraditionen
			</td>
		</tr>	
		<tr>
			<td colspan="3">
				<s:action name="tradition-list_view" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
			</td>		
		</tr>
	</s:if>
</s:if>
	<tr>
		<td colspan="3">		&nbsp;
		</td>
	</tr>
<s:if test="projectList.entryList.size>0 || traditionList.entryList.size>0 || offerList.entryList.size>0 || contestList.entryList.size>0" >
	<tr height="50px" valign="bottom"> 
		<td colspan="2"></td>
		<td class="button" align="right">
			<input type="button"	class="topdev_button_print" value="Drucken"	 onclick="window.open('<tui:url>/school_life/print.action</tui:url>')"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		</td>	
		<td class="change">			
			<tui:msg key="change" type="label"/>&nbsp;<s:property value="pts"/>			
		</td>	
	</tr>
</s:if>
<s:else><tr><td colspan="3"><tui:msg key="keine_daten" type="label"/></td></tr>
</s:else>
	<tr>
		<td colspan="2">
			<tui:icon type="editViewAction"/>
		</td>	
		<td class="change">
		</td>	
	</tr>
</table>
</s:push>
