<%@page import="geoSearch.topdev.com.GeoInformation" %>
<c:choose>
<c:when test="${anwf ne 'media'}">
		<!-- <c:out value="${geosearch_check}"/>  -->
		 <c:if test="${geosearch_check eq 'on'}">
			<%
                                String Postal_code = request.getParameter("Postal_code");
				String City = request.getParameter("City");
				String Street = request.getParameter("Street");
				String Radius = request.getParameter("Radius");
				String Number_of_nearest = request.getParameter("Number_nearest");
				String SchulType = request.getParameter("SType");
                                GeoInformation geoInformation=new GeoInformation();
                                String markers=geoInformation.getGeoInformation(session.getId(), Postal_code, City, Street, Radius, Number_of_nearest, SchulType);
				request.setAttribute("nulo",markers);
		
			%>
			<br>
		 	  <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true&amp;key=ABQIAAAANwe-SIBuSyIs9gtCeylEARRIsm8xBWeklZH_DrwkSkzVFVTU3RSJ5iWLeOfGtNPn55ETxV1Vojz1Ew" type="text/javascript"></script>
		     </script>
		     <script language="JavaScript">
		     	function load()
		     	{
		     		if (GBrowserIsCompatible()){
		     			var map = new GMap2(document.getElementById('map'));
		     			<c:if test="${nulo eq 'map.setCenter(new GLatLng(51.314,9.18), 5, G_NORMAL_MAP);'}" >
							alert("No schools were found! Please try again with different information!");
		     			</c:if>
		     			<%= markers %>
		     			map.setUIToDefault();
		     			}
		         	}
		     </script>
		     <body onload=load() onunload=GUnload()>
		     	<div id="map" style="width: 720px; height: 420px">
		     </body>
		 </c:if>
		<c:if test="${geosearch_check ne 'on'}">
			<table class="topdev_hitlist" cellpadding="0" cellspacing="1">
			<tr>
				<th align="left">
					Schulnummer
				</th>
				<th align="left">
					Schulname
				</th>
				<th align="left">
					Schulart
				</th>
				<th align="left">
					PLZ	/ Ort
				</th>
				<th align="left">
					Stra&szlig;e
				</th>
			</tr>

			<s:iterator value="rows" status="rowstatus">
				<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
			    	<td>
						  <s:property value="SCHULNUMMER"/>
					</td>
					<td>
						<a href="schools/overview?tspi=<s:property value="ID"/>">
							<s:property value="SCHULNAME"/></a><br/>
							<span style="font-size: 80%;"><s:property value="AENDERUNG"/></span>
					</td>
					<td>
						  <s:property value="SCHULART"/>
					</td>
					<td>
						  <s:property value="CC_PLZ_ORT"/>
					</td>
					<td>
						  <s:property value="CC_STRASSE"/>
					</td>
				</tr>
			</s:iterator>

			</table>
		</c:if>
</c:when>
<c:otherwise>
	<table class="topdev_hitlist" cellpadding="0" cellspacing="1">
	<tr>
		<th align="left">
			Nummer
		</th>
		<th align="left">
			Medienzentrum
		</th>
		<th align="left">
			PLZ	/ Ort
		</th>
		<th align="left">
			Stra&szlig;e
		</th>
	</tr>

	<s:iterator value="rows" status="rowstatus">
		<tr <s:if test="#rowstatus.odd == true">class="row_odd"</s:if>>
	    	<td>
				  <s:property value="SCHULNUMMER"/>
			</td>
			<td>
				<a href="mediacenter/overview?tspi=<s:property value="ID"/>&tspm=media">
					<s:property value="SCHULNAME"/>
				</a>
			</td>
			<td>
				  <s:property value="CC_PLZ_ORT"/>
			</td>
			<td>
				  <s:property value="CC_STRASSE"/>
			</td>
		</tr>
	</s:iterator>

	</table>
</c:otherwise>
</c:choose>
