<%@ include file="/pages/lib/init/init.jsp" %>
<tdl:var-set name="portletBackUrl">detail?tspi=<s:property value="tspi"/></tdl:var-set>
<script> var backUrl = "${portletBackUrl}"; </script>
<c:if test="${mainObject.currentTab != 7}">
	<form id="${ns}_tab_form" action="">
</c:if>
<c:if test="${mainObject.currentTab == 7}">
<form
	accept-charset="UTF-8"
	method="post"
	id="${ns}_tab_form"
	name="${ns}_form"
	action="<s:url value="/medium_detail_overview/previewUpload.action"/>"
	target="${ns}_submit_frame"
	enctype="multipart/form-data">
</c:if>
<input type="hidden" name="previousTab" value="${mainObject.currentTab}"/>
<input type="hidden" name="tspi" value="<s:property value="tspi"/>"/>
<input type="hidden" name="tspm" value="<s:property value="tspm"/>"/>
<input type="hidden" name="vsid" value="<s:property value="vsid"/>"/>
<input type="hidden" name="mode" value="<s:property value="mode"/>"/>
<input type="hidden" name="mainObjectName" value="${mainObject.name}"/>
<input type="hidden" id="isIncompleteTab1" name="isIncompleteTab1" value="${mainObject.isIncompleteTab1}"/>
<input type="hidden" id="isIncompleteTab2" name="isIncompleteTab2" value="${mainObject.isIncompleteTab2}"/>
<input type="hidden" id="isIncompleteTab3" name="isIncompleteTab3" value="${mainObject.isIncompleteTab3}"/>
<input type="hidden" id="isIncompleteTab4" name="isIncompleteTab4" value="${mainObject.isIncompleteTab4}"/>
<input type="hidden" id="isIncompleteTab5" name="isIncompleteTab5" value="${mainObject.isIncompleteTab5}"/>
<input type="hidden" id="isIncompleteTab6" name="isIncompleteTab6" value="${mainObject.isIncompleteTab6}"/>
<input type="hidden" id="isIncompleteTab7" name="isIncompleteTab7" value="${mainObject.isIncompleteTab7}"/>
<script>
	dirty = ${mainObject.bobj.dirty};
	var ns = "${ns}";
	TopdevUtil.objs[ns]			= new Object();
	TopdevUtil.objs[ns].tabs	= new Array();
	TopdevUtil.objs[ns].og		= true;			//noch pflichtfelder unausgefüllt?
	TopdevUtil.objs[ns].tabIds	= new Array();
	TopdevUtil.namespaces[TopdevUtil.namespaces.length] = ns;

	currentAction = '<s:property value="action"/>';
	initTopdevTab(1, ${mainObject.currentTab}==1?false:${mainObject.isIncompleteTab1});
	initTopdevTab(2, ${mainObject.currentTab}==2?false:${mainObject.isIncompleteTab2});
	initTopdevTab(3, ${mainObject.currentTab}==3?false:${mainObject.isIncompleteTab3});
	initTopdevTab(4, ${mainObject.currentTab}==4?false:${mainObject.isIncompleteTab4});
	initTopdevTab(5, ${mainObject.currentTab}==5?false:${mainObject.isIncompleteTab5});
	initTopdevTab(6, ${mainObject.currentTab}==6?false:${mainObject.isIncompleteTab6});
	initTopdevTab(7, ${mainObject.currentTab}==7?false:${mainObject.isIncompleteTab7});


	var popup001;
	function selectEntrySchlagworte(ajaxId, listName, ns)
	{
		var url = '/tis-online-portlet/medium_detail_overview/'+listName+'.action?sublistName='+listName+'&ajaxId='+ajaxId+'_'+listName;
		popup001 = Liferay.Popup( { title: "Auswahl", message: document.getElementById(ajaxId+'_'+listName+'_select_box').innerHTML, modal: true, width:300, height:460 } );
		if(document.getElementById(ajaxId+'_'+listName+'_select_box_loaded').value=="0") AjaxUtil.update(url, popup001);
		document.getElementById(ajaxId+'_'+listName+'_select_box_loaded').value = "1";
		TopdevUtil.objs[ns].portletModified = true;
		TopdevUtil.objs[ns].tabs[ajaxId].modified = true;
		TopdevUtil.ogCheckTab(ns, ajaxId);
	}
	function selectEntrySachgebiete(ajaxId, listName, ns)
	{
		var url = '/tis-online-portlet/medium_detail_overview/'+listName+'.action?sublistName='+listName+'&ajaxId='+ajaxId+'_'+listName;
		popup001 = Liferay.Popup( { title: "Auswahl", message: document.getElementById(ajaxId+'_'+listName+'_select_box').innerHTML, modal: true, width:600, height:460 } );
		if(document.getElementById(ajaxId+'_'+listName+'_select_box_loaded').value=="0") AjaxUtil.update(url, popup001);
		document.getElementById(ajaxId+'_'+listName+'_select_box_loaded').value = "1";
		TopdevUtil.objs[ns].portletModified = true;
		TopdevUtil.objs[ns].tabs[ajaxId].modified = true;
		TopdevUtil.ogCheckTab(ns, ajaxId);
	}
	function kontrolliertesschlagwort_liste_tf7(code, obj)
	{
		listName = 'kontrolliertesschlagwort_liste';
		var tr = currentTr;
		var knoten1 = tr.firstChild;
		while(knoten1!=null)
		{
			if(knoten1.nodeName == "TD")
			{
				var knoten2 = knoten1.firstChild;
				while(knoten2!=null)
				{
					if(knoten2.nodeName == "INPUT")
					{
						if(knoten2.getAttribute("name") == listName+"_KZ_IS_MODIFIED") knoten2.setAttribute("value","1");
						if(knoten2.getAttribute("name") == listName+"_code") knoten2.setAttribute("value",code);
						if(knoten2.getAttribute("name") == listName+"_decode") knoten2.setAttribute("value",obj.innerHTML);
					}
					knoten2 = knoten2.nextSibling;
				}
			}
			knoten1 = knoten1.nextSibling;
		}
		Liferay.Popup.close(obj); 
	}
	function topdev_deunicode(s) {
		s = s.replace(/\&quot;/g,"\"");
		s = s.replace(/\&#39;/g,"'");
		s = s.replace(/\&amp;/g,"&");
		s = s.replace(/\&lt;/g,"<");
		s = s.replace(/\&gt;/g,">");
		
		return s;
	}
		
	function sachgebiet_liste_tf7(code, obj)
	{
		listName = 'sachgebiet_liste';
		var tr = currentTr;
		var knoten1 = tr.firstChild;
		while(knoten1!=null)
		{
			if(knoten1.nodeName == "TD")
			{
				var knoten2 = knoten1.firstChild;
				while(knoten2!=null)
				{
					if(knoten2.nodeName == "INPUT")
					{
						if(knoten2.getAttribute("name") == listName+"_KZ_IS_MODIFIED") knoten2.setAttribute("value","1");
						if(knoten2.getAttribute("name") == listName+"_code") knoten2.setAttribute("value",code);
						if(knoten2.getAttribute("name") == listName+"_decode") knoten2.setAttribute("value",topdev_deunicode(obj.innerHTML));
					}
					knoten2 = knoten2.nextSibling;
				}
			}
			knoten1 = knoten1.nextSibling;
		}
		Liferay.Popup.close(obj); 
	}
</script>


<div><%@ include file="tabbar.jsp" %></div>
<div>
	<%--<jsp:include page="/config/templates/reakkreditierung/schritt${mainObject.currentTab}_kopf.jsp"/>--%>
</div>
<br/>
<div id="topdev_tab_head_errors"><tv2:errors/></div>
