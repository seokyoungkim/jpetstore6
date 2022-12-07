<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    //request.setCharacterEncoding("UTF-8");
    String eng =request.getParameter("Accordion");
    String kor =request.getParameter("아코디언");
%>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Insert title here</title>
</head>

<body>
<ul>
    <li>en : Accordion</li>
    <li>ko : 아코디언</li>
</ul>
</body>

</html>
