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
	.box{
		width:250px;
		border:1px solid black;
		margin:5px auto;
		margin-bottom:1px;
		padding:10px;
	}
	.name{
		margin:10px;
	}
	.box2{
		width:250px;
		border:1px solid black;
		margin:0 auto;
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<div><span style="font-size:55px;"><b>&nbsp;&nbsp;BLACK FRIDAY</b></span><span style="color:red; font-size:55px;"><b>&nbsp;EVENT</b></span></div>
		<br><br>
		<div class="row" align="center">
			<div class="box">
				<img style="width:100%" src="./resources/images/'C0001.jpg'">
				<p class="name">1
			</div>
			<div class="box">
				<img style="width:100%" src="./resources/images/'C0001.jpg'">
				<p class="name">2
			</div>
			<div class="box">
				<img style="width:100%" src="./resources/images/'C0001.jpg'">
				<p class="name">3
			</div>
		</div>
		<div class="row" align="center">
			<div class="box2">
				<p class="name">1
			</div>
			<div class="box2">
				<p class="name">2
			</div>
			<div class="box2">
				<p class="name">3
			</div>
		</div>
		<hr>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>