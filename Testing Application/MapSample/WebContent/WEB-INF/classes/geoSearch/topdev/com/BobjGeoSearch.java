
package geoSearch.topdev.com;




import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;



@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BobjGeoSearch", propOrder = {
    "BobjGeoSchool","BobjGeoUser"
})
public class BobjGeoSearch implements Serializable {
	private static final long	serialVersionUID	= 1L;
	private List<BobjGeoSchool> BobjGeoSchool = new ArrayList<BobjGeoSchool>();
	private BobjGeoUser BobjGeoUser;
	public void add(BobjGeoSchool BobjGeoSchool)
	{
		this.BobjGeoSchool.add(BobjGeoSchool);
	}
	public List<BobjGeoSchool> getContent()
	{
		return BobjGeoSchool;
	}
    public BobjGeoUser getBobjGeoUser()
	{
		return  BobjGeoUser;
	}
	public void setBobjGeoUser(BobjGeoUser BobjGeoUser)
	{
		this.BobjGeoUser = BobjGeoUser;
	}
}