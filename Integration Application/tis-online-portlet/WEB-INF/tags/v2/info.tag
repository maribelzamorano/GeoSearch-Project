<%@ tag body-content="scriptless" %>
<%@ tag import="java.util.Enumeration"%>
<%@ attribute name="ctx" required="true" rtexprvalue="true"%>
<%
	if(ctx==null) ctx="request";
	
	if(ctx.equals("request"))
	{
		Enumeration e = request.getAttributeNames(); 
		while(e.hasMoreElements()) 
		{
			String s = (String)e.nextElement();	
			out.println("<br/>"+s+"="+request.getAttribute(s)); 
		}
	}
%>
