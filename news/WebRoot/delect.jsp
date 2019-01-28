<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>delect</title>
  </head>
 <%
 	request.setCharacterEncoding("gb2312");
 	String id=request.getParameter("id");
 	
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql="DELETE FROM Content WHERE id = '"+id+"' ";
	stmt.executeUpdate(sql); 
	response.sendRedirect("index.jsp");
 %>
 <body>
 </body>

</html>
