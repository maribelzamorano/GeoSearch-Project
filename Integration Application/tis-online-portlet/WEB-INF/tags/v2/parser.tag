<%@ include file="../init-v2.jsp" %><%@ tag body-content="scriptless" %><%@ attribute name="textparsing"	required="false" rtexprvalue="true" type="java.lang.Integer"%><%@ attribute name="maxWordLength" required="false" rtexprvalue="true" type="java.lang.Integer"%><jsp:doBody  var="resultBodyString" scope="request"/><%
String body = String.valueOf(request.getAttribute("resultBodyString"));
try
{
if(maxWordLength==null) maxWordLength = 25;
if(textparsing==null) textparsing=1;
String result = new String();
if(body==null || body.trim().length()==0 || body.equals("")) {
    out.print("");
}

else {
body=body.replaceAll("&lt;","<");
body=body.replaceAll("&quot;","\"");
body=body.replaceAll("&gt;",">");
body=body.replaceAll("&#xE4;","ä");
body=body.replaceAll("&#xF6;","ö");
body=body.replaceAll("&#xFC;","ü");
body=body.replaceAll("&#xFC;","ß");
int Status = 0;
int position = -1;
String code ="";
String decode ="";
String buffer ="";
body=body.replace("<img src=\"/tis-online-portlet/images/icons/portlet/link_extern.gif\" title=\"picture\" border=\"0\"/>","");

for (int i=0;i<body.length();i++){
        switch (body.charAt(i))
        {
            case '<':{
                if (Status==5 && body.charAt(i+1)=='/' && (body.charAt(i+2)=='A' || body.charAt(i+2)=='a')&& body.charAt(i+3)=='>'){
                    decode = body.substring(position, i);
                    decode=decode.replaceAll("<wbr>","");
                    if(decode.length()>maxWordLength)
                    {
                        String newBody="";
                        int part =0;
                        while(decode.substring(part).length()>maxWordLength){
                    	newBody+=decode.substring(part,part+maxWordLength)+"<wbr>";
                    	part=part+maxWordLength;
                    	
                    	}
                        newBody+=decode.substring(part);
                    	decode = newBody;
                    }
                    result+= "<img src=\"/tis-online-portlet/images/icons/portlet/link_extern.gif\" title=\"picture\" border=\"0\"/>&nbsp;<a class=\"topdev_link\" href=\""+code+"\" target=\"_blank\">"+decode+"</a><br>";
                    buffer="";
                    if (i+4<body.length()){i+=4;}
                    else {i=body.length()-1;break;}
                    Status = 0;
                }
                if ((Status==1 || Status==2 ||Status==3 || Status==4) && body.charAt(i+1)=='/' && (body.charAt(i+2)=='A' || body.charAt(i+2)=='a')){
                    result+=buffer;
                    Status=0;
                }
                if ((Status==0) && (body.charAt(i+1)=='a' || body.charAt(i+1)=='A')){
                    if (textparsing==1){buffer+=body.charAt(i);}
                    Status=1;
                }
                if (textparsing==1 && Status==0 && (body.charAt(i+1)!='a' || body.charAt(i+1)!='A')){
                    result+=body.charAt(i);
                }
                break;

            }
            case '=':{
                if (textparsing==1 && Status != 0){buffer+=body.charAt(i);}
                if (textparsing==1 && Status == 0){result+=body.charAt(i);}
                if ((Status==1)&&
                   (body.charAt(i-1)=='f' || body.charAt(i-1)=='F') && 
                   (body.charAt(i-2)=='e' || body.charAt(i-2)=='E') &&
                   (body.charAt(i-3)=='r' || body.charAt(i-3)=='R') &&
                   (body.charAt(i-4)=='h' || body.charAt(i-4)=='H')){
                        Status=2;
                }
                break;

            }
            case '"':{
                if (textparsing==1 && Status != 0){buffer+=body.charAt(i);}
                if (textparsing==1 && Status == 0){result+=body.charAt(i);}
                if (Status==3){
                    code = body.substring(position, i);
                    if (!code.contains("http://") && !code.contains("HTTP://") && !code.contains("https://") && !code.contains("HTTPS://")){
                        code="http://"+code;
                    }
                    Status = 4;
                }
                else if (Status==2){
                    position=i+1;
                    Status=3;
                }
                break;

            }
            case '>':{
                if (textparsing==1 && Status != 0){buffer+=body.charAt(i);}
                if (textparsing==1 && Status == 0){result+=body.charAt(i);}
                if (Status==4){
                    position=i+1;
                    Status = 5;
                }
                break;

            }
            default:{
                if (textparsing==1 && Status==0){
                    result+=body.charAt(i);
                }
                if (textparsing==1 && Status!=0){
                    buffer+=body.charAt(i);
                }
            }
        }
	if(i==body.length()-1 && textparsing==1){
	    result+=buffer;
	}
    }
if (!result.trim().equals("")){out.print(result);}
else {out.print("");
}
}
}
catch(Exception ex423)
{
System.out.println("Fehler in parser.tag: "+ex423+"\n\nText:"+body);
}
%>