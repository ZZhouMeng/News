<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="myDB" class="database.DBConnection" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>content</title>
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="public/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="public/css/magnific-popup.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="public/css/index.css">
</head>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
%>
<body class="home-template">
	<!-- banner -->
	<header class="main-header"
		style="background-image: url(public/img/banner.jpg)"></header>
	<!-- banner -->
	
	<!-- start navigation -->
	<%@ include file="navigation.jsp" %>
	<!-- end navigation -->

	<!-- start site's main content area -->
	<section class="content-wrap">
		<div class="container">
			<div class="row">
				<!-- 新闻 -->
			 	 <%@ include file="article.jsp" %>
				<!-- 新闻 -->
				<!-- 用户信息 -->
				<%@ include file="userinfo.jsp" %>
				<!-- 用户信息 -->
			</div>
  		</div>
	</section>
	<!-- 底部栏 -->
	<%@ include file="bottom.jsp" %>
	<!-- 底部栏 -->
	<%@ include file="backToTop.jsp" %>
</body>
</html>
