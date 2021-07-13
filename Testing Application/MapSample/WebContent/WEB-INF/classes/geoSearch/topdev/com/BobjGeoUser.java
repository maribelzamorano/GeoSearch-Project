package geoSearch.topdev.com;


import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BobjGeoUser", propOrder = {
    "user_longitude",
    "user_latitude",
    "user_postalcode",
    "user_city",
    "user_street"


})

public class BobjGeoUser implements Serializable
{
    private static final long	serialVersionUID	= 1L;
    private String user_postalcode;
    private String user_city;
    private String user_street;
    private String user_longitude;
    private String user_latitude;

    public String getUser_postalcode()
    {
            return user_postalcode;
    }
    public void setUser_postalcode(String user_postalcode)
    {
            this.user_postalcode = user_postalcode;
    }


    public String getUser_city()
    {
            return user_city;
    }
    public void setUser_city(String user_city)
    {
            this.user_city = user_city;
    }


    public String getUser_street()
    {
            return user_street;
    }
    public void setUser_street(String user_street)
    {
            this.user_street = user_street;
    }

    
    public String getUser_longitude()
    {
            return user_longitude;
    }
    public void setUser_longitude(String user_longitude)
    {
            this.user_longitude = user_longitude;
    }


    public String getUser_latitude()
    {
            return user_latitude;
    }
    public void setUser_latitude(String user_latitude)
    {
            this.user_latitude = user_latitude;
    }



}