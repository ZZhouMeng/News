<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String username=session.getAttribute("username").toString();
	String isAdmin=session.getAttribute("usertype").toString();
	if(isAdmin.equals("1")){
		isAdmin="管理员";
	}else{
		isAdmin="普通用户";
	}
 %>
<aside class="col-md-4 sidebar">
	<div class="widget">
		<h4 class="title">个人信息</h4>
		<div class="content community">
			<p>昵&nbsp; &nbsp;称 ：<%=username %></p>
			<p>用户类型：<%=isAdmin %></p>
			<p><a href="out.jsp">退出登录</a></p>
		</div>
	</div>
</aside>
