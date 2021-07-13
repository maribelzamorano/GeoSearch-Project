	<c:if test="${topdev_ul_layout != 1}">
		<table width="100%" class="topdev_hitlist_head" cellpadding="0" cellspacing="1">
		<colgroup>
			<c:if test="${mode!=2}">
				<col class="topdev_iconbar">
			</c:if>
			<col>
		</colgroup>
		<c:if test="${mode!=2}">
		<tr>
			<th class="topdev_iconbar">
				<s:if test="kz_insert==1">
					<tui:icon type="new"><tui:url>${actionURL}_insert.action</tui:url>&id=0</tui:icon>
				</s:if>
				<s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</s:else>
			</th>
			<s:iterator value="headingList" status="rowstatus">
				<th align="left">
					<tui:msg type="heading"><s:property value="value" escape="false"/></tui:msg>
				</th>
			</s:iterator>
		</tr>
		</c:if>
	</c:if>
	<c:if test="${topdev_ul_layout == 1}">
		<ul>
	</c:if>
