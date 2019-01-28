<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<nav class="main-navigation">
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<div class="collapse navbar-collapse" id="main-menu">
					<ul class="menu">
						<li class="nav-current" role="presentation"><a href="/news/index.jsp">首页</a></li>
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
						<li  role="presentation"><a href="/news/postNews.jsp">发表新闻</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>
