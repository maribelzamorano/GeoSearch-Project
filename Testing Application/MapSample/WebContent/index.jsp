<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="javax.xml.namespace.QName"%>
<%@page import="javax.xml.rpc.ParameterMode"%>
<%@page import="java.util.List" %>
<%@page import="org.apache.axis.encoding.XMLType"%>
<%@page import="org.apache.axis.encoding.ser.BeanDeserializerFactory"%>
<%@page import="org.apache.axis.encoding.ser.BeanSerializerFactory"%>
<%@page import="org.apache.axis.client.Service"%>
<%@page import="org.apache.axis.client.Call"%>
<%@page import="geoSearch.topdev.com.BobjGeoUser"%>

<%@page import="geoSearch.topdev.com.BobjGeoSchool"%>
<%@page import="geoSearch.topdev.com.BobjGeoSearch"%>
<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>

<%@page import="java.io.PrintWriter"%>
<%@page import="com.servlet.GServlet"%><html>
<head>

<%
			/*	String cp = request.getParameter("PostalCode");
				String ct = request.getParameter("City");
				String str = request.getParameter("Street");
				String nn = request.getParameter("number_nearest");
				String rad = request.getParameter("radius");
				if(nn == "")
				{
					nn = "0";
				}
				if(rad == "")
				{
					rad = "0";
				}
				String endpoint ="http://192.168.102.72:33601/GeoSearchWebService/GeoSearchWSService";
				Service service = new Service();
				Call call= (Call) service.createCall();
				QName qn = new QName("http://com.topdev.geoSearch/", "BobjGeoSchool");
			              // registramos en la llamada remota
			             // el tipo de dato custom
			    call.registerTypeMapping(BobjGeoSchool.class,qn,new BeanSerializerFactory(BobjGeoSchool.class,qn),new BeanDeserializerFactory(BobjGeoSchool.class,qn));
			    call.setTargetEndpointAddress(endpoint);
			    call.setOperationName(new QName("http://com.topdev.geoSearch/", "getSchools"));
				call.addParameter("Number_of_nearest",  XMLType.XSD_STRING, ParameterMode.IN);
				call.addParameter("Radius",  XMLType.XSD_STRING, ParameterMode.IN);
				call.addParameter("User_longitude",  XMLType.XSD_STRING, ParameterMode.IN);
				call.addParameter("User_latitude",  XMLType.XSD_STRING, ParameterMode.IN);
			                //call.setReturnType(qn);
				call.setReturnType(XMLType.XSD_ANYTYPE);
			            // que tipo de clase esperamos
			    call.setReturnClass(BobjGeoSchool.class);
			    Object[] inParams = new Object[] { nn, rad, "11.03309", "50.98369" };

			    List<BobjGeoSchool> obj = (List<BobjGeoSchool>) call.invoke(inParams);
			//	String ulat = obj.getUser_latitude();
			//	String ulong = obj.getUser_longitude();*/
%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Map Viewer</title>
        <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true_or_false&amp;key=ABQIAAAAstn6SGEYM_26t8HVnm3NTxRiJS3P8MOTl1DoRNdqSv5_NPiCvhT2hRT_Moi5QO06cMRGll428uC31w"
            type="text/javascript"></script>
        <script type="text/javascript">

        //<![CDATA[

        function load() {
            if (GBrowserIsCompatible()) 
            {
                var map = new GMap2(document.getElementById("map"));
                for(x=0; x<9;x++)
                {
	          	      marker2 = new GMarker(new GLatLng(55,12));
		      	    	map.addOverlay(marker2);
             	   GEvent.addListener(marker2, "click", function() {
             	 //  marker2.openInfoWindowHtml('<A href="http://ith.mx" target="_blank">WebSite</A>')});         
              	  marker2.openInfoWindowHtml('<div><B>You are here!')});
                map.setCenter(new GLatLng(51.314,9.18), 5, G_NORMAL_MAP);
                map.setUIToDefault();
            }
            //    map.addControl(new GSmallMapControl());
            //    map.addControl(new GOverviewMapControl());
                            
            }
        }
        //]]>
        </script>
    </head>

 <body onload="load()" onunload="GUnload()">
        <div id="map" style="width: 420px; height: 420px"></div>
    </body>
</html>