package com.topdev.tsp.model.aop;

import java.io.ByteArrayOutputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.topdev.tsp.exception.PermissionException;

public class SessionBean implements Serializable
{
	private static final long					serialVersionUID		= 1L;
	
	public static String						viewObjectPrefix		= "viewObject.";
	public static String						mainObjectPrefix		= "mainObject.";
	public	Log									log						= LogFactory.getLog(this.getClass());
	private Map<String, Map<Object, Object>>	sessionObjects			= new HashMap<String, Map<Object, Object>>();
	private Map<String, Date>					sessionTimes			= new HashMap<String, Date>();
	private Map<String, List<String>>			sessionMainObjectNames	= new HashMap<String, List<String>>();
	private Map<String, Map<Long, String>>		sessionViewStates		= new HashMap<String, Map<Long, String>>(); //sessions vsid tspi
	
	private Date								lastCleanUp				= new Date();
	private long								sessionTimeout			= 60*60*4;//sessionTimeout (in sekunden). default:4h
	private List<String>						testSessions			= new ArrayList<String>(100);
	private ConfigurationBean					configurationBean;
	private long								lastVsid				= 0;
	
	public int getSessionCount(String ip, String sessionId)
	{
		int count = 0;
		sessionTimes.put(sessionId, new Date());
		if(getConfigurationBean().getTestIPs().contains(ip)) setTestSession(sessionId);
		Iterator sessionIterator = sessionObjects.keySet().iterator();
		while(sessionIterator.hasNext()) if(!testSessions.contains(sessionIterator.next())) count++;
		return count;
	}
	public void setTestSession(String sessionId)
	{
		if(!testSessions.contains(sessionId))
			testSessions.add(sessionId);
	}
	//räumt nicht gelöschte "Leichen" weg
	public void cleanUp()
	{
		//Setze sessionTimeout (in sekunden)
		setSessionTimeout(getConfigurationBean().getSessionTimeout()*10);
		List<String> removeList = new ArrayList<String>(2);
		Date now = new Date();
		if(now.getTime()-lastCleanUp.getTime() > 9600000) //checke alle 2h 40min
		{
			Entry<String, Date> entry;
			Date eDate;
			Iterator<Entry<String, Date>> it = sessionTimes.entrySet().iterator();
			while(it.hasNext())
			{
				entry = it.next();
				eDate = entry.getValue();
				if(eDate!=null && now.getTime()-eDate.getTime()>(sessionTimeout*1000))
				{
					log.debug("trigger removeSessionBean because of cleanUp");
					removeList.add(entry.getKey());
				}
			}
			removeSessionObjects(removeList);
		}
	}
	
	public Object getAttribute(String sessionId, String attribute)
	{
		if(sessionObjects.get(sessionId)==null) return null;
		if(sessionTimes.get(sessionId)!=null) sessionTimes.put(sessionId, new Date());
		return sessionObjects.get(sessionId).get(attribute);
	}
	
	public boolean isVsidValid(String sessionId, String vsid, String id)
	{
		String t_id = sessionViewStates.get(sessionId).get(Long.parseLong(vsid));
		if(t_id == null || !t_id.equals(id)) return false;
		return true;
	}
	
