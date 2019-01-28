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
    
    <title>checkpost</title>
  </head>
 <%
 	String owner=session.getAttribute("userid").toString();
 	request.setCharacterEncoding("UTF-8");
 	String category=request.getParameter("category");
 	String title=request.getParameter("title");
 	String message=request.getParameter("message");
 	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	java.util.Date currentTime = new java.util.Date();//得到当前系统时间
	String date = formatter.format(currentTime); //将日期时间格式化 
 	
 	Connection conn = null;
	Statement stmt = null;
	//ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String SQL="INSERT INTO Content(owner,title,message,inserttime,category) VALUES ('"+owner+"','"+title+"','"+message+"','"+date+"','"+category+"')";
	stmt.executeUpdate(SQL);
	//rs.close();
	response.sendRedirect("index.jsp");
 %>
 <body>

 </body>

</html>
