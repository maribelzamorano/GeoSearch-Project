<%--  Einbau in results.jsp --%>

historyLabel = "<ttl:msg name="view" type="history"/>";

<logic:present name="idParameter">
	<bean:write name="idParameter"/> = "<%= request.getParameter((String)request.getAttribute("idParameter")) %>";
	mode = "<%= request.getParameter("mode") %>";
	if(mode!=2)
	{
		if(<bean:write name="idParameter"/>=="0") historyLabel+=" einfügen";
		else historyLabel+=" bearbeiten";
	}
</logic:present>

try
{
	top.frames.head.currentLabel = historyLabel;
	top.frames.head.document.getElementById("historyNavigator").onclick();
} catch(e) {}

try { if(parent && parent.document) parent.registerFrames(); } catch(e) {}
