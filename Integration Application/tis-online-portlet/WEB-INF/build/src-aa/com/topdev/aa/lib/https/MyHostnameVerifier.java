package com.topdev.aa.lib.https;

import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSession;

//import com.sun.net.ssl;

public class MyHostnameVerifier implements HostnameVerifier
{
	public boolean verify(String hostname, SSLSession session)
	{
		return true;
	}
};