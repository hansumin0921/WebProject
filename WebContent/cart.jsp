<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.*" %>
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
	.imgtd{
		width: 120px;
	}
	.cartimg{
		width:100%;
		padding: 10px;
	}
	.cartdes{
		line-height:150px;
	}
	table{
		text-align:center;
	}
</style>
</head>
<body>
<%
	String sessionId=(String)session.getAttribute("sessionId");
	if(sessionId==null)
	{
		response.sendRedirect("loginMember.jsp");
	}
	else{
	String cartId = session.getId();
%>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>CART</h4>
			<hr>
		</div>
		<div class="contain">
			<div style="padding-top:50px; width:900px; margin: 0 auto;"><!-- margin 0 auto 가운데 -->
				<table width="100%">
					<tr>
						<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId%>" class="btn" style="background-color:white; color:black; border:1px solid black;">전체삭제</a></td>
						<td align="right"><a href="./shippingInfo.jsp?cartId=<%=cartId%>" class="btn" style="background-color:white; color:black; border:1px solid black;">주문</a></td>
					</tr>
				</table>
				<br>
				<table class="table table-hover">
					<%
						int sum=0;
						ArrayList<Product>cartList=(ArrayList<Product>)session.getAttribute("cartlist");
						if(cartList==null){
								cartList=new ArrayList<Product>();
						}
						for(int i=0; i<cartList.size(); i++){
							Product product=cartList.get(i);
							int total=product.getDisPrice()*product.getQuantity();
							sum=sum+total;
					%>
					<tr>
						<td class="imgtd"><img class="cartimg" src="./resources/images/<%=product.getFilename()%>"></td>
						<td class="cartdes" style="width:250px"><%=product.getName() %></td>
						<td class="cartdes" style="width:100px"><%=product.getQuantity() %></td>
						<td class="cartdes" style="width:100px"><%=total %></td>
 					    <td class="cartdes" style="width:20px"><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
					</tr>
					<% }%>
					<tr>
						<th></th>
						<th></th>
						<th></th>
						<th>총액</th>
						<th><%=sum %></th>
					</tr>
				</table>
				<a href="./products.jsp" class="btn" style="background-color:white; color:black; border:1px solid black;">&laquo;쇼핑계속하기</a>
			</div>
		</div>
		<hr>
	</div>
	<%} %>
	<jsp:include page="footer.jsp"/>
</body>
</html>