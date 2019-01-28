<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>out</title>
  </head>
 <%
 	session.removeAttribute("userid"); 
 	session.removeAttribute("password");  
 	session.removeAttribute("isAdmin"); 
 	response.sendRedirect("login.jsp");
 %>
 <body>

 </body>

</html>
