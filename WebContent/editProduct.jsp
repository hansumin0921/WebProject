<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다!!") == true)
			location.href = "./deleteProduct.jsp?id=" + id;
		else return;
	}
</script>
<style>
	#name1{
		margin:5px;
		overflow: hidden;
	}
	#update{
		background-color:white;
		border:1px solid black;
		color:black;
	}
	#remove{
		background-color:white;
		border:1px solid black;
		color:red;
	}
</style>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>EDIT&nbsp;&nbsp;|&nbsp;&nbsp;REMOVE</h4>
			<hr>
		</div>
		<div class="contain">
			<div class="row" align="center">
				<%@ include file="dbconn.jsp" %>
				<%
					String sql = "select * from product";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while (rs.next()) {
				%>
				<%
					/* for (int i = 0; i < listOfProducts.size(); i++) {
						Product product = listOfProducts.get(i); */

						/* if (product.getDiscount() == 0) { */
							int discount=Integer.parseInt(rs.getString("p_disCount"));
							if(discount==0){
				%>
				<div style="width:250px; float:left; margin: 22px;" class="menu btn btn-light">
					<img id="image" src="./resources/images/<%=rs.getString("p_fileName")%>"style="width: 100%">
					<p id="name1"><%=rs.getString("p_name")%></p>
					<p id="name1">
						<b><%=rs.getString("p_fixedPrice")%>원</b>
					</p>
					<p>
					<%
						if (edit.equals("update")) {
					%>
					<a id="update"href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"	class="btn btn-success" role="button">UPDATE</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a id="remove" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">REMOVE</a>
					<%
						}
					%>
				</div>
				<%
					} else {
							int fixedprice=Integer.parseInt(rs.getString("p_fixedPrice"));
							int disprice=fixedprice-discount;
				%>
				<div style="width:250px; float:left; margin: 22px;" class="menu btn btn-light"
					onclick="location.href='./product.jsp?id=<%=rs.getString("p_id")%>';">
					<img id="image" src="./resources/images/<%=rs.getString("p_fileName")%>" style="width: 100%">
					<p id="name1"><%=rs.getString("p_name")%></p>
					<p id="name1" style="color: #D4D5DD"><STRIKE><%=rs.getString("p_fixedPrice")%>원</STRIKE>
					<span id="name1" style="color: black"><b><%=disprice%>원</b></span>
					<p>
					<%
						if (edit.equals("update")) {
					%>
					<a id="update" href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>"	class="btn btn-success" role="button">UPDATE</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a id="remove" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">REMOVE</a>
					<%
						}
					%>
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