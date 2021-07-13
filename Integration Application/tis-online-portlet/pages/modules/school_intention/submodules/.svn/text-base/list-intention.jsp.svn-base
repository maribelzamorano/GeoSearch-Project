<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/school_intention/intention-detail</tdl:var-set>

<s:if test="mode==1">
	<%@ include file="/pages/lib/fragment/list/complex/body.jsp" %>
</s:if>
<s:else>
	<s:if test="complexList.entryList.size>0">
		<table cellpadding="0" cellspacing="0">
		<tr>
			<td class="topdev_title_gray">
				Wir nehmen teil am:
			</td>
		</tr>
		<tr>
			<td >
			
				<ul class="topdev_link_intern">
					<s:iterator value="complexList.entryList" status="rowstatus">
						<s:if test="kz_artikel==1">
							<li >
								<a class="topdev_link"
									href="/web/guest/info/projects/<s:property value="schw_id"/>">
									<s:property value="spar_decode"/>: <s:property value="schw_bezeichnung"/>
								</a>
							</li>
						</s:if>
						<s:else>
							<li style="font-size:95%; ">
								<s:property value="spar_decode"/>: <s:property value="schw_bezeichnung"/>
							</li>
						</s:else>
					</s:iterator>
				</ul>
			
		</td>
		</tr>
		</table>
	</s:if>
	<s:else>
		F&uuml;r diesen Bereich wurden noch keine Inhalte eingepflegt.
	</s:else>
</s:else>