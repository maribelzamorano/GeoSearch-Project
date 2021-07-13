package com.servlet;

import geoSearch.topdev.com.BobjGeoSchool;
import geoSearch.topdev.com.BobjGeoSearch;
import geoSearch.topdev.com.BobjGeoUser;
import geoSearch.topdev.com.GeoInformation;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;
import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.axis.encoding.ser.BeanDeserializerFactory;
import org.apache.axis.encoding.ser.BeanSerializerFactory;
import java.util.logging.Logger;
import java.util.logging.Level;


public class GServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String Postal_code;
	static String City;
	static String Street;
	static String Number_of_nearest;
	static String Radius;
	static String endpoint ="http://192.168.102.72:33601/GeoSearchWebService/GeoSearchWSService";
	static String SchulType;
	static String Session_id="CE67A3BC23BE0972441E67C2B9DCA313"; // For testing
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

	   
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		Postal_code = request.getParameter("PostalCode");
		City = request.getParameter("City");
		Street = request.getParameter("Street");
		Number_of_nearest = request.getParameter("number_nearest");
		Radius = request.getParameter("radius");
		SchulType = request.getParameter("Schulart");
		
		if(Radius == "")
		{
			Radius = "0";
		}
		double radio = Double.valueOf(Radius).doubleValue();
		float radius = (float) (radio * (0.621371192));
		Radius = "" + radius;
		
		try
		{
	
			
			BobjGeoSearch GeoSearchList=new BobjGeoSearch();
		    GeoSearchList=getGeoSearch();
		   
			out.println("<HTML><HEAD><title>Geo-Search</title>");
			out.println("<SCRIPT src=\"http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=true_or_false&amp;key=ABQIAAAAstn6SGEYM_26t8HVnm3NTxRiJS3P8MOTl1DoRNdqSv5_NPiCvhT2hRT_Moi5QO06cMRGll428uC31w\" type=\"text/javascript\"></script>");
			out.println("<SCRIPT type=\"text/javascript\">");
			out.println("function load() {");
			out.println("if (GBrowserIsCompatible()){");
			out.println("var map = new GMap2(document.getElementById('map'));");

			for(int x = 0 ; x < GeoSearchList.getBobjGeoSchool().size(); x++)
			{

				out.println("markerSchool"+x+" = new GMarker(new GLatLng("+GeoSearchList.getBobjGeoSchool().get(x).getlatitude()+","+GeoSearchList.getBobjGeoSchool().get(x).getlongitude()+"));");
				out.println("map.addOverlay(markerSchool"+x+");");
				out.println("GEvent.addListener(markerSchool"+x+", 'click', function() {");
				out.println("markerSchool"+x+".openInfoWindowHtml('<div><B>School Name: </B>"
							+GeoSearchList.getBobjGeoSchool().get(x).getSchulName()
							+"<br><B>Distance: </B>"+ GeoSearchList.getBobjGeoSchool().get(x).getDistance() +" Km." 
							+ "<br><B>URL: </B><A HREF=\"http://www.schulportal-thueringen.de/web/guest/schools/overview?tspi=" 
							+ GeoSearchList.getBobjGeoSchool().get(x).getGepa_id()+"\" TARGET=\"_blank\">http://www.schulportal-thueringen.de/web/guest/schools/overview?tspi="
							+GeoSearchList.getBobjGeoSchool().get(x).getGepa_id()+"</A>"+"')});");
				
			}
			
			out.println("var point = new GLatLng("+GeoSearchList.getBobjGeoUser().getUser_latitude()+","+GeoSearchList.getBobjGeoUser().getUser_longitude()+");");
			out.println("var coloricon = new GIcon(G_DEFAULT_ICON);");
			out.println("coloricon.image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png';");
			out.println("coloricon.iconSize = new GSize(34,34);");
			out.println("var opts = {icon: coloricon};");
			out.println("var mark = new GMarker(point,opts);");
			out.println("markerUser = new GMarker(point,opts);");
			out.println("map.addOverlay(markerUser);");
			out.println("GEvent.addListener(markerUser, 'click', function() {");
			out.println("markerUser.openInfoWindowHtml('<div>"+Street+"<br><B>Postal Code: </B>"+Postal_code+"')});");
			

			out.println("map.setCenter(new GLatLng("+GeoSearchList.getBobjGeoUser().getUser_latitude()+","+GeoSearchList.getBobjGeoUser().getUser_longitude()+"), 12, G_NORMAL_MAP);");
			out.println("map.setUIToDefault();");
			out.println("}");
			out.println("}");
			out.println("</SCRIPT>");
			out.println("</HEAD>");
			out.println("<body onload=load() onunload=GUnload()>");
			out.println("<div id=\"map\" style=\"width: 820px; height: 600px\">");
			out.println("</body>");
			out.println("</html>");

		}
		catch (Exception e) {
			// TODO Auto-generated catch block
			out.println("<html>");
			out.println("<Script Language=JavaScript>");
			out.println("alert('Sorry, Schools were not found, try with another search information!');");
			out.println("history.back(1);</script>");
			out.println("</html>");
		}
	}
	
	
	public static BobjGeoSearch getGeoSearch() throws Exception
    {
        BobjGeoSearch GeoSearch=new BobjGeoSearch();
        
        try
        {
            BobjGeoUser User=new BobjGeoUser();
            User=getUser(Postal_code,City,Street);

            List<BobjGeoSchool> Schools= new ArrayList<BobjGeoSchool>();

            Schools=getSchools(Session_id, Number_of_nearest,Radius,User.getUser_longitude(),User.getUser_latitude(),SchulType);

            for(int x=0;x<Schools.size();x++)
            {
                GeoSearch.setBobjGeoSchool(Schools.get(x));
             	if(Schools.get(x).getDistance().trim().equals("0.0"))
            	{
            		float newLat=(float) (Float.parseFloat(User.getUser_longitude())+.0001);
            		User.setUser_longitude(Float.toString(newLat));
            	}
            }
            GeoSearch.setBobjGeoUser(User);
        }
        catch (Exception  e)
        {
            throw new Exception(e);
        }

        return GeoSearch;
    }



    public static BobjGeoUser getUser(String Postal_code,String City,String Street)
    {
        BobjGeoUser User=new BobjGeoUser();
        try
        {
            Service  service = new Service();

            Call call= (Call) service.createCall();

            QName qn = new QName("http://com.topdev.geoSearch/", "BobjGeoUser");

            call.registerTypeMapping(BobjGeoUser.class,qn,
                                        new BeanSerializerFactory(BobjGeoUser.class,qn),
                                        new BeanDeserializerFactory(BobjGeoUser.class,qn));

            call.setTargetEndpointAddress(endpoint);

            call.setOperationName(new QName("http://com.topdev.geoSearch/", "getUser"));

            call.addParameter("Postal_code",  XMLType.XSD_STRING, ParameterMode.IN);
            call.addParameter("City",  XMLType.XSD_STRING, ParameterMode.IN);
            call.addParameter("Street",  XMLType.XSD_STRING, ParameterMode.IN);

            call.setReturnType(XMLType.XSD_ANYTYPE);

            call.setReturnClass(BobjGeoUser.class);

            User=(BobjGeoUser) call.invoke( new Object[] { Postal_code,City,Street } );


        }      
        catch (ServiceException ex)
        {
            Logger.getLogger(GServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (RemoteException ex)
        {
            Logger.getLogger(GServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
            return User;
     }


	@SuppressWarnings("unchecked")
	public static List<BobjGeoSchool> getSchools
     (String Session_id, String Number_of_nearest, String Radius, String User_longitude, String User_latitude,String SchulType) throws Exception
     {
        List<BobjGeoSchool> Schools=new ArrayList<BobjGeoSchool>();
	
        try
        {
            Service  service = new Service();

            Call callSchools= (Call) service.createCall();

            QName qn = new QName("http://com.topdev.geoSearch/", "BobjGeoSchool");

            callSchools.registerTypeMapping(BobjGeoSchool.class,qn,
                                        new BeanSerializerFactory(BobjGeoSchool.class,qn),
                                        new BeanDeserializerFactory(BobjGeoSchool.class,qn));

            callSchools.setTargetEndpointAddress(endpoint);

            callSchools.setOperationName(new QName("http://com.topdev.geoSearch/", "getSchools"));
            callSchools.addParameter("Session_id",  XMLType.XSD_STRING, ParameterMode.IN);
            callSchools.addParameter("Number_of_nearest",  XMLType.XSD_STRING, ParameterMode.IN);
            callSchools.addParameter("Radius",  XMLType.XSD_STRING, ParameterMode.IN);
            callSchools.addParameter("User_longitude",  XMLType.XSD_STRING, ParameterMode.IN);
            callSchools.addParameter("User_latitude",  XMLType.XSD_STRING, ParameterMode.IN);
            callSchools.addParameter("SchulType",  XMLType.XSD_STRING, ParameterMode.IN);
            
            callSchools.setReturnType(XMLType.XSD_ANYTYPE);

            callSchools.setReturnClass(BobjGeoSchool.class);

            if (callSchools.invoke( new Object[]{ Session_id, Number_of_nearest,Radius,User_longitude,
				User_latitude,SchulType} ).getClass().toString().trim().equals("class geoSearch.topdev.com.BobjGeoSchool"))
            {
        	  	BobjGeoSchool School=new BobjGeoSchool();
                School = (BobjGeoSchool) callSchools.invoke( new Object[]
                                                            { Session_id,Number_of_nearest,Radius,
                                                              User_longitude,
                                                              User_latitude,SchulType} );
                Schools.add(School);
               
            }
	       
            else
	        {
	            Schools= (List<BobjGeoSchool>) callSchools.invoke( new Object[]
	                                                    { Session_id,Number_of_nearest,Radius,
	            										  User_longitude,
	            										  User_latitude,SchulType
	                                                    } );
	        }
        }	
        catch (ServiceException ex)
        {
            Logger.getLogger(GServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        catch (RemoteException ex)
        {
            Logger.getLogger(GServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        for(int x=Schools.size()-1;x>0;x--)
        {
        	if(Schools.get(x).getlongitude().trim().toString().equals(Schools.get(x-1).getlongitude().trim().toString()))
        	{
        		float newLat=(float) (Float.parseFloat(Schools.get(x).getlongitude())+.0001);
        		Schools.get(x).setlongitude(Float.toString(newLat));
        	}

        }


        return Schools;
     }

}
