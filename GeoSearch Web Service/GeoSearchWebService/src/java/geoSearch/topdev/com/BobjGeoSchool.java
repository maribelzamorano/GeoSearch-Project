package geoSearch.topdev.com;



import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlType;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "BobjGeoSchool", propOrder = {
    "longitude",
    "latitude",
    "distance",
    "schulName",
    "cc_plz_ort",
    "cc_strasse",
    "krei_id",
    "schu_id",
    "gepa_id",
     //   "url",
    "radius",
    "numberOfNearest",
    "userLongitude",
    "userLatitude",
    "spss_code",
    "suchbegriff",
    "gepa_id_traeger",
    "page",
    "plz",
    "max_char",
    "dien_nr",
    "gepa_name",
    "ort",
    "rows",
    "session_id",
    "rc",
    "rowCounter",
    "use_resultset",
    "sql_error",
    "rc_text"


})
public class BobjGeoSchool implements Serializable
{
        private static final long	serialVersionUID	= 1L;
        private String longitude;
        private String latitude;
        private String distance;
	private String schulName;
        private String cc_plz_ort;
	private String cc_strasse;
   //     private String schultraeger;
        private String krei_id;
        private String schu_id;
        private String gepa_id;
        //	private String url;
        private String radius;
	private String numberOfNearest;
        private String userLongitude;
        private String userLatitude;
        private String spss_code;
	private String suchbegriff;
        private String gepa_id_traeger;
	private String page;
	private String plz;
	private String max_char;
        private String dien_nr;
	private String gepa_name;
        private String ort;
	private String rows;
        private String session_id;
        private String rc;
	private String rowCounter;
        private String use_resultset;
        private String sql_error;
	private String rc_text;


        public String getlongitude()
	{
		return longitude;
	}
	public void setlongitude(String longitude)
	{
		this.longitude = longitude;
	}

	public String getlatitude()
	{
		return latitude;
	}
	public void setlatitude(String latitude)
	{
		this.latitude = latitude;
	}


	public String getDistance()
	{
		return distance;
	}
	public void setDistance(String distance)
	{
		this.distance = distance;
	}


	public String getSchulName()
	{
		return schulName;
	}
	public void setSchulName(String schulName)
	{
		this.schulName = schulName;
	}

	public String getcc_plz_ort()
	{
		return cc_plz_ort;
	}
	public void setcc_plz_ort(String cc_plz_ort)
	{
		this.cc_plz_ort = cc_plz_ort;
	}


	public String getcc_strasse()
	{
		return cc_strasse;
	}
	public void setcc_strasse(String cc_strasse)
	{
		this.cc_strasse = cc_strasse;
	}



        public String getRadius()
	{
		return radius;
	}
	public void setRadius(String radius)
	{
		this.radius = radius;
	}


        public String getNumberOfNearest()
	{
		return numberOfNearest;
	}
	public void setNumberOfNearest(String numberOfNearest)
	{
		this.numberOfNearest = numberOfNearest;
	}


        public String getUserLongitude()
	{
		return userLongitude;
	}
	public void setUserLongitude(String userLongitude)
	{
		this.userLongitude = userLongitude;
	}


        public String getUserLatitude()
	{
		return userLatitude;
	}
	public void setUserLatitude(String userLatitude)
	{
		this.userLatitude = userLatitude;
	}


        public String getSpss_code()
	{
		return spss_code;
	}
	public void setSpss_code(String spss_code)
	{
		this.spss_code = spss_code;
	}


        public String getSuchbegriff()
	{
		return suchbegriff;
	}
	public void setSuchbegriff(String suchbegriff)
	{
		this.suchbegriff = suchbegriff;
	}


        public String getGepa_id_traeger()
	{
		return gepa_id_traeger;
	}
	public void setGepa_id_traeger(String gepa_id_traeger)
	{
		this.gepa_id_traeger = gepa_id_traeger;
	}


        public String getPage()
	{
		return page;
	}
	public void setPage(String page)
	{
		this.page = page;
	}


        public String getKrei_id()
	{
		return krei_id;
	}
	public void setKrei_id(String krei_id)
	{
		this.krei_id = krei_id;
	}


        public String getPlz()
	{
		return plz;
	}
	public void setPlz(String plz)
	{
		this.plz = plz;
	}


        public String getMax_char()
	{
		return max_char;
	}
	public void setMax_char(String max_char)
	{
		this.max_char = max_char;
	}


        public String getSession_id()
	{
		return session_id;
	}
	public void setSession_id(String session_id)
	{
		this.session_id = session_id;
	}


        public String getSchu_id()
	{
		return schu_id;
	}
	public void setSchu_id(String schu_id)
	{
		this.schu_id = schu_id;
	}

        public String getGepa_id()
	{
		return gepa_id;
	}
	public void setGepa_id(String gepa_id)
	{
		this.gepa_id = gepa_id;
	}

        public String getDien_nr()
	{
		return dien_nr;
	}
	public void setDien_nr(String dien_nr)
	{
		this.dien_nr = dien_nr;
	}


        public String getGepa_name()
	{
		return gepa_name;
	}
	public void setGepa_name(String gepa_name)
	{
		this.gepa_name = gepa_name;
	}


        public String getOrt()
	{
		return ort;
	}
	public void setOrt(String ort)
	{
		this.ort = ort;
	}


        public String getRows()
	{
		return rows;
	}
	public void setRows(String rows)
	{
		this.rows = rows;
	}


        public String getRc()
	{
		return rc;
	}
	public void setRc(String rc)
	{
		this.rc = rc;
	}


        public String getRowCounter()
	{
		return rowCounter;
	}
	public void setRowCounter(String rowCounter)
	{
		this.rowCounter = rowCounter;
	}


        public String getUse_resultset()
	{
		return use_resultset;
	}
	public void setUse_resultset(String use_resultset)
	{
		this.use_resultset = use_resultset;
	}

        public String getSql_error()
	{
		return sql_error;
	}
	public void setSql_error(String sql_error)
	{
		this.sql_error = sql_error;
	}


        public String getRc_text()
	{
		return rc_text;
	}
	public void setRc_text(String rc_text)
	{
		this.rc_text = rc_text;
	}




}

