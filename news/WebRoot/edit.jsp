<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
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
<title>editNews</title>
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="public/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="public/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="public/css/magnific-popup.min.css">
<link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="public/js/jquery.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="public/css/index.css">
 <style type="text/css">
      .toolbar1 {
          border: 1px solid #ccc;
      }
      .text1 {
          border: 1px solid #ccc;
          height: 150px;
      }
</style>
</head>
  <%
  	if(request.getParameter("type")!=null){
  		String type=request.getParameter("type");
  		if(type.equals("1")){
  		 	out.print("<script>alert('请输入新闻标题');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('请输入新闻内容');</script>");
  		}else{
  		}
  	}
   %>
<%
	int ids=Integer.parseInt(request.getParameter("id"));	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	conn = myDB.getConnection();
	stmt = conn.createStatement();
%>
<body class="home-template">
	<!-- banner -->
	<header class="main-header" style="background-image: url(public/img/banner.jpg)"></header>
	<!-- banner -->
	
	<!-- start navigation -->
	<nav class="main-navigation">
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="collapse navbar-collapse" id="main-menu">
						<ul class="menu">
							<li  class="nav-current" role="presentation"><a href="/news/index.jsp">首页</a></li>
							<%
								String sql = "select * from Category";
								rs = stmt.executeQuery(sql);
								while (rs.next()) {
									String category = rs.getString("category");
									int id = Integer.parseInt(rs.getString("id"));
							%>
							<li role="presentation"><a href="/news/category.jsp?category=<%=id%>"><%=category%></a></li>
							<%
								}
								rs.close();
							%>
							<li role="presentation"><a href="/news/postNews.jsp">发表新闻</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- end navigation -->
	

	<!-- start site's main content area -->
	<section class="content-wrap">
		<div class="container">
			<div class="row">
				<!-- 发表新闻 -->
				
				<main class="col-md-8 main-content">
				 	<article class="post">	
						<div class="post-content">
							<form class="form-horizontal"  name="form" id="form" action="checkEdit.jsp?id=<%=ids %>" method="post">
								<div class="form-group">
							        <label for="category">新闻类型</label>
							        <select class="form-control" name="category" id="category">
							        <%
							        	sql = "select title,owner,message,inserttime,category from Content where id='"+ids+"'";
										rs = stmt.executeQuery(sql);
										String title=null,owner=null,message=null,categorys=null;	
										if (rs.next()) {
												title = rs.getString("title");
												owner = rs.getString("owner");
												message = rs.getString("message");
												categorys=rs.getString("category");
												rs.close();
										}
									 	sql = "select * from Category";
										rs = stmt.executeQuery(sql);
										while (rs.next()) {
											String category = rs.getString("category");
											int id = Integer.parseInt(rs.getString("id"));
											if(category.equals(categorys)){
									%>
									<option value="{{<%=category%>}}" selected><%=category%></option>	
									<%}
									else{
									 %>	
									 <option value="{{<%=category%>}}"><%=category%></option>						
									<%
									}
										}
										rs.close();
									%>
							        </select>
							    </div>
								 <div class="form-group">
								    <label for="title">新闻标题</label>
								    <input type="text" class="form-control" id="title" name="title" value="<%=title%>">
								  </div>
								   <div class="form-group">
								   		 <label for="message">新闻内容</label>
										<div id="div1" class="toolbar1">
									    </div>
									    <div id="div2" class="text1">
									        <p><%=message %></p>
									    </div>
									    <input id="message" name="message" type="hidden">		        
									</div>
									<div class="form-group">
										<input class="btn btn-default" id="btn" value="发表新闻">
									</div>
									
							 </form>
							  <script type="text/javascript" src="public/js/wangEditor.min.js"></script>
							 <script type="text/javascript">
							 	var E = window.wangEditor
						        var editor = new E('#div1', '#div2')
						 
						        // 自定义菜单配置
							    editor.customConfig.menus = [
							        'head',  // 标题
								    'bold',  // 粗体
								    'fontSize',  // 字号
								    'fontName',  // 字体
								    'italic',  // 斜体
								    'underline',  // 下划线
								    'strikeThrough',  // 删除线
								    'foreColor',  // 文字颜色
								    'backColor',  // 背景颜色
								    'link',  // 插入链接
								    'justify',  // 对齐方式
								    'image',  // 插入图片
								    'video',  // 插入视频
								    'undo',  // 撤销
								    'redo'  // 重复
							    ]
						        editor.create()
								document.getElementById('btn').addEventListener('click', function () {
						            var html= editor.txt.html();
						            var text=editor.txt.text();
						            $("#message").val(html);
						            $("#form").submit();
						        })
							 </script>
						</div>
					</article> 
				</main>
				<!-- 发表新闻 -->
				<!-- 用户信息 -->
				<%@ include file="userinfo.jsp" %>
				<!-- 用户信息 -->
			</div>
  		</div>
	</section>
	<!-- 底部栏 -->
	<%@ include file="bottom.jsp" %>
	<!-- 底部栏 -->
</body>
</html>
