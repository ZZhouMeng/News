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
  		 	out.print("<script>alert('�������û���');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('�������ǳ�');</script>");
  		}else if(type.equals("3")){
  			out.print("<script>alert('����������');</script>");
  		}else if(type.equals("4")){
  			out.print("<script>alert('�����������벻һ��');</script>");
  		}else if(type.equals("5")){
  			out.print("<script>alert('�û�����ע��');</script>");
  		}
  	}
   %>
    <div class="container">
		<div class="admin">
			<div class="col-md-4 col-md-offset-4">
				<div class="box login" id="login">
				<h2>ע &nbsp;��</h2>
					<form class="form-horizontal"  name="form" action="checkRegister.jsp" method="post">
						<div class="form-group">
							<label class="col-sm-4 control-label">�û�����</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="userid"
									id="userid" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">��&nbsp; &nbsp;�� ��</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="username"
									id="username" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">�� &nbsp; &nbsp;�룺</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="password"
									id="password" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">ȷ�����룺</label>
							<div class="col-sm-8">
								<input type="password" class="form-control" name="repassword"
									id="repassword" />
							</div>
						</div>
						<div class="row">
						<div class="col-md-4 register">
							<a href="login.jsp">��¼ϵͳ</a> 
						</div>
						<div class="col-md-6">
							<input type="submit" class="btn btn-info" value="ע��">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

  </body>
</html>
