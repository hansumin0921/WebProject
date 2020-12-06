<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>Login</title>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<span style="color:red; font-size:20px;"><b>MANAGER</b></span>
			<span style="font-size:20px;"><b>&nbsp;LOGIN</b></span>
			<hr>
		</div>
	<div class="contain" align="center">
		<div class="col-md-4 col-md-offset-4">
			<h3 class="form-signin-heading">Please sign in</h3>
			<%
				String error=request.getParameter("error");
				if(error!=null)
				{
					out.println("<div class='alert alert-danger'>");
					out.println("아이디와 비밀번호를 확인해주세요");
					out.println("</div>");
				}
			%>
			<form class="form-signin" action="j_security_check" method="post">
				<div class="form-group">
					<label for="inputUserName" class="sr-only">
						User Name
					</label>
					<input type="text" class="form-control" placeholder="ID" name='j_username' required autofocus>
				</div>
				<div class="form-group">
					<label for="inputPassword" class="sr-only">
						Password
					</label>
					<input type="password" class="form-control" placeholder="Password" name='j_password' required>
				</div>
				<button class="btn btn btn-lg btn-block" style="color:white; background-color:black;"type="submit">로그인</button>
			</form>
		</div> 
	</div>
	<hr>
		<jsp:include page="footer.jsp" />
	</div> 
</body>
</html>