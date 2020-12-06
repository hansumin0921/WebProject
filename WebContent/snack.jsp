<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
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
	#name1{
		margin:5px;
		overflow:hidden;	
	}
	.menu{
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<%
			ProductRepository dao = ProductRepository.getInstance();
			ArrayList<Product> listOfProducts = dao.getAllProducts();
		%>
		<%@ include file="dbconn.jsp" %>
		<% 
			String sql2 = "select count(*) from product where p_id like 'S%'";
			int rowcount=0;
			pstmt=conn.prepareStatement(sql2);
			rs=pstmt.executeQuery();
			if(rs.next()){
				rowcount=rs.getInt(1);
			}
		%>
		<br>
		<div class="row">
			<span class="col-sm-4" style="font-size:20px;"><b>&nbsp;SNACK</b></span>
		</div>	
			<hr>
			<p>	<span style="color: red"><b>&nbsp;&nbsp;<%=rowcount%>&nbsp;</b></span> 개의 상품
			<hr>
		<div class="contain">
			<div class="row" align="center">
				<%
					String sql = "select * from product where p_id like 'S%'";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
				%>
					<!-- <table>
						<tr> -->
				<%
							int discount=Integer.parseInt(rs.getString("p_disCount"));
							if(discount==0){ 
				%>
					<div style="width:250px; float:left; margin: 22px;" class="btn btn-light" onclick="location.href='./product.jsp?id=<%=rs.getString("p_id")%>';">
					<img id="image" src="./resources/images/<%=rs.getString("p_fileName")%>"
						style="width: 100%">
					<p id="name1"><%=rs.getString("p_name")%></p>
					<p id="name1">
						<b><%=rs.getString("p_fixedPrice")%>원</b>
					</p>
					</div>
				<%
					 } else { 
				%>
					<div style="width:250px; float:left; margin: 22px;" class="btn btn-light" onclick="location.href='./product.jsp?id=<%=rs.getString("p_id")%>';">
					<img id="image" src="./resources/images/<%=rs.getString("p_fileName")%>"
						style="width: 100%">
					<p id="name1"><%=rs.getString("p_name")%></p>
					<p id="name1" style="color: #D4D5DD">
						<%
							int fixedprice=Integer.parseInt(rs.getString("p_fixedPrice"));
							int disprice=fixedprice-discount;
						%>
						<STRIKE><%=rs.getString("p_fixedPrice")%>원</STRIKE> <span id="name1"
							style="color: black"><b><%=disprice%>원</b></span>
					</div>
				<%
					 } 
				%>
				<%
					}
					if(rs!=null)
						rs.close();
					if(pstmt!=null)
						pstmt.close();
					if(conn!=null)
						conn.close();
				%>
			</div>
		</div>
		<hr>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>