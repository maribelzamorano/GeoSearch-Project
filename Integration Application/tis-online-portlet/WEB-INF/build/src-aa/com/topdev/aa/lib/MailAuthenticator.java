//erstellt am 24.10.2003
//von HannesWeichel

package com.topdev.aa.lib;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuthenticator extends Authenticator 
{
	public String username, password;

	public MailAuthenticator(String p1, String p2)
	{
		this.username	=p1;
		this.password	=p2;
	}

	public PasswordAuthentication getPasswordAuthentication() 
	{
		return new PasswordAuthentication(this.username, this.password);
	}
}