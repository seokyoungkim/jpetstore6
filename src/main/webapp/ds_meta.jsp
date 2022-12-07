<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="javax.naming.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.sql.*" %>

<%
   Context ctx = null;
   DataSource ds = null;
   Connection con = null;
   PreparedStatement ps = null;
   ResultSet rs = null;
   //String sql = "select * from inventory";
   //mysql
   String sql = "select now()";
   //String sleep = (request.getParameter("sleep") == null || "".equals(request.getParameter("sleep")) ) ? "5" : request.getParameter("sleep");
   //int sleepTime = Integer.parseInt(sleep);
   
  try {
    ctx = new InitialContext();
    //ds = (DataSource) ctx.lookup("dataSource");
	//ds = (DataSource) ctx.lookup("java:comp/env/dataSource");
	//ds = (DataSource) ctx.lookup("java:/dataSource");
	//tomcat
    ctx = (Context) ctx.lookup("java:comp/env");
    //ds = (DataSource) ctx.lookup("dataSource");
    ds = (DataSource) ctx.lookup("jdbc/MyDB");
	
    con = ds.getConnection();
    DatabaseMetaData meta = con.getMetaData();
    out.print("<b><i>Database URL : "+meta.getURL()+"</i></b><br><br>");
    out.println("\n=============\nDatabase Product Name is ... " + meta.getDatabaseProductName()+"<br>");
    out.println("\nDatabase Product Version is  " + meta.getDatabaseProductVersion()+"<br>");
    out.println("\n=============\nJDBC Driver Name is ........ " + meta.getDriverName()+"<br>");
    out.println("\nJDBC Driver Version is ..... " + meta.getDriverVersion()+"<br>");
    out.println("\nJDBC Driver Major Version is " + meta.getDriverMajorVersion()+"<br>");
    out.println("\nJDBC Driver Minor Version is " + meta.getDriverMinorVersion()+"<br>");
    out.print("<b><i>Query("+sql+") Result</b><br><br>");

    ps = con.prepareStatement(sql);
    rs = ps.executeQuery();
    while (rs.next()){
     out.print(rs.getString(1));
    }
   } catch ( Exception e ) {
     e.printStackTrace();
	 out.print("Exception Msg : "+e.getMessage());
   } finally {
     if ( ps != null ) try { ps.close(); } catch(Exception e) {}
     if ( con != null ) try { con.close(); } catch(Exception e) {} 
   }
   //Thread.sleep(1000*sleepTime);
%>
    Query Execution
