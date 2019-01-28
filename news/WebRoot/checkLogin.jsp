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
    
    <title>checkLogin</title>
  </head>
 <%
 	request.setCharacterEncoding("gb2312");
 	String userid=request.getParameter("userid");
 	String password=request.getParameter("password");
 	String isAdmin=request.getParameter("isAdmin");
 	
 	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn=myDB.getConnection();
	stmt=conn.createStatement();
	String sql= "select userid,username,password,isAdmin from Users where userid='"+userid+"'";
	rs=stmt.executeQuery(sql);
	if(rs.next()==false){
		response.sendRedirect("login.jsp?type=2");
	}else{
		String pwd=rs.getString("password");
		String username=rs.getString("username");
		String usertype=rs.getString("isAdmin");
		if(password.equals(pwd)&isAdmin.equals(usertype)){
			session.setAttribute("userid", userid);
			session.setAttribute("username", username);
			session.setAttribute("usertype", usertype);
			response.sendRedirect("index.jsp?page=1");
		}else{
			response.sendRedirect("login.jsp?type=1");
		}
	}
 %>
 <body>
 
 </body>

</html>
