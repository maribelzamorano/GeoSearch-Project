<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort.jsp" %>
<script> var backUrl = "<tui:url action="true" windowState="normal">view</tui:url>"; </script>

<s:push value="mainObject">
	<form action="<tui:url action="true">detail_save</tui:url>" method="post"></form>
	<tui:tabBox tabCount="1" activeTabId="1" name="pts_tabbox">
		<script>
		function ${ns}sendCurrentPage(page) 
		{
			try
			{
				var t_f = document.getElementById("${ns}_form");
				t_f.page.value = page;
				t_f.submit()
			}
			catch(e) { }
		}
		</script>
		<tui:tab id="1" active="true">
			<s:action name="pts-list_edit" executeResult="true">
				<s:param name="tspi" value="tspi"/>
				<s:param name="tspm" value="tspm"/>
				<s:param name="vsid" value="vsid"/>
				<s:param name="mode" value="mode"/>
			</s:action>
		</tui:tab>
	</tui:tabBox>


</s:push>