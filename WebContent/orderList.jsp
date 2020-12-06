<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
		String sessionId = (String) session.getAttribute("sessionId");
	%>
	<%@ include file="dbconn.jsp"%>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>ORDER LIST</h4>
			<hr>
		</div>
	<div class="contain">
		<div style="padding-top: 50px; width: 900px; margin: 0 auto;">
			<!-- margin 0 auto 가운데 -->
			<br>
			<table class="table table-hover">
				<tr>
					<th>상품 사진</th>
					<th>상품 이름</th>
					<th>주문 수량</th>
					<th>###</th>
					<th>상품 현황</th>
				</tr>
	<%
	String sql="select * from orderlist where sessionid= '"+sessionId+"'";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int sum=0;
		while (rs.next()) {
			String name = rs.getString("name");
			String filename = rs.getString("filename");
			int quantity = rs.getInt("quantity");
			int price = rs.getInt("price");
			
			int total=price*quantity;
			sum+=total;
	%>
				<tr>
					<td class="imgtd"><img class="cartimg"
						src="./resources/images/<%=filename%>"></td>
					<td class="cartdes" style="width: 400px"><%=name%></td>
					<td class="cartdes" style="width: 100px"><%=quantity%></td>
					
					<td class="cartdes" style="width: 100px"><%=total%></td>
					<td class="cartdes" style="width: 100px; color: blue;">결제 완료</td>
				</tr>
				<%
					}
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
		</div>
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>