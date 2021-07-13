<%@ include file="init.jsp" %>
<script src="<s:url value="/resources/javascript/lib/awstats_misc_tracker.js"/>"  type="text/javascript"></script>
<div>
	<s:if test="principal==null"><b>Sie sind nicht angemeldet.</b><br/></s:if>
	<ul class="topdev_link_intern">
	
	<s:if test="principal==null">
		<li class="topdev_icon_intern">
			<a class="topdev_link" href="/c/portal/login">F&uuml;r die Anmeldung klicken Sie bitte hier</a>.<br/>
		</li>
	</s:if>

		<s:else>
			<s:push value="principal">
				<s:if test="dienId!=null && dienId!=''">
					<li class="topdev_icon_schulportrait">
						<a class="topdev_link" href="javascript:TopdevUtil.openEntry('schools','overview','<s:property value="dienId"/>')">
							Unsere Schule
						</a>
					</li>
				</s:if>
			</s:push>


		</s:else>
		<li class="topdev_icon_mail">
			<a class="topdev_link" href="/web/guest/request">
				Anfrage senden
			</a>
		</li>
	</ul>
	<s:property value="sessionCount"/> Besucher online.<br/></i>
	
</div>