<%
String key = request.getParameter("key");
out.print("key : "+key);
out.print("<br>");
out.print(session.getAttribute(key));
%>
