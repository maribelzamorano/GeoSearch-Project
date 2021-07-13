<%@ include file="../init-v2.jsp" %><%@ tag body-content="scriptless" %><%@ attribute name="maxWordLength" required="false" rtexprvalue="true" type="java.lang.Integer"%><%@ attribute name="maxLength" required="false" rtexprvalue="true" type="java.lang.Integer"%><jsp:doBody  var="resultBodyString" scope="request"/><%
if(maxWordLength==null) maxWordLength = 25;
String body = String.valueOf(request.getAttribute("resultBodyString"));
if(body==null) body="";
if(body.length()>maxWordLength)
{
	String[] bs = body.split(" ");
	String newBody = "";
	int bodyLength = body.length();
	for(int i=0; i<bs.length; i++)
	{
		StringBuffer sb = null;
		if(bs[i].length()>maxWordLength)
		{
			sb = new StringBuffer(bs[i].length());
			char[] cs = bs[i].toCharArray();
			int cLen = 0;
			boolean appendable = true;
			for(int n=0; n<cs.length; n++)
			{
				if(cs[n] == '&')		appendable=false;
				else if(cs[n] == ';')	appendable=true;
				sb.append(cs[n]);
				if(appendable) cLen++;
				if(appendable && cLen > maxWordLength)
				{
					cLen=0;
					sb.append("<wbr>");
				}
			}
			bs[i] = sb.toString();
		}
		newBody+=bs[i]+" ";
	}
	body = newBody;
	if(maxLength!=null && bodyLength>=maxLength)
	{
		bodyLength = 0;
		boolean countable = true;
		char[] cs = body.toCharArray();
		StringBuffer sb = new StringBuffer(body.length());
		for(int n=0; n<cs.length; n++)
		{
			if(		cs[n] == '&' || cs[n] == '<')	countable=false;
			else if(cs[n] == ';' || cs[n] == '>')	countable=true;
			sb.append(cs[n]);
			if(countable)
			{
				bodyLength++;
				if(bodyLength > maxLength)
				{
					sb.append("...");
					break;
				}
			}
		}
		body = sb.toString();
	}
}
out.print(body);
%>