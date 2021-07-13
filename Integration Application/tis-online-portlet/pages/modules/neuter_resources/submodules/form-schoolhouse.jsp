<%@ include file="init.jsp" %>
<table class="topdev_form">
	<colgroup>
		<col>
		<col width="450px">
	</colgroup>
	<tr>
			<tui:fieldlabel><tui:msg key="gebaeude" type="label"/></tui:fieldlabel>
			<tui:textarea obligation="true" name="beschreibung_gebaeude" maxlength="1000"><s:property value="beschreibung_gebaeude"/></tui:textarea>
	</tr>
	<tr>
			
			<tui:fieldlabel><tui:msg key="weitere_gebaeude" type="label"/></tui:fieldlabel>
			<tui:textarea  name="beschreibung_weitere_gebaeude" maxlength="1000"><s:property value="beschreibung_weitere_gebaeude"/></tui:textarea>
	</tr>
	<tr>
			<tui:fieldlabel><tui:msg key="behindertengerecht" type="label"/></tui:fieldlabel>
			<tui:textarea  name="besonderheiten_beau" maxlength="1000"><s:property value="besonderheiten_beau"/></tui:textarea>
	</tr>
</table>
</form>