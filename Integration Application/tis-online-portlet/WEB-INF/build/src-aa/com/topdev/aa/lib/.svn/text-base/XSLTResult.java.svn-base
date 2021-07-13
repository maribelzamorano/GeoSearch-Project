package com.topdev.aa.lib;

import java.io.File;
import java.io.IOException;
import java.io.Writer;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import java.util.StringTokenizer;

import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletRequestDispatcher;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.URIResolver;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.StrutsResultSupport;
import org.apache.struts2.portlet.PortletActionConstants;
import org.apache.struts2.portlet.context.PortletActionContext;
import org.apache.struts2.views.xslt.AdapterFactory;
import org.apache.struts2.views.xslt.ServletURIResolver;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.util.TextUtils;

public class XSLTResult extends StrutsResultSupport
{
    private static final long	serialVersionUID	= 1L;
        private String contentType = "text/html";
        private String location;
        private String title;
        private static final Log LOG = LogFactory.getLog(XSLTResult.class);
        public static final String DEFAULT_PARAM = "stylesheetLocation";
        private static final Map<String, Templates> templatesCache;
    	static
    	{
            templatesCache = new HashMap<String, Templates>();
        }
        protected boolean noCache = true;
        private String stylesheetLocation;
        private String matchingPattern;
        private String exludingPattern;
        private String exposedValue;
        private boolean parse;
        private AdapterFactory adapterFactory;
        
        public XSLTResult()
        {
        }

        public XSLTResult(String stylesheetLocation) 
        {
            this();
            setStylesheetLocation(stylesheetLocation);
        }
        
 //       @Inject(StrutsConstants.STRUTS_XSLT_NOCACHE)
        public void setNoCache(String val) {
            noCache = "true".equals(val);
        }
        
        public void setLocation(String location) {
            setStylesheetLocation(location);
        }
        public void setStylesheetLocation(String location) {
            if (location == null)
                throw new IllegalArgumentException("Null location");
            this.stylesheetLocation = location;
            this.location = location;
        }
       public String getStylesheetLocation() {
            return stylesheetLocation;
        }
        public String getExposedValue() {
            return exposedValue;
        }
        public void setExposedValue(String exposedValue) {
            this.exposedValue = exposedValue;
        }
        public String getMatchingPattern() {
            return matchingPattern;
        }
        public void setMatchingPattern(String matchingPattern) {
            this.matchingPattern = matchingPattern;
        }
        public String getExludingPattern() {
            return exludingPattern;
        }
        public void setExludingPattern(String exludingPattern) {
            this.exludingPattern = exludingPattern;
        }
        public void setParse(boolean parse) {
            this.parse = parse;
        }

        public void doExecute(String finalLocation,
                ActionInvocation actionInvocation) throws Exception {
        	this.invocation = actionInvocation;
            if (PortletActionContext.isRender()) {
                executeRenderResult(finalLocation);
            } else if (PortletActionContext.isEvent()) {
                executeActionResult(finalLocation, actionInvocation);
            } else {
                executeRegularServletResult(finalLocation, actionInvocation);
            }
        }

        private void executeRegularServletResult(String finalLocation, ActionInvocation actionInvocation) throws ServletException, IOException
        {
            ServletContext ctx = ServletActionContext.getServletContext();
            HttpServletRequest req = ServletActionContext.getRequest();
            HttpServletResponse res = ServletActionContext.getResponse();
            try {
                ctx.getRequestDispatcher(finalLocation).include(req, res);
            } catch (ServletException e) {
                LOG.error("ServletException including " + finalLocation, e);
                throw e;
            } catch (IOException e) {
                LOG.error("IOException while including result '" + finalLocation + "'", e);
                throw e;
            }
        }

        /**
         * Executes the action result.
         *
         * @param finalLocation
         * @param invocation
         */
        private ActionInvocation invocation;
        protected void executeActionResult(String finalLocation, ActionInvocation invocation)
        {
        	this.invocation = invocation;
            ActionResponse res = PortletActionContext.getActionResponse();
            if (finalLocation.indexOf('?') != -1)
            {
                convertQueryParamsToRenderParams(res, finalLocation.substring(finalLocation.indexOf('?') + 1));
                finalLocation = finalLocation.substring(0, finalLocation.indexOf('?'));
            }
            if (finalLocation.endsWith(".action"))
            {
                // View is rendered with a view action...luckily...
                finalLocation = finalLocation.substring(0, finalLocation.lastIndexOf("."));
                res.setRenderParameter(PortletActionConstants.ACTION_PARAM, finalLocation);
            }
            else
            {
                // View is rendered outside an action...uh oh...
                res.setRenderParameter(PortletActionConstants.ACTION_PARAM, "renderDirect");
                res.setRenderParameter("location", finalLocation);
            }
            res.setRenderParameter(PortletActionConstants.MODE_PARAM, PortletActionContext.getRequest().getPortletMode().toString());
        }


