<%@ include file="init.jsp" %>
<%@ include file="tab-head.jsp" %>

<c:set var="previewImageUrl"><s:property value="previewImageUrl"/></c:set>

<s:push value="mainObject.bobj">
	<c:set var="previewImageId"><s:property value="previewImageId"/></c:set>
	<iframe src="javascript:false" name="${ns}_submit_frame" style="display:none"></iframe>
	<input type="hidden" name="kz_delete" value="0"/>
	<input type="hidden" name="mediumId" value="<s:property value="id"/>"/>
	<input type="hidden" name="previewImageId" value="<s:property value="previewImageId"/>"/>
	
	<s:if test="mainObject.bobj.previewImage.id!=0">
		<s:set name="previewImage" value="mainObject.bobj.previewImage" scope="page"/>
		<%--_${previewImage.geprueft}-${previewImage.id}-${previewImage.id < 1000000}_--%>
		<c:choose>
		<c:when test="${previewImage.geprueft eq '1'}">
			Aktuelles Vorschaubild:<br/>
			<img src="${previewImageUrl}"/><br/>
			<table class="topdev_form" width="80" id="preview_image_delete_table">
				<tr>
					<td class="buttonbar">
						<tv2:button type="delete" id="delete"> goToTab(7,'delete'); </tv2:button>
					</td>
				</tr>
			</table>
		</c:when>
		<c:otherwise>
			Das Vorschaubild wurde erfolgreich hochgeladen.<br/>
			Nach einem Virenscan steht es zur Anzeige zur Verf&uuml;gung.<br/>
			Dies kann bis zu 30 Minuten dauern.<br/>
		</c:otherwise>
		</c:choose>
	</s:if>
	<s:else>
		<table class="topdev_form" width="300" id="preview_image_upload_table">
			<colgroup><col/><col/></colgroup>
			<tr>
				<td>Datei:</td>
				<td align="right"><input type="file" name="previewImage" value="" style="width:220px"/></td>
				<td class="buttonbar"><tv2:button type="upload" id="save"> document.getElementsByName('${ns}_form')[0].submit(); </tv2:button></td>
			</tr>
		</table>
	</s:else>
</form>

<%@ include file="tab-foot.jsp" %>
</s:push>