<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<title>페이지 오류</title>
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
			<h2 class="alert alert-danger">요청하신 페이지를 찾을 수 없습니다.</h2>
		</div>
		<br><br>
		<div class="contain">
		<p><%=request.getRequestURL()%></p>
		<p>
			<a href="products.jsp" class="btn" style="text-decoration:none; background-color:black; color:white;">돌아가기</a>
		</p>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>	
</body>
</html>
