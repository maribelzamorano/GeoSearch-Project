package geoSearch.topdev.com;


import java.util.ArrayList;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

/**
 *
 * @author maribelzamorano
 */


@WebService()
public class GeoSearchWS {

    /**
     * Web service operation
     */
    @WebMethod(operationName = "getGeoSearch")
    public BobjGeoSearch GeoSearch(
    @WebParam(name = "Session_id") String Session_id,
    @WebParam(name = "Postal_code") String Postal_code,
    @WebParam(name = "City") String City,
    @WebParam(name = "Street") String Street,
    @WebParam(name = "Number_of_nearest") String Number_of_nearest,
    @WebParam(name = "Radius") String Radius,
    @WebParam(name = "SchulType") String SchulType
    ) throws Exception {


        BobjGeoUser User=getUser(Postal_code,City,Street);

        List<BobjGeoSchool> SchoolList= new ArrayList<BobjGeoSchool>();
        SchoolList=  getSchools(Session_id,Number_of_nearest,Radius,User.getUser_longitude(),User.getUser_latitude(),SchulType);

        try
        {
            BobjGeoSearch GeoSearch=new BobjGeoSearch();
            BobjGeoSchool School;
            for(int x = 0;x<SchoolList.size();x++)
            {
                   School=SchoolList.get(x);
                   GeoSearch.setBobjGeoSchool(School);
            }
            GeoSearch.setBobjGeoUser(User);

            return GeoSearch;
        }
        catch (Exception  e)
        {
            throw new Exception("There was an error while adding the information to BobjGeoSearch.\n" + e);
        }
    }


    @WebMethod(operationName = "getUser")
    public BobjGeoUser getUser(
    @WebParam(name = "Postal_code")String Postal_code,
    @WebParam(name = "City") String City,
    @WebParam(name = "Street")String Street
    ) throws Exception
    {
        try
        {
          BobjGeoUser User=new BobjGeoUser();

          User.setUser_postalcode(Postal_code);
          User.setUser_street(Street);
          User.setUser_city(City);
          
          User = GeoUserHelper.getUserGeoInformation(User);

          return User;
        }
        catch (Exception  e)
        {
            throw new Exception("There was an error while getting user geo-information.\n" + e);
        }
    }


    @WebMethod(operationName = "getSchools")
    public List<BobjGeoSchool> getSchools(
    @WebParam(name = "Session_id") String Session_id,
    @WebParam(name = "Number_of_nearest") String Number_of_nearest,
    @WebParam(name = "Radius") String Radius,
    @WebParam(name = "User_longitude") String User_longitude,
    @WebParam(name = "User_latitude") String User_latitude,
    @WebParam(name = "SchulType") String SchulType ) throws Exception
    {
        try
        {
          BobjGeoSchool Schools=new BobjGeoSchool();

          Schools.setNumberOfNearest(Number_of_nearest);
          Schools.setRadius(Radius);
          Schools.setSession_id(Session_id); 
          Schools.setSpss_code("20");
          Schools.setMax_char("70");
          Schools.setUserLongitude(User_longitude);
          Schools.setUserLatitude(User_latitude);
          Schools.setSchu_id(SchulType);

          List<BobjGeoSchool> SchoolsGeoInformation = GeoSchoolHelper.getSchoolGeoInformation(Schools);

          return SchoolsGeoInformation;
        }
        catch (Exception  e)
        {
            throw new Exception("There was an error while getting the schools geo-information.\n" + e);
        }
    }

}
