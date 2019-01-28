<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="object.User" %>
<%@page import="service.UserDao" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>checkRegister</title>
  </head>
 <%
 	request.setCharacterEncoding("gb2312");
 	String userid=request.getParameter("userid");
 	String username=request.getParameter("username");
 	String password=request.getParameter("password");
 	String repassword=request.getParameter("repassword");
%>
<%
 	if(userid.length()==0){
 		response.sendRedirect("register.jsp?type=1");
 	}
 	else if(username.length()==0){
 		response.sendRedirect("register.jsp?type=2");
 	}
 	else if(password.length()==0){
 		response.sendRedirect("register.jsp?type=3");
 	}
 	else if(repassword.length()==0){
 		response.sendRedirect("register.jsp?type=3");
 	}
 	else if(password.equals(repassword)==false){
 		response.sendRedirect("register.jsp?type=4");
 	}

 	User user=new User(userid,username,password);
 	UserDao userDao=new UserDao();
	if(userDao.addUser(user)==false){
		response.sendRedirect("register.jsp?type=5");
	}else{
		response.sendRedirect("login.jsp");	
	}
 %>
 <body>
 
 </body>

</html>
