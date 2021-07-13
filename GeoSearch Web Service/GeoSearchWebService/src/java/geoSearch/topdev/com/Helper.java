
package geoSearch.topdev.com;

/**
 *
 * @author 2gfa
 */
import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import java.io.*;


/**
 *
 * @author 2gfa
 */

public class Helper{

private static final SqlMapClient _Mapper;

static
{
    try
     {
        String resource = "Resources/sqlmap.xml";
        Reader reader = Resources.getResourceAsReader (resource);
        _Mapper = SqlMapClientBuilder.buildSqlMapClient(reader);
     }
    catch (Exception e)
     {
        e.printStackTrace();
        throw new RuntimeException ("Error initializing Helper class. Cause: " + e);
     }

 }

public static SqlMapClient Mapper()
{
        return _Mapper;
}


}