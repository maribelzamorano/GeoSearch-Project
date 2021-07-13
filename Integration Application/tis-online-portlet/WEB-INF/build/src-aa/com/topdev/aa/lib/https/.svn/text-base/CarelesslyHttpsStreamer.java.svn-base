package com.topdev.aa.lib.https;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

import javax.net.ssl.KeyManager;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

public class CarelesslyHttpsStreamer
{
	public InputStream getStream(String p1, String p2) throws Exception	{return streamer(p1,p2);	}
	public InputStream getStream(String p1) throws Exception				{return streamer(p1,null);	}
	protected InputStream streamer(String sUrl, String protocol) throws Exception
	{
		String handler=System.getProperty("java.protocol.handler.pkgs");
		System.setProperty("java.protocol.handler.pkgs", "");
		int schwellenwert=100000;
		byte[] buffer=new byte[schwellenwert];
		if(protocol==null) protocol="SSl";
		URL url = new URL(sUrl);
		String out="";
		URLConnection uCon = null;
		javax.net.ssl.HttpsURLConnection connection=null;
		SSLSocketFactory sslSF = null; 
		KeyManager[] km = null; 
		TrustManager[] tm = {new AllowAllX509TrustManager()};
		SSLContext sslContext = SSLContext.getInstance(protocol);
		sslContext.init(null, tm, new java.security.SecureRandom());
		sslSF = sslContext.getSocketFactory();

//		try
//		{
			uCon = url.openConnection();
			connection = (javax.net.ssl.HttpsURLConnection)uCon;
			connection.setHostnameVerifier(new MyHostnameVerifier());
			connection.setSSLSocketFactory(sslSF);
			connection.setDoInput(true);
//		} 
//			catch(Exception ex){throw new Exception(
//				"url:"+sUrl+"\n"+
//				"protocol:"+protocol+"\n"+
//				"urLconnection:"+uCon+"\n"+
//				"httpSconnection:"+connection+"\n"+
//				"out:"+out+"\n"+
//				"error:"+ex.toString()+"\n");}
				
		InputStream is = uCon.getInputStream();

		
		//	Certificate certs[] = connection.getServerCertificates();
		//	for(int i=0; i<certs.length; i++)
		//		System.out.println("Certificate["+i+"]: " + certs[i]);

		int i=0;
		try
		{
			int n=is.read(); while(n!=-1)
			{
					buffer[i]=(byte)n; i++;
					n=is.read();
			}
		}
			catch (Exception ex)
		{
			throw new Exception("Die maximale Dateigroesse von 20k bytes wurde ueberschritten.\n"+ex.toString());
		}
		System.setProperty("java.protocol.handler.pkgs", handler);
		return (InputStream) new ByteArrayInputStream(buffer,0,i) ;
	}
}