<%@ include file="init.jsp" %>
<s:push value="entry">
<%@ include file="/pages/lib/fragment/form/prepare.jsp" %>
<script>
	TopdevUtil.ogCheckTab("${ns}", "${ajaxId}", true);
</script>
<table class="topdev_form" >
<colgroup>
	<col >
	<col width="400px">
</colgroup>

<tr>
	<tui:fieldlabel key="Themenbereich">Themenbereich:</tui:fieldlabel>
	<tui:dropdown name="themenbereich_code" labelname="decode" obligation="true" nullable="true" parameter="TBSH=ANTH" preload="ANTH" content="ASDL" value="ASDL"/>
</tr>
<tr>
	<tui:fieldlabel key="betreff">Betreff:</tui:fieldlabel>
	<tui:textfield name="betreff" maxlength="255" obligation="true"><s:property value="betreff"/></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel key="msg">Nachricht:</tui:fieldlabel>
	<tui:textarea rows="12" colspan="5" name="msg" maxlength="1500" obligation="true"><s:property value="msg"/></tui:textarea>
</tr>
<tr>
	<tui:fieldlabel key="absender_name">Ihr Name:</tui:fieldlabel>
	<tui:textfield name="absender_name" maxlength="150" obligation="true"><s:if test="principal==null"><s:property value="absender_name"/></s:if><s:else><s:if test="absender_name==null"><s:push value="principal"><s:property value="name12"/> - (Nutzer: <s:property value="id"/>)</s:push></s:if><s:else><s:property value="absender_name"/></s:else></s:else></tui:textfield>
</tr>
<tr>
	<tui:fieldlabel key="absender_mail">Ihre E-Mail Adresse:</tui:fieldlabel>
	<tui:textfield name="absender_mail" maxlength="150" obligation="true"><s:property value="absender_mail"/></tui:textfield>
</tr>


<%--
 <tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Art:</tui:fieldlabel>
	<tdl:var-set name="content"><s:property value="sportstaettenart"/></tdl:var-set>
	<tdl:var-set name="value"><s:property value="sportstaettenart_code"/></tdl:var-set>
	<tui:dropdown name="sportstaettenart_code" labelname="sportstaettenart" obligation="true" nullable="true" parameter="TBSH=SPAR" preload="SPAR" colspan="5" content="${content}" value="${value}"/>
</tr>
<tr>
	<tui:fieldlabel>Entfernung von Schule:</tui:fieldlabel>
	<tui:textfield name="entfernung" maxlength="7"><s:property value="entfernung"/></tui:textfield>
	<td align="left">m</td>
	<tui:fieldlabel >Gr&ouml;&szlig;e:</tui:fieldlabel>
	<tui:textfield name="groesse" maxlength="7"><s:property value="groesse"/></tui:textfield>
	<td align="left">m&#178;</td>
</tr>
<tr>
	<tui:fieldlabel>Erreichbarkeit:</tui:fieldlabel>
	<tui:textarea rows="2" colspan="5" name="erreichbarkeit" maxlength="255"><s:property value="erreichbarkeit"/></tui:textarea>
</tr>

<tr>
	<tui:fieldlabel key="ausstattung"/>
	<tui:textarea rows="3" colspan="5" name="ausstattung" maxlength="255"><s:property value="ausstattung"/></tui:textarea>
</tr>
<tr>
	<input type="hidden" name="id" value="<s:property value="id"/>"/>
	<tui:fieldlabel>Beschreibung:</tui:fieldlabel>
	<tui:textarea colspan="5" name="beschreibung" obligation="true" maxlength="1000"><s:property value="beschreibung"/></tui:textarea>
</tr>
<tr>
	<td colspan="6" class="buttonbar">

		<tui:button type="ok">
			var url = '<s:url value="/neuter_resources/sport-detail_save.action"/>' + '?ajaxId=<s:property value="ajaxId"/>&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
		<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<s:url value="/neuter_resources/sport-list_edit.action"/>?1=1')</tui:button>
	</td>
</tr>--%>


<tr>
	<td colspan="6" class="buttonbar">
		<tui:button type="save" value="send">
			var url = '<tui:url>/contact/mail-detail_save.action</tui:url>' + '&' + Form.serialize(document.getElementById('<s:property value="ajaxId"/>_form'));
			TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>',url);
		</tui:button>
<%-- 	<tui:button type="abort">TopdevUtil.updateTab('<tdl:var name="ns"/>','<tdl:var name="ajaxId"/>','<s:url value="/contact/mail-detail_edit.action"/>?reinit=true')</tui:button>--%>
	 	<tui:button type="abort">location.replace('/web/guest/home')</tui:button>
	</td>
</tr>

</table><br/><br/>
<%@ include file="/pages/lib/fragment/form/close.jsp" %>
</s:push>


