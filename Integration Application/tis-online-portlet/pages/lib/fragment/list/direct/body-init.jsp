	<table name="topdev_direct_list" width="100%" class="topdev_hitlist" cellpadding="0" cellspacing="1" id="${ajaxId}_${sublistName}_table">
		<colgroup>
			<col class="topdev_cursorbar">
			<col class="topdev_iconbar">
			<s:iterator value="headingList" status="rowstatus">
				<col>
			</s:iterator>
		</colgroup>

		<tr>
			<th class="topdev_cursorbar">
			</th>
			<th class="topdev_iconbar">
				<tui:icon type="new" js="true" msgkey="${msgkey_info_new!=null?msgkey_info_new:'new'}">TopdevUtil.addEntry('${ajaxId}', '${sublistName}');  TopdevUtil.ogCheck(this, '${ns}', '${ajaxId}', true); return false;</tui:icon>
			</th>
			<s:iterator value="headingList" status="rowstatus">
				<th align="left">
					<tui:msg type="heading"><s:property value="value" escape="false"/></tui:msg>
				</th>
			</s:iterator>