<%@ include file="init.jsp" %>
<tdl:var-set name="actionURL">/school_intention/foreignlanguage-detail</tdl:var-set>

<s:if test="mode==1">
	<%@ include file="/pages/lib/fragment/list/complex/body.jsp" %>
</s:if>
<s:else>
	<table cellpadding="0" cellspacing="0">
	<tr>
		<td class="topdev_title_gray">
			Wir bieten folgende Fremdsprache(n) an:
		</td>
	</tr>
	<tr>
		<td >
			<ul>
				<s:iterator value="complexList.entryList" status="rowstatus">
						<li style="padding-bottom:5px">
							<s:property value="decode"/>
						</li>
				</s:iterator>
			</ul>
		
	</td>
	</tr>
	</table>
</s:else>