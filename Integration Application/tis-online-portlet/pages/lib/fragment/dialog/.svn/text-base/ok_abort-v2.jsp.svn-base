<%
if(request.getAttribute("topdev_dialog_msg")==null)
		request.setAttribute("topdev_dialog_msg", "Wollen Sie den ausgew&auml;hlten Datensatz wirklich l&ouml;schen?");
%>

<div id="tsp_portlet_div_request_${ns}" style="display:none">
	<center>
		<span  id="tsp_portlet_div_request_text_${ns}">
			${topdev_dialog_msg}
		</span>
		<br/><br/>
		<table class="topdev_form"><tr><td class="buttonbar">
			<tv2:button type="yes">try { TopdevUtil.tsp_dialog_request('ok','${ns}'); } catch(e){ alert(e); }; Liferay.Popup.close(this);</tv2:button>
			<tv2:button type="no">Liferay.Popup.close(this);</tv2:button>
		</td></tr></table>
	</center>
</div>
