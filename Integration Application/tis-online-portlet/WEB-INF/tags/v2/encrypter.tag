<%@ include file="../init.jsp" %><%@ tag body-content="scriptless" %><jsp:doBody  var="resultBodyString" scope="request"/><%
String body = String.valueOf(request.getAttribute("resultBodyString"));
//Berechnung erfolgt nach 23er zahlensystem mit "o" als 5er-Block Trenner
if(body==null) body="";
byte[] b = body.getBytes();
out.print("#3b");
String result = "";
for(int i=0; i < b.length; i++)
{
	result = "";
	int q = b[i]*2;
	int f1 = Math.round( q/23 );
	int f2 = q - f1*23;

	if(f1>9) result += ""+((char)((f1-10)+97)); else result+=f1;
	if(f2>9) result += ""+((char)((f2-10)+97)); else result+=f2;
	out.print(result);
	if((i+1)%5==0) out.print("o");
	if((i+1)%3==0) out.print(" ");
	//if(i < b.length-1) out.print(", ");
}
out.print("3e#");
%>