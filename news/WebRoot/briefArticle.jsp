<%@ page language="java" import="java.util.*" import="java.sql.*"
	pageEncoding="gb2312"%>

<!-- 新闻 -->
<main class="col-md-8 main-content">
	<% 	
		int pageSize=5;
		if(pages==num&sum%5!=0){
			pageSize=sum%5;
		}
		int x=(pages-1)*5;
			
		sql = "select top "+pageSize+"* from Content where id not in (select top "+x+" id  from Content order by id desc) order by id desc";
		rs = stmt.executeQuery(sql);				
		while (rs.next()!=false) {
			String title = rs.getString("title");
			String owner = rs.getString("owner");
			String message = rs.getString("message");
			String category=rs.getString("category");
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
				if(session.getAttribute("userid")==null){
					response.sendRedirect("login.jsp");
				}
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
        <a class="newer-posts" href="index.jsp?page=<%=pages-1%>"><i class="fa fa-angle-left"></i></a>
        <%} %>
    <span class="page-number">第 <%=pages %>页 &frasl; 共 <%=num %> 页</span>
    	<%
			if(pages<num){
			
		 %>
        <a class="older-posts" href="index.jsp?page=<%=pages+1%>"><i class="fa fa-angle-right"></i></a>
        <%} %>
        
	</nav>
</main>
