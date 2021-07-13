package geoSearch.topdev.com;

import geoSearch.topdev.com.BobjGeoSchool;
import geoSearch.topdev.com.BobjGeoSearch;
import geoSearch.topdev.com.BobjGeoUser;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
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


public class GeoInformation {
	
	static String endpoint ="http://192.168.102.72:33601/GeoSearchWebService/GeoSearchWSService";
	static String read="";
	public String getGeoInformation(String Session_id,String Postal_code, String City, String Street, String Radius, String Number_of_nearest, String SchulType) throws Exception,NullPointerException
	{	   
	
		BobjGeoSearch GeoSearchList=new BobjGeoSearch();
		
		try
		{
			GeoSearchList=getGeoSearch(Session_id,Postal_code, City, Street, Radius, Number_of_nearest, SchulType);

			for(int x = 0 ; x < GeoSearchList.getBobjGeoSchool().size(); x++)
			{
	
				read=read+"markerSchool"+x+" = new GMarker(new GLatLng("+GeoSearchList.getBobjGeoSchool().get(x).getlatitude()+","+GeoSearchList.getBobjGeoSchool().get(x).getlongitude()+"));";
				read=read+"map.addOverlay(markerSchool"+x+");";
				read=read+"GEvent.addListener(markerSchool"+x+", 'click', function() {";
				read=read+"markerSchool"+x+".openInfoWindowHtml('<div><B>School Name: </B>"
							+GeoSearchList.getBobjGeoSchool().get(x).getSchulName()
							+"<br><B>Distance: </B>"+ GeoSearchList.getBobjGeoSchool().get(x).getDistance() +" Km." 
							+ "<br><B>URL: </B><A HREF=\"http://www.schulportal-thueringen.de/web/guest/schools/overview?tspi=" 
							+ GeoSearchList.getBobjGeoSchool().get(x).getGepa_id()+"\" TARGET=\"_blank\">http://www.schulportal-thueringen.de/web/guest/schools/overview?tspi="
							+GeoSearchList.getBobjGeoSchool().get(x).getGepa_id()+"</A>"+"')});";
				
			}
			
			read=read+"var point = new GLatLng("+GeoSearchList.getBobjGeoUser().getUser_latitude()+","+GeoSearchList.getBobjGeoUser().getUser_longitude()+");";
			read=read+"var coloricon = new GIcon(G_DEFAULT_ICON);";
			read=read+"coloricon.image = 'http://www.google.com/intl/en_us/mapfiles/ms/micons/blue-dot.png';";
			read=read+"coloricon.iconSize = new GSize(34,34);";
			read=read+"var opts = {icon: coloricon};";
			read=read+"var mark = new GMarker(point,opts);";
			read=read+"markerUser = new GMarker(point,opts);";
			read=read+"map.addOverlay(markerUser);";
			read=read+"GEvent.addListener(markerUser, 'click', function() {";
			read=read+"markerUser.openInfoWindowHtml('<div>"+Street+"<br><B>Postal Code: </B>"+Postal_code+"')});";
			read=read+"map.setCenter(new GLatLng("+GeoSearchList.getBobjGeoUser().getUser_latitude()+","+GeoSearchList.getBobjGeoUser().getUser_longitude()+"), 12, G_NORMAL_MAP);";
			
		}
        catch(NullPointerException e)
        {
       	 read="map.setCenter(new GLatLng(51.314,9.18), 5, G_NORMAL_MAP);";
        }

		return read;
	}


	public static BobjGeoSearch getGeoSearch(String Session_id,String Postal_code, String City, String Street, String Radius, String Number_of_nearest, String SchulType) throws Exception,NullPointerException
	{
	    BobjGeoSearch GeoSearch=new BobjGeoSearch();
	    
	    try
	    {
	        BobjGeoUser User=new BobjGeoUser();
	        User=getUser(Postal_code,City,Street);
	
	        List<BobjGeoSchool> Schools= new ArrayList<BobjGeoSchool>();
	
	        Schools=getSchools(Session_id,Number_of_nearest,Radius,User.getUser_longitude(),User.getUser_latitude(),SchulType);
	
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
	    catch(NullPointerException e)
        {
       	 read="map.setCenter(new GLatLng(51.314,9.18), 5, G_NORMAL_MAP);";
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
	        Logger.getLogger(GeoInformation.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    catch (RemoteException ex)
	    {
	        Logger.getLogger(GeoInformation.class.getName()).log(Level.SEVERE, null, ex);
	    }
	        return User;
	 }


	@SuppressWarnings("unchecked")
	public static List<BobjGeoSchool> getSchools
	 (String Session_id, String Number_of_nearest, String Radius, String User_longitude, String User_latitude,String SchulType) throws Exception,NullPointerException
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
	
	        if (callSchools.invoke( new Object[]{Session_id, Number_of_nearest,Radius,User_longitude,
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
        catch(NullPointerException e)
        {
       	 read="map.setCenter(new GLatLng(51.314,9.18), 5, G_NORMAL_MAP);";
        }
	    catch (ServiceException ex)
	    {
	        Logger.getLogger(GeoInformation.class.getName()).log(Level.SEVERE, null, ex);
	    }
	    catch (RemoteException ex)
	    {
	        Logger.getLogger(GeoInformation.class.getName()).log(Level.SEVERE, null, ex);
	    }
	   
	    for(int x=Schools.size()-1;x>0;x--)
	    {
	    	if(Schools.get(x).getlongitude().trim().toString().equals(Schools.get(x-1).getlongitude().trim().toString()))
	    	{
	    		float newLat=(float) (Float.parseFloat(Schools.get(x-1).getlongitude())+.0001);
	    		Schools.get(x-1).setlongitude(Float.toString(newLat));
	    	}
	
	    }
	
	
	    return Schools;
	 }


}
