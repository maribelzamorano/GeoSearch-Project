package com.topdev.tsp.action.modules.medium.detail.links;

import com.topdev.aa.lib.Validator;
import com.topdev.aa.model.action.Portlet;
import com.topdev.aa.model.action.PortletImpl;
import com.topdev.service.medium.Client;

public class ViewAction extends PortletImpl implements Portlet
{
	private static final long	serialVersionUID	= 1L;
    String linktext = new String();
    
    public String view() throws Exception
	{
        if(Validator.empty(getUserName()) && !Client.getIsPublicByMediumId(getUserName(), getTspi()) ) return "login";
		linktext = com.topdev.service.mediumexternelinks.Client.getByMediumId(getUserName(),getTspi());
		return "success";
	}
    public Object getSessionAttribute(String key)
    {
        return getSession().get(key);
    }

    public String getLinktext() {
        return linktext;
    }

    public void setLinktext(String linktext) {
        this.linktext = linktext;
    }
}