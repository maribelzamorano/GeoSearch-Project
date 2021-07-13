package com.topdev.tsp.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.axis2.AxisFault;

import com.topdev.service.data.BobjKodierung;
import com.topdev.service.data.BobjStandard;

public class SchulamtServiceClient extends ServiceClient
{
	public static List<BobjKodierung> getAll(String user) throws AxisFault
	{
		Object[] serviceResponse = (Object[]) invokeService(
				"SchulamtService", 
				"getAll", 
				"http://data.service.topdev.com/xsd", 
				new Object[]	{ }, 
				new Class[]		{ BobjKodierung[].class });

		if(serviceResponse==null || serviceResponse.length<1) return new ArrayList<BobjKodierung>(0);
		else return Arrays.asList((BobjKodierung[])serviceResponse[0]);
	}

	public static String getVersion(String user) throws AxisFault
	{
		Object[] serviceResponse = invokeService(
				"SchulamtService", 
				"getVersion", 
				"http://schulamt.service.topdev.com", 
				new Object[] { new BobjStandard(user) }, 
				new Class[]	{ String.class });

        if(serviceResponse!=null && serviceResponse.length>0) return (String) serviceResponse[0];
        else return null;
	}
}