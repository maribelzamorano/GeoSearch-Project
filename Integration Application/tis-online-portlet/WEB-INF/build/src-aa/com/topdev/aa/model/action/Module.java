package com.topdev.aa.model.action;

import java.io.Serializable;

import com.topdev.aa.object.MainObject;

public interface Module extends Serializable, Default
{
	public void initMainObject(String mainObjectName);
	
	public MainObject getMainObject();
	public void setMainObject(MainObject mainObject);
	public String getMainObjectName();
	public void setMainObjectName(String mainObjectName);
	public void setVsid(String s);
	public String getVsid();
	public void setMode(String s);
	public String getMode();
	public void setName(String s);
	public String getName();
	public String getState();
	public void setState(String state);

}