<%@ tag body-content="scriptless" %><%@tag import="java.util.Map"%><%@tag import="java.util.HashMap"%><%@ attribute name="mode" required="false" rtexprvalue="true"  type="java.lang.Integer"%><%@ attribute name="name" required="true" rtexprvalue="true" %><%
int vsid=0;
if(mode==null) mode=2;	//Standardmäßig den View-mode annehmen

Map<String,Integer> vsMapping = new HashMap<String,Integer>(1);

if(session.getAttribute("index.vsid")!=null)
	vsid = (Integer)session.getAttribute("index.vsid");
if(session.getAttribute("map.vsid")!=null)
	vsMapping = (Map<String,Integer>) session.getAttribute("map.vsid");

vsid++;
String tVsid = session.getId()+"_"+vsid;
out.print(tVsid);
vsMapping.put(tVsid+"_"+name, mode);

session.setAttribute("index.vsid",	new Integer(vsid));
session.setAttribute("map.vsid",	vsMapping);
 
%>