<%@ include file="init.jsp" %>

<s:push value="entry">
<tdl:var-set name="form_forwardUrl"><tui:url>/school_life/offer-list_edit.action</tui:url></tdl:var-set>
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>


<table class="topdev_form">

<colgroup>
	<col>
	<col width="400px">
</colgroup>

<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Kurzbezeichnung:</tui:fieldlabel>	
	<tui:textfield name="foan_bezeichnung" obligation="true" maxlength="255"><s:property value="foan_bezeichnung"/></tui:textfield>	 			
</tr>
<tr>
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>	
	<tui:textarea name="foan_beschreibung" obligation="true" maxlength="1000" rows="7"><s:property value="foan_beschreibung"/></tui:textarea>			
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">sub_list2</tdl:var-set>
		<tdl:var-set name="tbsh">KLST</tdl:var-set>
		<tdl:var-set name="msgkey_info_new">klassen</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp" %><br/>
	</td>
</tr>
<tr>
	<td colspan="2">
		<tdl:var-set name="sublistName">sub_list1</tdl:var-set>
		<tdl:var-set name="tbsh">FACH</tdl:var-set>
		<tdl:var-set name="msgkey_info_new">klassen</tdl:var-set>
		<tdl:var-set name="tbsh">FACH</tdl:var-set>
		<tdl:var-set name="msgkey_info_new">faecher</tdl:var-set>
		<%@ include file="/pages/lib/fragment/list/direct/body-template1.jsp" %>
	</td>
</tr>
<tr>
	<td colspan="2" class="buttonbar">

	<tui:button type="save" scope="tab">
			var url = '<tui:url>/school_life/offer-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<tui:url>/school_life/offer-list_edit.action</tui:url>')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>

<%--
<tr>
	<td colspan="4" class="buttonbar">
		<tui:button type="ok">
			document.<s:property value="ajaxId"/>_form.encoding = 'text/plain';
			var url = '<s:url value="/school_life/offer-detail_save.action"/>' + '?ajaxId=<s:property value="ajaxId"/>&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<s:url value="/school_life/offer-list_edit.action"/>?1=1')</tui:button>
	</td>
</tr>
</table>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push> --%>
<%-- 
<script>
var Form = 
{
	serialize:function(form)
	{
		var elements = Form.getElements($(form));
		var queryComponents=new Array();
		for(var i=0;i<elements.length;i++)
		{
			var queryComponent=Form.Element.serialize(elements[i]);
			if(queryComponent)
				queryComponents.push(queryComponent);
		}
		return queryComponents.join('&');
	},
	getElements:function(form)
	{
		form=$(form);
		var elements=new Array();
		for(tagName in Form.Element.Serializers)
		{
			var tagElements=form.getElementsByTagName(tagName);
			for(var j=0;j<tagElements.length;j++)
				elements.push(tagElements[j]);
		}
		return elements;
	},
	getInputs:function(form,typeName,name)
	{
		form=$(form);var
		inputs=form.getElementsByTagName('input');
		if(!typeName&&!name) return inputs;
		var matchingInputs=new Array();
		for(var i=0;i<inputs.length;i++)
		{
			var input=inputs[i];
			if((typeName&&input.type!=typeName)||(name&&input.name!=name))
				continue;
			matchingInputs.push(input);
		}
		return matchingInputs;
	},
	disable:function(form)
	{
		var elements=Form.getElements(form);
		for(var i=0;i<elements.length;i++)
		{
			var element=elements[i];
			element.blur();
			element.disabled='true';
		}
	},
	enable:function(form){var elements=Form.getElements(form);for(var i=0;i<elements.length;i++){var element=elements[i];element.disabled='';}},
	findFirstElement:function(form){return Form.getElements(form).find(function(element){return element.type!='hidden'&&!element.disabled&&['input','select','textarea'].include(element.tagName.toLowerCase());});},
	focusFirstElement:function(form){Field.activate(Form.findFirstElement(form));},
	reset:function(form){$(form).reset();}
}

Form.Element=
{
	serialize:function(element)
	{
		element=$(element);
		var method=element.tagName.toLowerCase();
		var parameter=Form.Element.Serializers[method](element);
		if(parameter)
		{
			var key=encodeURIComponent(parameter[0]);
			if(key.length==0)return;
			if(parameter[1].constructor!=Array)
				parameter[1]=[parameter[1]];
			return parameter[1].map(function(value)
				{
					return key+'='+encodeURIComponent(value);
				}).join('&');
		}
	},
	getValue:function(element){element=$(element);var method=element.tagName.toLowerCase();var parameter=Form.Element.Serializers[method](element);if(parameter)
	return parameter[1];
	}
}
Form.Element.Serializers=
{
	input:function(element){switch(element.type.toLowerCase()){case'submit':case'hidden':case'password':case'text':return Form.Element.Serializers.textarea(element);case'checkbox':case'radio':return Form.Element.Serializers.inputSelector(element);}
return false;},
inputSelector:function(element){if(element.checked) return[element.name,element.value];},textarea:function(element){return[element.name,element.value];},
select:function(element){return Form.Element.Serializers[element.type=='select-one'?'selectOne':'selectMany'](element);},
selectOne:function(element){var value='',opt,index=element.selectedIndex;if(index>=0){opt=element.options[index];value=opt.value;if(!value&&!('value'in opt)) 
</script>
--%>
