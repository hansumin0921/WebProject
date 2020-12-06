<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 아이디 오류</title>
</head>
<body>
	<div id="page-wrapper">
	<jsp:include page="menu.jsp"/>
		<br>
		<hr>
		<div class="main-header">
		</div>
		<br><br>
		<div class="contain">
			<h2 class="alert alert-danger">해당 상품이 존재하지 않습니다.</h2>
		</div>
		<br><br>
	<div class="contain">
		<p><%=request.getRequestURL()%>?<%=request.getQueryString()%>
		<p><a href="products.jsp" class="btn btn-secondary" style="text-decoration:none; background-color:black; color:white;">돌아가기</a>			
	</div>
	<hr>
	</div>
	<jsp:include page="footer.jsp"/>	
</body>
</html>
