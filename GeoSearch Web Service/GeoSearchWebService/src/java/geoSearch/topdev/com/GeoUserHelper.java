package geoSearch.topdev.com;

import java.sql.SQLException;


/**
 *
 * @author maribelzamorano
 */
public class GeoUserHelper extends Helper{

        public static BobjGeoUser getUserGeoInformation(BobjGeoUser BobjGeoUser) throws SQLException
	{
		return (BobjGeoUser) Mapper().queryForObject("User.getGeoSearchResults", BobjGeoUser);
	}

}
