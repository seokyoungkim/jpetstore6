<%@ page contentType = "text/html; charset=euc-kr" %>
<%@ page import = "java.util.Enumeration" %>
<html>
<head><title>HTTPS Redirect</title></head>
<body>
<%
System.out.println("######################START##########################");
String url = javax.servlet.http.HttpUtils.getRequestURL(request).toString();
String uri = request.getHeader("x-forwarded-proto") + "://" +   // "http" + "://
             request.getServerName() +       // "myhost"
             ":" +                           // ":"
             request.getServerPort() +       // "8080"
             request.getRequestURI() +       // "/people"
             "?" +                           // "?"
             request.getQueryString();       // "lastname=Fox&age=30"

System.out.println("######URL" + url);
System.out.println("######URI" + uri);
System.out.println("######REQUEST HEADER######");
Enumeration headerEnum = request.getHeaderNames();
while(headerEnum.hasMoreElements()) {
   String headerName = (String)headerEnum.nextElement();
   String headerValue = request.getHeader(headerName);
   System.out.println( headerName + " :: " + headerValue );
}

if(uri.indexOf("http://") > -1 ) {	
	String after = uri.replaceAll("http://","https://");

//if(url.indexOf("http://") > -1 ) {	
//	String after = url.replaceAll("http://","https://") +"?"+ request.getQueryString();

	System.out.println("######REDIRECT" + after);
	System.out.println("######################END############################");


//	response.sendRedirect(url.replaceAll("http://","https://") +"?"+ request.getQueryString());		
        response.setHeader("x-forwarded-proto", "https");
	System.out.println("######REQUEST HEADER######");
	System.out.println("######REDIRECT1" + response.getHeader("x-forwarded-for"));
	System.out.println("######REDIRECT2" + response.getHeader("x-forwarded-by"));
	System.out.println("######REDIRECT2" + response.getHeader("x-forwarded-proto"));
	
	String reuri = "https://" +   // "http" + "://
             request.getServerName() +       // "myhost"
             ":30170" +                           // ":"
             request.getRequestURI() +       // "/people"
             "?" +                           // "?"
             request.getQueryString();       // "lastname=Fox&age=30"
	System.out.println("######REDIRECT" + reuri);
	System.out.println("######################END############################");

	response.sendRedirect(reuri);		

	return;

}
%>
	<h1>HTTPS Redirect</h1>
</body>
</html>
