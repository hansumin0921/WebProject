<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>

<style>
#image {
	width: 450px;
	height: 500px;
	margin: 30px 55px;
	border-radius: 10px;
}

#des {
	width: 500px;
	height: 500px;
	border: 10px solid white;
	border-radius: 10px;
	margin: 30px 55px;
	padding: 5px 20px;
	overflow: hidden;
}

#middle {
	padding: 10px;
	overflow: hidden;
}

#box {
	width: 400px;
	height: 100px;
	margin: 0 auto;
	
	overflow: hidden;
}
#box2{
	float:right;
	top:100%;
}
.btn{
	text-decoration:none;
	background-color:black;
	color:white;
}
@media screen and (max-width:767px){
		#image {
	width:150px;
	height:150px;
	float:none;
	margin: 0px;
}
#box {
	width:auto;
	margin:auto;
	
	overflow: hidden;
}
#box2{
	float:none;
}
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp" />
		<hr>
		<%
			String id = request.getParameter("id");
		%>
		<div id="middle" class="container">
			<%@ include file="dbconn.jsp" %>
			<%
				String sql = "select * from product where p_id='"+id+"'";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="media">
				<img id="image" src="./resources/images/<%=rs.getString("p_fileName")%>">
				<div id="des">
					<br>
					<h6><%=rs.getString("p_brand")%></h6>
					<br>
					<h5><%=rs.getString("p_name")%></h5>
					<br> <br>
					<%
						int discount=Integer.parseInt(rs.getString("p_disCount"));
						if(discount==0){ 
					%>
					<div class="row">
						<p class="col-sm-8"><b>판매가</b></p>
						<p class="col-sm-4"><%=rs.getString("p_fixedPrice")%>&nbsp;원
						</p>
					</div>
					<div class="row">
						<p>&nbsp;
					</div>
					<div class="row">
						<p>&nbsp;
					</div>
					<%
						} else {
					%>
					<div class="row">
						<p class="col-sm-8"><b>정가</b></p>
						<p class="col-sm-4"><%=rs.getString("p_fixedPrice")%>&nbsp;원
						</p>
					</div>
					<div class="row">
						<p class="col-8"><b>판매가</b></p>
						<%
							int fixedprice=Integer.parseInt(rs.getString("p_fixedPrice"));
							int disprice=fixedprice-discount;
						%>
						<p class="col-sm-4"><%=disprice%>&nbsp;원
						</p>
					</div>
					<div class="row">
						<p class="col-sm-8" style="color:red;"><b>할인금액</b></p>
						<p class="col-sm-4" style="color:red;"><%=rs.getString("p_disCount") %>&nbsp;원
						</p>
					</div>
					<%
						}
					%>
					<br>
					<div id="box">			
					</div>
					<p>
					<div id="box2">
					<form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%>" method="post">
						<a href="./cart.jsp" class="btn">CART</a> 
						<a href="#" class="btn" onclick="addToCart()">BUY NOW</a>
						<a href="./products.jsp" class="btn">LIST</a>
					</form>
					</div>
				</div>
		</div>
		</div>
		<hr>
		<div>
			<p style="border-bottom: 1px solid black;"><b>상세 정보</b>
			<div><%=rs.getString("p_description")%></div>
		</div>
		<%	
			}
			if(rs!=null)
				rs.close();
			if(pstmt!=null)
				pstmt.close();
			if(conn!=null)
				conn.close();
		%>
		<hr>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>