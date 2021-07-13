<%@ tag body-content="scriptless" %><%@ attribute name="name" required="true" rtexprvalue="true" %><%@ attribute name="increase" required="false" rtexprvalue="true" type="java.lang.Boolean"%><%
	if(increase==null) increase=false;
	if(increase)
	{
		Integer i = (Integer)request.getAttribute("topdev_counter_"+name);
		if(i==null) i=0;
		request.setAttribute("topdev_counter_"+name,i+1);
	}
	out.print(request.getAttribute("topdev_counter_"+name));
%>