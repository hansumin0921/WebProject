<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<%@ include file="dbconn.jsp"%>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"></jsp:include>
		<%
		String productId = request.getParameter("id");
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();
		if (rs.next()) {
		%>
		<br>
		<div class="main-header">
			<h4><%=rs.getString("p_id") %></h4>
			<hr>
		</div>
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="./resources/images/<%=rs.getString("p_fileName")%>" alt="image" style="width: 100%" />
			</div>
			<div class="col-md-7">
				<form name="newProduct" action="./processUpdateProduct.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">상품 ID</label>
						<div class="col-sm-3">
							<input type="text" id="productId" name="productId"
								class="form-control" value='<%=rs.getString("p_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">상품명</label>
						<div class="col-sm-3">
							<input type="text" id="name" name="name" class="form-control"
								value="<%=rs.getString("p_name")%>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">상세 정보</label>
						<div class="col-sm-5">
							<textarea name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("p_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">브랜드</label>
						<div class="col-sm-3">
							<input type="text" name="brand" class="form-control"
								value="<%=rs.getString("p_brand")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">분류</label>
						<div class="col-sm-3">
							<input type="text" name="category" class="form-control"
								value="<%=rs.getString("p_category")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">정가</label>
						<div class="col-sm-3">
							<input type="text" name="fixedPrice" class="form-control"
								value="<%=rs.getString("p_fixedPrice")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">할인</label>
						<div class="col-sm-3">
							<input type="text" id="discount" name="discount"
								class="form-control" value="<%=rs.getString("p_disCount")%>">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">제고수</label>
						<div class="col-sm-3">
							<input type="text" id="unitsInStock" name="unitsInStock"
								class="form-control" value="<%=rs.getLong("p_unitsInStock")%>">
						</div>
					</div>
					
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm-5">
							<input type="file" name="productImage" class="form-control">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10 ">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>

			</div>
		</div>
	</div>
	<%
		}
		if (rs != null)
			rs.close();
 		if (pstmt != null)
 			pstmt.close();
 		if (conn != null)
			conn.close();
 	%>
 	<hr>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
