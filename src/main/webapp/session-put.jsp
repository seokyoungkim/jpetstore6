<%
String val = request.getParameter("val");
String key = "key-"+val;
session.setAttribute(key,val);
out.print("key : "+key +", val : "+val);
%>
