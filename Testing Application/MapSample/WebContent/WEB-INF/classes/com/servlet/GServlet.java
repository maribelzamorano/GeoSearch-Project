package com.servlet;

import geoSearch.topdev.com.BobjGeoSchool;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;
import org.apache.axis.encoding.ser.BeanDeserializerFactory;
import org.apache.axis.encoding.ser.BeanSerializerFactory;

/**
 * Servlet implementation class GServlet
 */
public class GServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/javascript");
		PrintWriter out = response.getWriter();
		String cp = request.getParameter("PostalCode");
		String ct = request.getParameter("City");
		String str = request.getParameter("Street");
		String nn = request.getParameter("number_nearest");
		String rad = request.getParameter("radius");
		if(nn == "")
		{
			nn = "0";
		}
		if(rad == "")
		{
			rad = "0";
		}
		String endpoint ="http://192.168.102.72:33601/GeoSearchWebService/GeoSearchWSService";
		Service service = new Service();
		try
		{
			Call call= (Call) service.createCall();
			QName qn = new QName("http://com.topdev.geoSearch/", "BobjGeoSchool");
		              // registramos en la llamada remota
		             // el tipo de dato custom
		    call.registerTypeMapping(BobjGeoSchool.class,qn,new BeanSerializerFactory(BobjGeoSchool.class,qn),new BeanDeserializerFactory(BobjGeoSchool.class,qn));
		    call.setTargetEndpointAddress(endpoint);
		    call.setOperationName(new QName("http://com.topdev.geoSearch/", "getSchools"));
			call.addParameter("Number_of_nearest",  XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter("Radius",  XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter("User_longitude",  XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter("User_latitude",  XMLType.XSD_STRING, ParameterMode.IN);
		                //call.setReturnType(qn);
			call.setReturnType(XMLType.XSD_ANYTYPE);
		            // que tipo de clase esperamos
		    call.setReturnClass(BobjGeoSchool.class);
		    Object[] inParams = new Object[] { nn, rad, "11.03309", "50.98369" };

		    List<BobjGeoSchool> obj = (List<BobjGeoSchool>) call.invoke(inParams);
		    out.println("<html><body>");
		    for(int x = 0 ; x< obj.size() ; x++)
		    {
		    	out.println("Aqui checando<br>");
		    }
		    out.println("</body></html>");
		}
		catch(ServiceException e)
		{
			out.print("Exception: \n"+e);
		}
	}

}
