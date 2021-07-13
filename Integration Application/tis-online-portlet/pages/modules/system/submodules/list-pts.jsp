<%@ include file="init.jsp" %>
<script>
function ptsAction(GEPA_ID, id)
{
	var url = '<tui:url>/system/pts-list_edit.action</tui:url>&vsid=<s:property value="vsid"/>&mode=1&tspi=1';
	//alert(url);
	
	//return;
	if(GEPA_ID)	url += '&GEPA_ID='+GEPA_ID+'&id='+id+'&ajaxId=${ajaxId}&page=1';
	else		url += '&preserve=true';
	TopdevUtil.updateTab('${ns}','${ajaxId}',url);
}
</script>
<form id="${ns}_form" name="${ns}_form" method="post" onsubmit="return false;">
	<input type="hidden" name="page" value="1"/>
	<s:if test="GEPA_ID==null">
		<s:push value="searchForm">
			<table class="topdev_form">
				<colgroup>
					<col/>
					<col width="70px"/>
					<col/>
					<col width="70px"/>
				</colgroup>
				<tr>
					<td colspan="4">
						<i><tui:msg key="such_hinweis" type="label"/></i>
					</td>
				</tr>
				<tr>
					<tui:fieldlabel key="von"/>
					<tui:textfield  name="PTS_VON" maxlength="10"><s:property value="von"/></tui:textfield>
					<tui:fieldlabel key="bis"/>
					<tui:textfield  name="PTS_BIS" maxlength="10"><s:property value="bis"/></tui:textfield>
				</tr>
				<tr>
					<td colspan="4" class="buttonbar" align="right">
						<tui:button type="clear">
							document.getElementById('${ns}_form').PTS_VON.value='';
							document.getElementById('${ns}_form').PTS_BIS.value='';
						</tui:button>
						<tui:button type="search" submit="true">
							var url = '<tui:url>/system/pts-list_edit.action</tui:url>&' + Form.serialize(document.getElementById('${ns}_form'));
							TopdevUtil.updateTab('${ns}','${ajaxId}',url);
						</tui:button>
					</td>
				
				</tr>
			</table>
		</s:push>
	</s:if>
	<s:else>
		<s:push value="entry">
			<h2><s:property value="schulbezeichnung"/><br/></h2>
			<tui:msg key="schulnummer" type="label"/> <s:property value="schulnummer"/><br>
		</s:push>
	</s:else>
</form>
<br/>
<s:if test="complexList.entryList.size>0">
	<tdl:var-set name="rowCounter"><s:property value="complexList.rowCounter"/></tdl:var-set>
	<tdl:var-set name="maxResults"><s:property value="complexList.maxResults"/></tdl:var-set>
	<tdl:var-set name="currentPage"><s:property value="complexList.page"/></tdl:var-set>
	<tui:pagebar rowCounter="${rowCounter}" maxResults="${maxResults}" currentPage="${currentPage}"/>
		<tdl:var-set name="actionURL">/system/pts-detail</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/complex/body.jsp" %>
	<tui:pagebar rowCounter="${rowCounter}" maxResults="${maxResults}" currentPage="${currentPage}"/>
</s:if>

<s:if test="GEPA_ID!=null">
	<ul class="topdev_link_intern">
		<li id="topdev_icon_schulportrait">
			<a class="topdev_link" href="javascript:TopdevUtil.openEntry('schools','overview','<s:property value="GEPA_ID"/>')">
				Zum Schulportr&auml;t
			</a>
		</li>
	</ul>

	<tui:buttonbar>
		<tui:button type="back">ptsAction();</tui:button>
	</tui:buttonbar>
</s:if>
<s:else>
	<tui:buttonbar>
		<tui:button type="back">location.href=backUrl;</tui:button>
	</tui:buttonbar>
</s:else>