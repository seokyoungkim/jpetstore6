<%@page import="java.io.*,java.net.*" %>
<%
/*
 ClassLoaderInfo cl = new ClassLoaderInfo();
 String className = request.getParameter("className");
 
 Map classInfo = null;
 if (className != null && className.trim().length() > 0) {
    classInfo = cl.getLoadingClassInfo(className);
 }
 
 List bootClasses = cl.getBootClassInfos();
 List extClasses = cl.getExtClassInfos();
 List appClasses = cl.getAppClassInfos();
*/
 String className = request.getParameter("className") == null ? "" : request.getParameter("className").trim();
 String br = "<br>";

 boolean flag = true;
 Class<?> cls = null;
 ClassLoader classLoader = null;
 ClassLoader contextClassLoader = null;

 try{
     cls = Class.forName(className);

     classLoader = cls.getClassLoader();
     contextClassLoader = Thread.currentThread().getContextClassLoader();
  }catch(Exception e){
    flag = false;
  }


%>

<html>
<head>
<title>Classloader Information</title>
<style type="text/css">
.c_title{
    font-size:20px;
}

.th_classinfo{
    text-align:left;
    color:#fff;
    background-color:#000;
}
.td_classinfo{
    text-align:left;
    background-color:#ccc;
}

.th_classloader{
    width:700px;
    text-align:left;
    color:#fff;
    background-color:#000;
}
</style>
</head>

<body>
<p class="c_title">Classloader Information</p>

<form>
Class Name: <input type="text" name="className" size="100"/>
</form>
<table>
<% 
   if (flag){
%>
    <tr>
        <th class="th_classinfo">Class Name</th>
        <td class="td_classinfo"><%=className%></td>
    </tr>
    <tr> 
        <th class="th_classinfo">Classloader Name</th>
        <td class="td_classinfo"><%=classLoader.getClass().getName() %></td>
    </tr>
    <tr> 
        <th class="th_classinfo">Classloader Detail</th>
        <td class="td_classinfo"><%=classLoader.toString() %></td>
    </tr>
    <tr> 
        <th class="th_classinfo">Classloader HashCode</th>
        <td class="td_classinfo"><%=classLoader.hashCode() %></td>
    </tr>
<% }else {
%>
    <tr><th class="th_classinfo">Classloaders</th>
    <td class="td_classinfo"><%=className + " class not loaded !!! "%></td>
    </tr>
<%
   }
%>
</table>
</p>
</body>
</html>