	public void setAttribute(String sessionId, String attribute, Object value) throws PermissionException
	{
		log.debug("    setAttribute <- "+sessionId+", "+attribute+", "+value);
		if(sessionObjects.get(sessionId)==null) createSessionObject(sessionId);
		if(sessionObjects.get(sessionId)!=null)
		{
			if(attribute!=null && attribute.startsWith(mainObjectPrefix))
			{
				List<String>		mainObjectNames = sessionMainObjectNames.get(sessionId);
				Map<Long, String>	viewStates		= sessionViewStates.get(sessionId);
				
				String t_sVsid =  attribute.replaceFirst(mainObjectPrefix, "");
				t_sVsid = t_sVsid.substring(0, t_sVsid.indexOf("."));
				if(viewStates.get(Long.parseLong(t_sVsid))==null)
					throw new PermissionException("Sie besitzen keine Berechtigung um auf das angeforderte Objekt zuzugreifen");
				
				mainObjectNames.add(attribute);
				if(mainObjectNames.size()>5)
				{
					removeAttribute(sessionId, mainObjectNames.get(0));
					mainObjectNames.remove(0);
				}
			}

			sessionObjects.get(sessionId).put(attribute, value);
			sessionTimes.put(sessionId, new Date());
		}
	}
	public int getSessionSize(String sessionId)
	{
		int result = -1;
		try
		{
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(sessionObjects.get(sessionId));
			oos.close();
			baos.close();
			result = baos.size();
		}
		catch(Exception e) { e.printStackTrace(); }
		return result;
	}
	
	public int getSize()
	{
		int result = -1;
		try
		{
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			ObjectOutputStream oos = new ObjectOutputStream(baos);
			oos.writeObject(this);
			oos.close();
			baos.close();
			result = baos.size();
		}
		catch(Exception e) { e.printStackTrace(); }
		return result;
	}

	public void removeViewAttributes(String sessionId)
	{
		log.debug("    removeViewAttributes <- "+sessionId);
		if(sessionObjects.get(sessionId)==null) createSessionObject(sessionId);
		if(sessionObjects.get(sessionId)!=null)
		{
			Map<Object, Object> map = sessionObjects.get(sessionId);
			Object[] oNames = (Object[]) map.keySet().toArray();
			for(int i=0; i<oNames.length; i++)
			{
				if(String.valueOf(oNames[i]).startsWith(viewObjectPrefix))
					map.remove(oNames[i]);
			}
		}
	}

	public void removeAttribute(String sessionId, String attribute)
	{
		log.debug("    removeAttribute <- "+sessionId+", "+attribute);
		if(sessionObjects.get(sessionId)==null) createSessionObject(sessionId);
		if(sessionObjects.get(sessionId)!=null)
		{
			sessionObjects.get(sessionId).remove(attribute);
			sessionTimes.put(sessionId, new Date());
		}
	}
	
	private void createSessionObject(String sessionId)
	{
		if(sessionId == null) log.debug("SessionID >null< ist fuer ein SessionObject nicht zulaesig");
		else
		{
			log.debug("    createSessionObject <- "+sessionId);
			cleanUp();
			sessionObjects.put(sessionId,			new HashMap<Object, Object>());
			sessionMainObjectNames.put(sessionId,	new ArrayList<String>(1));
			sessionViewStates.put(sessionId,		new HashMap<Long, String>(20));
			sessionTimes.put(sessionId,				new Date());
		}
	}

	public void removeSessionObject(String sessionId)
	{
		log.debug("    removeSessionBean <- "+sessionId);
		sessionObjects.remove(			sessionId);
		sessionTimes.remove(			sessionId);
		testSessions.remove(			sessionId);
		sessionMainObjectNames.remove(	sessionId);
		sessionViewStates.remove(		sessionId);
	}
	public void removeSessionObjects(List<String> sessionIds)
	{
		log.debug("    removeSessionBeans <- Count:"+sessionIds.size());
		String sessionId;
		Iterator<String> it = sessionIds.iterator();
		while(it.hasNext()) removeSessionObject(it.next());
	}

	public long getSessionTimeout()
	{
		return sessionTimeout;
	}

	public void setSessionTimeout(long sessionTimeout)
	{
		this.sessionTimeout = sessionTimeout;
	}
	public ConfigurationBean getConfigurationBean()
	{
		return configurationBean;
	}
	public void setConfigurationBean(ConfigurationBean configurationBean)
	{
		this.configurationBean = configurationBean;
	}
	public String createVsid(String sessionId, String tspi)
	{
		long newVsid = lastVsid++;
		sessionViewStates.get(sessionId).put(newVsid, tspi);
		return String.valueOf(newVsid);
	}
}

