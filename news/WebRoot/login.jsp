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
  		 	out.print("<script>alert('���������������');</script>");
  		}else if(type.equals("2")){
  			out.print("<script>alert('��������û�������');</script>");
  		}else{
  		}
  	}
   %>
    <div class="container">
		<div class="admin">
			<div class="col-md-4 col-md-offset-4">
				<div class="box login" id="login">
				<h2>�� ¼</h2>
					<form class="form-horizontal"  name="form" action="checkLogin.jsp" method="post">
						<div class="form-group">
							<label class="col-sm-4 control-label">�û�����</label>
							<div class="col-sm-8">
								<input type="text" class="form-control" name="userid"
									id="userid" />
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
							<div class="col-sm-12 isAdmin">
								<div class="radio" id="isAdmin">
									<label> <input type="radio" name="isAdmin" id="admin"
										value="1"> ����Ա&emsp;&emsp;&emsp;
									</label>
									<label> <input type="radio" name="isAdmin" id="user"
										value="0" checked> ��ͨ�û�
									</label>
								</div>
							</div>
						</div>
						<div class="row">
						<div class="col-md-4 register">
							<a href="register.jsp">ע�����û�</a> 
						</div>
						<div class="col-md-6">
							<input type="submit" class="btn btn-info" value="��¼ϵͳ">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

  </body>
</html>
