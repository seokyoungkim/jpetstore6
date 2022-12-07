<%
  String sleep = ( request.getParameter("sleep") == null ) ? "10" : request.getParameter("sleep");
  int sleepTime = Integer.parseInt(sleep);
  Thread.sleep(sleepTime*1000);
  out.print("<h1>Version V3</h1>");
%>  
