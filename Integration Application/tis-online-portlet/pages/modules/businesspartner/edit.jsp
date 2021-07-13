<%@ include file="init.jsp" %>
<div id="tsp_portlet_div_main_${ns}">
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<tdl:var-set name="portletBackUrl">overview?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>
<s:push value="mainObject">
<c:set var="scriptOnSave">AjaxUtil.update('<tui:url>/businesspartner/save.action</tui:url>'+ '&ajaxId=<s:property value="ajaxId"/>&'+ Form.serialize(document.getElementById('${ns}_form')),'${ns}_info');</c:set>
	<script>
	function image_back()
	{
		TopdevUtil.tsp_dialog_request = function() { location.href="${portletBackUrl}" };
		TopdevUtil.showRequestDialog('${ns}', 'M&ouml;chten sie wirklich zur&uuml;ck in das Schulportr&auml;t wechseln? Eventuell vorgenommene &Auml;nderungen anderer Registerkarten gehen damit verloren.');
	}
	</script>

	<form action="<tui:url action="true">detail_save</tui:url>" method="post" id="${ns}_form" onsubmit="${scriptOnSave}; return false;">
	<input type="submit" style="width:0px; height:0px; max-width:0px; max-height:0px"/>
	
		<tui:tab id="1" virtual="true"><s:action name="common-form" executeResult="true"/></tui:tab>
		<br/><br/>
			
		<tui:tabBox tabCount="5" activeTabId="1" name="tabbox1" msgKey="mediacenter.tab">
			<tui:tab id="1" active="true">
				<s:action name="detail-form" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>
			</tui:tab>
			</form>
			<tui:tab id="2">
				<s:action name="schooltract-list_edit" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>				
			</tui:tab>
			<tui:tab id="3">
				<s:action name="address-list_edit" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>				
			</tui:tab>
			<tui:tab id="4">
				<s:action name="communication-list_edit" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>				
			</tui:tab>
			<tui:tab id="5">
				<s:action name="image-list_edit" executeResult="true">
					<s:param name="tspi" value="tspi"/>
					<s:param name="tspm" value="tspm"/>
					<s:param name="vsid" value="vsid"/>
					<s:param name="mode" value="mode"/>
				</s:action>				
			</tui:tab>
		</tui:tabBox>
		<script>
		function reloadTabs()
		{
			alert('sdf');
			var url1="<s:url action="detail-form"><s:param name="tspi" value="tspi"/><s:param name="tspm" value="tspm"/><s:param name="vsid" value="vsid"/><s:param name="mode" value="mode"/></s:url>";
			var url2="<s:url action="schooltract-list_edit"><s:param name="tspi" value="tspi"/><s:param name="tspm" value="tspm"/><s:param name="vsid" value="vsid"/><s:param name="mode" value="mode"/></s:url>";
			var url3="<s:url action="address-list_edit"><s:param name="tspi" value="tspi"/><s:param name="tspm" value="tspm"/><s:param name="vsid" value="vsid"/><s:param name="mode" value="mode"/></s:url>";
			var url4="<s:url action="communication-list_edit"><s:param name="tspi" value="tspi"/><s:param name="tspm" value="tspm"/><s:param name="vsid" value="vsid"/><s:param name="mode" value="mode"/></s:url>";
			var url5="<s:url action="image-list_edit"><s:param name="tspi" value="tspi"/><s:param name="tspm" value="tspm"/><s:param name="vsid" value="vsid"/><s:param name="mode" value="mode"/></s:url>";
			TopdevUtil.updateTab('<tdl:var name="ns"/>','tabbox1_view1',url1);
			TopdevUtil.updateTab('<tdl:var name="ns"/>','tabbox1_view2',url2);
			TopdevUtil.updateTab('<tdl:var name="ns"/>','tabbox1_view3',url3);
			TopdevUtil.updateTab('<tdl:var name="ns"/>','tabbox1_view4',url4);
			TopdevUtil.updateTab('<tdl:var name="ns"/>','tabbox1_view5',url5);
		}
		</script>
		
		<tui:buttonbar>
			<tui:button type="save" value="apply" submit="false">
				TopdevUtil.toggleDivLoading('${ns}_info', 'Die Daten werden gespeichert...');
				AjaxUtil.update(
					'<tui:url>/businesspartner/save.action</tui:url>&apply=true&ajaxId=<s:property value="ajaxId"/>&'+ Form.serialize(document.getElementById('${ns}_form')),
					'${ns}_info');</tui:button>

			<tui:button type="save" submit="false">${scriptOnSave}</tui:button>
					
			<tui:button type="abort">location.href='${portletBackUrl}';</tui:button>
		</tui:buttonbar>
</s:push>
</div>