<%@ include file="init.jsp" %>
<div class="topdev_portlet">
<c:set var="DateienDesMediumsContent"><s:iterator value="fileList"><s:if test="medienverwendungCode != '110'"><s:property value="medienverwendungCode"/><br/></s:if></s:iterator></c:set>

<s:if test="${empty DateienDesMediumsContent}">
<tv2:msg key="global.label-keine_daten"/>
</s:if>
<table width="162" class="topdev_spacedList">
	<colgroup>
	<col width="20px"/><col/>
	</colgroup>
	<s:iterator value="fileList">
		<s:if test="medienverwendungCode != '110'">
			<tr>
				<td valign="top">
					<nobr>
						<a href="javascript:;" onclick="TopdevUtil.window_open('/medium_navigation/medium-download.action?mid=<s:property value="tspi"/>&did=1&name=<s:property value="dateiname"/>&usage=0&type=<s:property value="format"/>');">
						<img
							src="/tis-online-portlet/images/icons/portlet/medienverwendung/<s:property value="medienverwendungCode"/>.jpg"
							title="<s:property value="medienverwendungDecode"/>"
							border="0"/>	
						</a> 
					</nobr>
				</td>
				<td style="padding-left:2px">
						<a href="javascript:;" onclick="TopdevUtil.window_open('/medium_navigation/medium-download.action?mid=<s:property value="tspi"/>&did=1&name=<s:property value="dateiname"/>&usage=0&type=<s:property value="format"/>');">
						<tv2:spacer maxWordLength="20"><s:property value="urlText"/></tv2:spacer></a> <nobr>(<s:property value="dateigroesse"/> <s:property value="dateigroesseEinheitDecode"/>)</nobr>
	
				</td>
			</tr>
		</s:if>
	</s:iterator>
</table>
</div>