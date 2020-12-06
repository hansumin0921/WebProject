<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<%
	String sessionId=(String)session.getAttribute("sessionId");
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

		<nav id="main-navigation">
			<div class="pull-left">
				<ul class="outer-menu">
					<li class="outer-menu-item"><span id="home" style="color:red"><a href="./test.jsp">EVENT</a></span></li>
						
					<!-- <li class="outer-menu-item"><span class="menu-title">SHOP</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="#">FOOD</a></li>
							<li class="inner-menu-item"><a href="#">SNACKS</a></li>
							<li class="inner-menu-item"><a href="#">CLOTEHS</a></li>
						</ul>
					</li> -->
					<li class="outer-menu-item"><span class="menu-title">SHOP</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="./products.jsp">ALL</a></li>
							<li class="inner-menu-item"><a href="./food.jsp">FOOD</a></li>
							<li class="inner-menu-item"><a href="./snack.jsp">SNACK</a></li>
							<li class="inner-menu-item"><a href="./clothes.jsp">CLOTHES</a></li>
						</ul>
					</li>
					<!-- <li class="outer-menu-item"><span class="menu-title">MANAGE</span>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="./addProduct.jsp">REGISTER</a></li>
							<li class="inner-menu-item"><a href="./editProduct.jsp?edit=update">EDIT</a></li>
							<li class="inner-menu-item"><a href="./editProduct.jsp?edit=delete">REMOVE</a></li>
						</ul>
					</li> -->
				</ul>
			</div>
			<c:choose>
				<c:when test="${empty sessionId }">
					<li id="w" class="outer-menu-item"><a class="menu-title" style="color:black; text-decoration:none;" href="./cart.jsp">Cart</a></li>
					<li id="w" class="outer-menu-item"><a class="menu-title" style="text-decoration:none; color:black;" href="<c:url value="addMember.jsp"/>">Join</a></li>
					<li id="w" class="outer-menu-item"><a class="menu-title" style="text-decoration:none; color:black;" href="<c:url value="loginMember.jsp"/>">Login</a></li>
				</c:when>
				<c:when test="${sessionId=='kgu'}">
					<li id="w" class="outer-menu-item"><a class="menu-title" href="<c:url value="logoutMember.jsp"/>">Logout</a></li>
					<li id="w" class="outer-menu-item"><a class="menu-title">Manager</a>
						<ul class="inner-menu">
							<li class="inner-menu-item"><a href="./addProduct.jsp">REGISTER</a></li>
							<li class="inner-menu-item"><a href="./editProduct.jsp?edit=update">EDIT</a></li>
							<li class="inner-menu-item"><a href="./editProduct.jsp?edit=delete">REMOVE</a></li>
						</ul>
					</li>
					<div id="w" class="outer-menu-item"><span style="color:red;">관리자</span>님</div>
				</c:when>
				<c:otherwise>
					<li id="w" class="outer-menu-item"><a class="menu-title" style="color:black; text-decoration:none;" href="./cart.jsp">Cart</a></li>
					
					<li id="w" class="outer-menu-item"><a class="menu-title" style="text-decoration:none; color:black;" href="<c:url value="logoutMember.jsp"/>">Logout</a></li>
					<li id="w" class="outer-menu-item"><a class="menu-title">MY PAGE</a>
						<ul class="inner-menu">
							<c:forEach var="row" items="${resultSet.rows}"><li class="inner-menu-item" style="font-size: 13px;"><b>POINT:</b><c:out value='${row.point}'/></li></c:forEach>
							<li class="inner-menu-item"><a style="font-size: 13px;" href="updateMember.jsp">EDIT INFO.</a></li>
							<li class="inner-menu-item"><a href="./orderList.jsp">ORDER LIST</a></li>
						</ul>
					</li>
					<div id="w" class="outer-menu-item"><span style="color:blue;"><%=sessionId%></span><span>님</span></div>
				</c:otherwise>
			</c:choose>
		</nav>
</body>