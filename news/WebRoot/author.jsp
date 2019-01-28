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
<title>Auther</title>
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="public/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="public/css/magnific-popup.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="public/css/index.css">
</head>
<%
	Integer pages;
	if(request.getParameter("page")==null){
		pages=1;
	}
	else{
		pages=Integer.parseInt(request.getParameter("page"));
	}
	
	String owner=request.getParameter("id");	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
	
	String sql1="select count(*) count from Content where owner='"+owner+"'";
	Statement stmt1 = conn.createStatement();
	ResultSet rs1 =stmt1.executeQuery(sql1);
	rs1.next();
	int sum = rs1.getInt("count");
	int num;
	if(sum%5==0){
		num=sum/5;
	}else{
		num=sum/5+1;
	}
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
			 	<main class="col-md-8 main-content">
					<div class="cover author-cover">
					    <h3 class="author-name">
					        作者：<%=owner %>
					    </h3>
					    <div class="meta-info">
					        <span class="post-count"><i class="fa fa-pencil-square-o"></i><%=sum %>篇文章</span>
					    </div>
					    <div class="bio"></div>
					</div>
					<% 	
						int pageSize=5;
						if(pages==num&sum%5!=0){
							pageSize=sum%5;
						}
						int x=(pages-1)*5;
				
						sql = "select top "+pageSize+"* from Content where owner='"+owner+"' and id not in (select top "+x+" id  from Content where owner='"+owner+"' order by id desc) order by id desc";
						rs = stmt.executeQuery(sql);				
						while (rs.next()) {
							String title = rs.getString("title");
							String category = rs.getString("category");
							String message = rs.getString("message");
							int length=message.length();
							if(length>=100){
								message=message.substring(0,75);
							}
							else{	
								message=message.substring(0,length/4);
							}
							String time = rs.getString("inserttime");
							int id = Integer.parseInt(rs.getString("id"));
					
					%>
				 	<article id=<%=id %> class="post">
						<div class="post-head">
							<h1 class="post-title">
								<a href="/news/content.jsp?id=<%=id %>"><%=title %></a>
							</h1>
							<div class="post-meta">
								<span class="author">作者：<a href="author.jsp?id=<%=owner%>"><%=owner %></a></span>
								&bull;
								<time class="post-date" datetime="<%=time%>"><%=time%></time>
								&bull;
								<span class="category"><%=category %></span>
							</div>
						</div>
						<div class="post-content">
							<p><%=message %>...</p>
						</div>
						<div class="post-permalink">
							<a href="/news/content.jsp?id=<%=id %>" class="btn btn-default">阅读全文</a>
							<%
								String userid=session.getAttribute("userid").toString();
								if(owner.equals(userid)||userid.equals("123")){
							 %>
							<div class="delect">
								<a href="delect.jsp?id=<%=id %>" >删除</a>&nbsp;&bull;
								<a href="edit.jsp?id=<%=id %>" >修改</a>
							</div>
							<%} %>
							
						</div>
					</article> 
					<%
						}
						rs.close();
					%>
					<nav class="pagination" role="navigation">
						<%
							if(pages>=2){
							
						 %>
				        <a class="newer-posts" href="author.jsp?id=<%=owner %>&page=<%=pages-1%>"><i class="fa fa-angle-left"></i></a>
				        <%} %>
				    <span class="page-number">第 <%=pages %>页 &frasl; 共 <%=num %> 页</span>
				    	<%
							if(pages<num){
							
						 %>
				        <a class="older-posts" href="author.jsp?id=<%=owner %>&page=<%=pages+1%>"><i class="fa fa-angle-right"></i></a>
				        <%} %>
				        
					</nav>
				</main>

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
