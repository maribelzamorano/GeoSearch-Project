package com.topdev.aa.model.action;

import java.io.Serializable;

import com.topdev.aa.object.MainObject;

public interface Submodule extends Serializable, Default
{
	public MainObject getMainObject();
	public void setMainObject(MainObject mainObject);
	public String getMainObjectName();
	public void setMainObjectName(String mainObjectName);
	public void setVsid(String s);
	public String getVsid();
	public void setMode(String s);
	public String getMode();

}