        protected static void convertQueryParamsToRenderParams(ActionResponse response, String queryParams)
        {
            StringTokenizer tok = new StringTokenizer(queryParams, "&");
            while (tok.hasMoreTokens())
            {
                String token = tok.nextToken();
                String key = token.substring(0, token.indexOf('='));
                String value = token.substring(token.indexOf('=') + 1);
                response.setRenderParameter(key, value);
            }
        }

        protected void executeRenderResult(final String fLocation) throws Exception
        {
        	location = getStylesheetLocation();
            RenderResponse res = PortletActionContext.getRenderResponse();
            res.setContentType(contentType);
            if(TextUtils.stringSet(title))
                res.setTitle(title);
            if(invocation==null) return;

            try
            {
            	RenderResponse response = PortletActionContext.getRenderResponse();
                Templates templates = null;
                Transformer transformer;
                if (location != null)
                {
                    templates = getTemplates(location);
                    transformer = templates.newTransformer();
                }
                else  transformer = TransformerFactory.newInstance().newTransformer();
                transformer.setURIResolver(getURIResolver());
 
            	Document d = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
            	Element tag_result = d.createElement("result");
            	Method[] methods = invocation.getAction().getClass().getDeclaredMethods();
            	Object o;
            	String content;
            	Element tag_e;
            	for(int i=0; i < methods.length; i++)
            	{
            		if(
            				Modifier.isPublic(methods[i].getModifiers()) && 
            				methods[i].getName().startsWith("get") && 
            				String.class==methods[i].getReturnType() && 
            				methods[i].getParameterTypes().length==0)
            		{
            			o = methods[i].invoke(invocation.getAction(), new Object[0]);
            			if(o!=null)
            			{
            				content = (String) o;
            				tag_e = d.createElement(methods[i].getName());
            				tag_e.setTextContent(content);
            				tag_result.appendChild(tag_e);
            			}
            		}
            	}
            	d.appendChild(tag_result);
            	DOMSource s = new DOMSource(d);
            	Writer out = response.getWriter();
            	transformer.transform(s, new StreamResult(response.getWriter()));
                out.flush();
                out.close();
            }
            catch (Exception e)
            {
                LOG.error("Unable to render XSLT Template, '" + location + "'", e);
                throw e;
            }
        }

        /**
         * Sets the content type.
         *
         * @param contentType The content type to set.
         */
        public void setContentType(String contentType) {
            this.contentType = contentType;
        }

        /**
         * Sets the title.
         *
         * @param title The title to set.
         */
        public void setTitle(String title) {
            this.title = title;
        }

        static class IncludeTemplate {
            protected void include(PortletRequestDispatcher dispatcher, RenderRequest req, RenderResponse res) throws PortletException, IOException{
                try {
                    dispatcher.include(req, res);
                }
                catch(PortletException e) {
                    when(e);
                    throw e;
                }
                catch(IOException e) {
                    when(e);
                    throw e;
                }
            }

            protected void when(PortletException e) {}

            protected void when(IOException e) {}
        }


        protected URIResolver getURIResolver() {
            return new ServletURIResolver(
                    ServletActionContext.getServletContext());
        }
        protected Templates getTemplates(String path) throws TransformerException, IOException
        {
        	String pathFromRequest = null;
        	try
        	{
            	pathFromRequest = PortletActionContext.getRequest().getParameter("xslt.location");
        	}
        	catch(Exception e) { }
            if(path!=null) path=PortletActionContext.getPortletConfig().getPortletContext().getRealPath(path);
            if (pathFromRequest != null) path = PortletActionContext.getPortletConfig().getPortletContext().getRealPath(pathFromRequest);
            if (path == null)
                throw new TransformerException("Stylesheet path is null");

            Templates templates = templatesCache.get(path);

            if (noCache || (templates == null)) {
                synchronized (templatesCache) {

                    System.out.println(path+":da?: "+(new File(path)).exists());
                    

                    LOG.debug("Preparing XSLT stylesheet templates: " + path);

                    TransformerFactory factory = TransformerFactory.newInstance();
                    templates = factory.newTemplates(new StreamSource(new File(path)));
                    templatesCache.put(path, templates);
                }
            }

            return templates;
        }
}
