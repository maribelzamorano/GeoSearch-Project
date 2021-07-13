package geoSearch.topdev.com;

import java.sql.SQLException;
import java.util.List;

public class GeoSchoolHelper extends Helper
{
	public static List getSchoolGeoInformation(BobjGeoSchool BobjGeoSchool) throws SQLException
	{
		return Mapper().queryForList("School.getGeoSearchResults", BobjGeoSchool);
	}
}
