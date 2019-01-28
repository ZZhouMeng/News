<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>register</title>
	<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
	<link rel="stylesheet" href="public/css/login.css" />
  </head>
  
  <body>
  <%
  	if(request.getParameter("type")!=null){
  		String type=request.getParameter("type");
  		if(type.equals("1")){
  		 	out.print("<script>alert('请输入用户名');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('请输入昵称');</script>");
  		}else if(type.equals("3")){
  			out.print("<script>alert('请输入密码');</script>");
  		}else if(type.equals("4")){
  			out.print("<script>alert('两次密码输入不一致');</script>");
  		}else if(type.equals("5")){
  			out.print("<script>alert('用户名已注册');</script>");
  		}
  	}
   %>
    <div class="container">
		<div class="admin">
			<div class="col-md-4 col-md-offset-4">
				<div class="box login" id="login">
				<h2>注 &nbsp;册</h2>
					<form class="form-horizontal"  name="form" action="checkRegister.jsp" method="post">
						<div class="form-group">
							<label class="col-sm-4 control-label">用户名：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="userid"
									id="userid" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">昵&nbsp; &nbsp;称 ：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="username"
									id="username" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">密 &nbsp; &nbsp;码：</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="password"
									id="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">确认密码：</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="repassword"
									id="repassword" />
							</div>
						</div>
						<div class="row">
						<div class="col-md-4 register">
							<a href="login.jsp">登录系统</a> 
						</div>
						<div class="col-md-6">
							<input type="submit" class="btn btn-info" value="注册">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

  </body>
</html>
