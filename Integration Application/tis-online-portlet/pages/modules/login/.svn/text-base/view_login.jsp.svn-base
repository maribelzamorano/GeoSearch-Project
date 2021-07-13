<%@ include file="init.jsp" %>
<div class="login">
<s:if test="principal">
	Willkommen <b><s:push value="principal"><s:property value="name12"/></s:push></b><br/>
	Sie wurden erfolgreich am System angemeldet.<br/>
	<br/>
	<a href="/c/portal/logout">Abmelden</a>
</s:if>
<s:else>
	<table class= topdev_login>
	<colgroup>
	<col width="154px">
	</colgroup>
		<tr>
			<td>
				
			<!-- request.getRemoteHost() und request.getRemoteAddr() immer NULL ??-->
				<form method="get" action="/cas/login">
					<label for="username"><span class="accesskey">B</span>enutzername:</label><br />
					<input class="required" id="username" name="tusername" size="32" tabindex="1" accesskey="b" />
				
				
					<label for="password"><span class="accesskey">K</span>ennwort:</label><br />
					<input class="required" type="password" id="password" name="tpassword" size="32" tabindex="2" accesskey="p" />
					<input type="hidden" name="service" value="https://<%=request.getServerName()%>/c/portal/login"/>
					
			</td>
		</tr>
		<tr>
			<td>
					<input type="submit" class="portlet-form-button" accesskey="l" value="Anmelden" tabindex="4" />
					<input type="reset" class="portlet-form-button" accesskey="c" value="Leeren" tabindex="5" />
					<br/><br/>
				</form>
			</td>
		</tr>
	</table>
</s:else>
</div>