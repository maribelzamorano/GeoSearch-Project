//erstellt am 24.10.2003
//von HannesWeichel

package com.topdev.aa.lib;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailSender 
{
	public String	smtpHost		= "";
	public boolean	authenticate	= true;
	public boolean	debug			= false;

	public String	subject			= "";
	public String	body			= "";
	public String	attachement		= null;
	public String	attachementTyp	= "us-ascii";
	public String	from			= null;
	public String	to				= null;
	public String	username		= null;
	public String	password		= null;
	public String	error			= null;



	public boolean send()
	{

		Properties props			=new Properties();
		Session session				=null;
		MimeMessage msg				=null;
		MimeBodyPart mbp1			=null;
		Multipart mp				=null;
		MimeBodyPart mbp2			=null;


		try
		{
			props.put("mail.smtp.host", this.smtpHost);
			props.put("mail.smtp.auth", authenticate?"true":"false");
		} catch (Exception ex)
		{
			this.error="0->"+ex.toString()+"("+this.smtpHost+")";
			return false;
		}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		try
		{
			session = Session.getDefaultInstance(props, new MailAuthenticator(this.username, this.password));
		} catch (Exception ex)
		{
			this.error="1->"+ex.toString();
			return false;
		}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		try
		{
			session.setDebug(this.debug);
		} catch (Exception ex)
		{
			this.error="2->"+ex.toString();
			return false;
		}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		try
		{
			msg = new MimeMessage(session);
			msg.setFrom(new InternetAddress(this.from));
			InternetAddress[] address = {new InternetAddress(this.to)};
			msg.setRecipients(Message.RecipientType.TO, address);
			msg.setSubject(this.subject);
			msg.setSentDate(new Date());
		} catch (Exception ex)
		{
			this.error="3->"+ex.toString();
			return false;
		}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		try
		{
			mbp1 = new MimeBodyPart();
			//mbp1.setHeader("Content-Type", "text/plain; charset=\"iso-8859-15\"") ;

			mbp1.setText(body,"iso-8859-1");

			mp = new MimeMultipart();

			mp.addBodyPart(mbp1);

			if(this.attachement!=null)
			{
				mbp2 = new MimeBodyPart();
				mbp2.setText(attachement, this.attachementTyp);
				mp.addBodyPart(mbp2);
			}
		} catch (Exception ex)
		{
			this.error="4->"+ex.toString();
			return false;
		}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
		try
		{
			msg.setContent(mp);
			Transport.send(msg);
		} catch (Exception ex)
		{
			this.error="5->"+ex.toString();
			return false;
		}
		return true;
	}




}