
package geoSearch.topdev.com;


import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author maribelzamorano
 */

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BobjGeoSearch", propOrder = {
    "BobjGeoSchool","BobjGeoUser"
})
public class BobjGeoSearch implements Serializable {
	private static final long	serialVersionUID	= 1L;
        private List<BobjGeoSchool> BobjGeoSchool = new ArrayList<BobjGeoSchool>();
        private BobjGeoUser BobjGeoUser;

        public List<BobjGeoSchool> getBobjGeoSchool()
	{
                 return this.BobjGeoSchool;
	}

        public void setBobjGeoSchool(BobjGeoSchool BobjGeoSchool)
	{
		this.BobjGeoSchool.add(BobjGeoSchool);
	}
	
        public BobjGeoUser getBobjGeoUser()
	{
		return  this.BobjGeoUser;
	}
	public void setBobjGeoUser(BobjGeoUser BobjGeoUser)
	{
		this.BobjGeoUser = BobjGeoUser;
	}
}
