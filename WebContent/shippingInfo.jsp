<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<% 	
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/webproject"
	driver="com.mysql.jdbc.Driver" user="root" password="0909" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>

</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>CHECKOUT</h4>
			<hr>
		</div>
	<c:forEach var="row" items="${resultSet.rows}">
	<div class="contain">
		<form action="./processShippingInfo.jsp"  method="post">
			<input type="hidden" name="cartId" value="<%=request.getParameter("cartId")%>" />
			<div class="form-group row">	
				<label class="col-sm-2"><b>주문자 정보확인</b></label>
				
			</div>
			<div class="form-group row">
				<label class="col-sm-2">이름</label><div class="col-sm-3"><input type="text" class="form-control" placeholder="name"
						value="<c:out value='${row.name }'/>" /></div>
			</div>
			<div class="form-group row">	
				<label class="col-sm-2">전화번호</label>
				<div class="col-sm-3">
					<input name="phone" type="text" class="form-control" placeholder="phone" value="<c:out value='${row.phone}'/>">
				</div>
			</div>
			<hr>
			<hr>
			<div class="form-group row">	
				<label class="col-sm-2"><b>배송지 정보</b></label>
				
			</div>
			<div class="form-group row">	
				<label class="col-sm-2">희망 배송날짜</label>
				<div class="col-sm-3">
					<input name="shippingDate" type="text" class="form-control" placeholder="yyyy/mm/dd"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">국가명</label>
				<div class="col-sm-3">
					<input name="country" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">우편번호</label>
				<div class="col-sm-3">
					<input name="zipCode" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">주소</label>
				<div class="col-sm-5">
					<input name="addressName" type="text" class="form-control" />
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<a href="./cart.jsp?cartId=<%=request.getParameter("cartId")%>" class="btn btn-secondary" role="button"> 이전 </a> 
					<input	type="submit" class="btn btn-primary" value="등록" />
					<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button"> 취소 </a>
				</div>
			</div>
		</form>
	</div>
	</c:forEach>
	<hr>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
