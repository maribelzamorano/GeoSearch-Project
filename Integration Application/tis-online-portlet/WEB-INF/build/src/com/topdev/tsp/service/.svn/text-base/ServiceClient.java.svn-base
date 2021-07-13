package com.topdev.tsp.service;

import javax.xml.namespace.QName;

import org.apache.axis2.AxisFault;
import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;

public class ServiceClient
{
	public static String endpointUrl = "http://127.0.0.1/tis-service/services";
	
	@SuppressWarnings("unchecked")
	protected static Object[] invokeService(String serviceName, String methodName, String methodNamespace, Object[] args, Class[] returnTypes) throws AxisFault
	{
		System.out.println("ServiceClient beginn");
		RPCServiceClient serviceClient = new RPCServiceClient();
        Options options = serviceClient.getOptions();
        EndpointReference targetEPR = new EndpointReference(endpointUrl+"/"+serviceName);
        options.setTo(targetEPR);
        QName method = new QName(methodNamespace, methodName);
		System.out.println("ServiceClient run");
        return serviceClient.invokeBlocking(method, args, returnTypes);
	}
}