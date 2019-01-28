<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="UTF-8"%>

<!-- 新闻 -->
<main class="col-md-8 main-content">
	<% int id=Integer.parseInt(request.getParameter("id"));
		sql = "select title,owner,message,inserttime,category from Content where id='"+id+"'";
		rs = stmt.executeQuery(sql);				
		if (rs.next()) {
			String title = rs.getString("title");
			String owner = rs.getString("owner");
			String message = rs.getString("message");
			String time = rs.getString("inserttime");
			String category=rs.getString("category");
	%>
 	<article id=<%=id %> class="post">
		<div class="post-head">
			<h1 class="post-title">
				<%=title %>
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
			<p><%=message %></p>
		</div>
		<div class="post-permalink">
			<a href="javascript:history.back(-1)" class="btn btn-default">返回首页</a>
			<%
				String userid=session.getAttribute("userid").toString();
				if(owner.equals(userid)||userid.equals("123")){
			 %>
			<div class="delect">
				<a href="delect.jsp?id=<%=id %>" >删除 </a>&nbsp;&bull;
				<a href="edit.jsp?id=<%=id %>" >修改</a>
			</div>
			<%} %>
			
		</div>
	</article> 
	<%
		}
		rs.close();
	%>
</main>
