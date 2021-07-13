package com.topdev.aa.data.object;

import com.topdev.aa.data.form.ConfigFormForm;
import com.topdev.aa.data.form.ConfigListForm;
import com.topdev.aa.data.form.ConfigTextForm;

/**
 * @author hannesweichel
 */

public class ConfigObject
{
	public ConfigFormForm form;
	public ConfigListForm list;
	public ConfigTextForm text;
	
	public ConfigObject()
	{
		this.form = new ConfigFormForm();
		this.list = new ConfigListForm();
		this.text = new ConfigTextForm();
	}
}
