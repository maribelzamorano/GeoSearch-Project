package com.topdev.tsp.action.lib;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class MediumTokenizer
{
	static SecretKeySpec keyspec = new SecretKeySpec(Base64.decodeBase64("7rFNKQgCmzGphZGbiUQURw==".getBytes()), "AES");
	static Cipher c = null;
	static
	{
		try
		{
			c = Cipher.getInstance("AES/CBC/PKCS5Padding");
			c.init(Cipher.ENCRYPT_MODE, keyspec, new IvParameterSpec("@Pn6Hl=2Ghy9MQf&".getBytes() ));
		}
		catch (Exception e) { e.printStackTrace(); }
	}
	
	public static String getToken(Date date) throws IllegalBlockSizeException, BadPaddingException
	{
		DateFormat df = DateFormat.getDateTimeInstance();
		TimeZone tz = TimeZone.getTimeZone("GMT+1:00");
		
		Locale locale = new Locale("de"); 
		SimpleDateFormat df0 = new SimpleDateFormat("dd.MM.yyyy HH:mm", locale);
		SimpleDateFormat df1 = new SimpleDateFormat("dMm", locale);
		SimpleDateFormat df2 = new SimpleDateFormat("yy", locale);
		SimpleDateFormat df3 = new SimpleDateFormat("H", locale);
		df0.setTimeZone(tz);
		df1.setTimeZone(tz);
		df2.setTimeZone(tz);
		df3.setTimeZone(tz);
		
		String token = df1.format(date);
		token += df2.format(date);
		token += df3.format(date);
		//System.out.println("Grundlage der Tokenberechnung:"+df0.format(date)+" -> "+token);
		byte[] code = token.getBytes();
		byte[] result = c.doFinal(code);
        token = "";
        for(int i=0; i<result.length; i++) token+=Integer.toHexString(0xFF & result[i]);
        return token;
	}
} 