package com.topdev.tsp.action.modules.medium.logview;

import com.topdev.aa.model.action.Default;
import com.topdev.aa.model.action.DefaultImpl;

public class ViewAction extends DefaultImpl implements Default
{
    private static final long   serialVersionUID    = 1L;
    
    public String view() throws Exception
    {
        return "success";
    }
}