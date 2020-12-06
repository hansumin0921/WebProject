<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="page.css" />
<link rel ="stylesheet" href ="./resources/css/bootstrap.min.css" />
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>Insert title here</title>
<style>
	#box{
		padding: 50px 5px;
	}
</style>
</head>
<body>
	<fmt:setLocale value='<%=request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4 style="font-size:30px;">&nbsp;Registeration</h4>
			<hr>
		</div>
	<br>
	<div class="container">
		<div class="text-right">
			<a href="?language=ko" style="color:black; text-decoration:none;">한국어</a>|<a href="?language=en" style="color:black; text-decoration:none;">ENGLSIH</a>
		</div>
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId"/></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="name"/></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="brand"/></label>
				<div class="col-sm-3">
					<input type="text" name="brand" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="fixedPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="fixedPrice" name="fixedPrice" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="discount"/></label>
				<div class="col-sm-3">
					<input type="text" name="discount" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage"/></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control"/>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	<hr>
	</div>
	<jsp:include page="footer.jsp"/>
	</fmt:bundle>
</body>
</html>