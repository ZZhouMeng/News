<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>login</title>
	<link rel="stylesheet" type="text/css" href="public/css/bootstrap.css">
	<link rel="stylesheet" href="public/css/login.css" />
  </head>
  
  <body>
  <%
  	if(request.getParameter("type")!=null){
  		String type=request.getParameter("type");
  		if(type.equals("1")){
  		 	out.print("<script>alert('你输入的密码有误');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('你输入的用户名有误');</script>");
  		}else{
  		}
  	}
   %>
    <div class="container">
		<div class="admin">
			<div class="col-md-4 col-md-offset-4">
				<div class="box login" id="login">
				<h2>登 录</h2>
					<form class="form-horizontal"  name="form" action="checkLogin.jsp" method="post">
						<div class="form-group">
							<label class="col-sm-4 control-label">用户名：</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="userid"
									id="userid" />
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
							<div class="col-sm-12 isAdmin">
								<div class="radio" id="isAdmin">
									<label> <input type="radio" name="isAdmin" id="admin"
										value="1"> 管理员&emsp;&emsp;&emsp;
									</label>
									<label> <input type="radio" name="isAdmin" id="user"
										value="0" checked> 普通用户
									</label>
								</div>
							</div>
						</div>
						<div class="row">
						<div class="col-md-4 register">
							<a href="register.jsp">注册新用户</a> 
						</div>
						<div class="col-md-6">
							<input type="submit" class="btn btn-info" value="登录系统">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

  </body>
</html>
