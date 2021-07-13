<div style="width:754px">
	<tv2:buttonbar>
		<tv2:button type="save">goToTab('${currentTab}','portlet_save')</tv2:button>
		<tv2:button type="abort">location.href='<s:if test="mainObject.bobj.id==0">/web/guest/media</s:if><s:else>${portletBackUrl}</s:else>';</tv2:button>
	</tv2:buttonbar>
</div>