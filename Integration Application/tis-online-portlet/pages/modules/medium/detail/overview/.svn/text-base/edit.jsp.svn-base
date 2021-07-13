<%@ include file="init.jsp" %>
<%@ include file="/pages/lib/fragment/dialog/ok_abort-v2.jsp" %>
<tdl:var-set name="portletBackUrl">detail?tspi=<s:property value="tspi"/></tdl:var-set>
<% request.setAttribute("tabCount", new Integer(6)); %>

<div id="${ns}_infoDiv">
</div>
<script>
var currentAction = "";
var dirty = false;
function topdev_updateInfoLog(tHtml)
{
	document.getElementById("${ns}_infoDiv").innerHTML = tHtml;
}

function goToTab(tab, action, id)
{
	document.getElementById("${ns}_infoDiv").innerHTML = "";
	var url = "/tis-online-portlet/medium_detail_overview/tabs_edit.action?currentTab="+tab;
	try
	{
		url	+= "&"+Form.serialize(document.getElementById("${ns}_tab_form"));
	} catch(ex) {}
	if(action) url+="&action="+action;
	if(id) url+="&id="+id;

	updateDiv_ext = function()
	{
		var tAjaxId="${ns}_view"+tab;
		if(dirty) TopdevUtil.activateForm("${ns}", tAjaxId);
		if(currentAction!='edit') initTopdevTabBar();
	}
	TopdevUtil.updateDiv( "${ns}_tabs", url);
}

function initTopdevTab(pID, pX)
{
	var ns = "${ns}";
	var tabId = ns+"_view"+pID;
	TopdevUtil.objs[ns].tabIds[TopdevUtil.objs[ns].tabIds.length] = tabId;
	TopdevUtil.objs[ns].tabs[tabId]						= new Object();
	TopdevUtil.objs[ns].tabs[tabId].obligationFields	= pX?(new Array("hiddenEmptyField")):(new Array());
	TopdevUtil.objs[ns].tabs[tabId].id					= pID;
	TopdevUtil.objs[ns].tabs[tabId].hideButtons			= false;
}

function initTopdevTabBar()
{
	var tabIds = TopdevUtil.objs["${ns}"].tabIds;
	for(i2=0; i2<tabIds.length; i2++)
		TopdevUtil.ogCheckTab("${ns}", tabIds[i2]);
}
</script>
<div class="topdev_form">
	<h3>Medium bearbeiten</h3>
	<br/><br/>
	<div id="${ns}_tabs">
		<s:action name="tabs_edit" executeResult="true">
			<s:param name="tspi" value="tspi"/>
			<s:param name="tspm" value="tspm"/>
			<s:param name="vsid" value="vsid"/>
			<s:param name="mode" value="mode"/>
			<s:param name="mainObjectName" value="mainObjectName"/>
		</s:action>
	</div>
</div>
