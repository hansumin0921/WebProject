<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<style>
	.box{
		width:250px;
		margin:5px auto;
		margin-bottom:1px;
		padding:10px;
	}
	.name{
		margin:10px;
	}
	.box2{
		width:250px;
		margin:0 auto;
		padding:20px;
	}
	img{
		border-radius:5px;
	}
	.title-font{
		font-size:50px;
		}
	@media screen and (max-width:767px){
		.box{
			width:120px;
			
		}
		.title-font{
		font-size:30px;
		}
		.box2{
		width:120px;
	}
	}
</style>
</head>
<body>
	<%
		String sessionId = (String) session.getAttribute("sessionId");
	%>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<%@ include file="dbconn.jsp"%>
		<div><span class="title-font"><b>&nbsp;&nbsp;BLACK FRIDAY</b></span><span style="color:red;" class="title-font"><b>&nbsp;EVENT</b></span></div>
	<hr>
	<br>
	<div style="text-align:center; font-size: 20px;	"><b>랜덤뽑기</b></div><br>
	<div style="text-align:center; color:red; font-size:10px;">*하나를 선택하고 버튼을 눌러주세요!</div>
	<div style="text-align:center; color:red; font-size:10px;">당첨시 적립금&nbsp;<span style="color:red; font-size:12px;"><b>3000점&nbsp;</b></span>을 지급해드립니다!</div>
	<br>
	<div class="row" align="center">
			<div class="box">
				<img style="width:100%" src="./resources/images/event.jpg">
				<p class="name">
			</div>
			<div class="box">
				<img style="width:100%" src="./resources/images/event.jpg">
				<p class="name">
			</div>
			<div class="box">
				<img style="width:100%" src="./resources/images/event.jpg">
				<p class="name">
			</div>
		</div>
	<form action="test_process.jsp" name="frm" method="post">
	<div class="row" align="center">
		<p class="box2"><input type="radio" name="eventnum" value="1" checked>
 
		<p class="box2"><input type="radio" name="eventnum" value="2">

		<p class="box2"><input type="radio"name="eventnum" value="3">
	</div>
		<br>
		<br>
		
		<%if(sessionId!=null){
			String sql = "select id from event1 where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,sessionId);
			rs = pstmt.executeQuery();
			if(rs.next()){
		%>
			
		<p style="color: red; font-size: 11px; margin:0 auto;"><b>이미 한번 참여 하셨습니다.</b>
		<p><input class="btn btn secondary" style="border-radius:8px;"type="submit" value="참여 완료" disabled />
		<%}else{%>
			<p style="color: red; font-size: 10px;">
			<p><input class="btn btn secondary" style="border-radius:8px;"type="submit" value="참여 하기"/>
		
		<% 
			} }else{
		%>
			<p style="color: red; font-size: 11px; margin:0 auto;"><b>로그인이 필요한 이벤트입니다.</b>
			<p><input class="btn btn secondary" style="border-radius:8px;"type="submit" value="참여 하기" disabled/>
		<%
			}
		%>
	</form>
	<%
	if(sessionId!=null){
			String sql2="select win from event1 where id=?";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1,sessionId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				String w=rs.getString("win");
				if(w.equals("당첨"))
				{
					%>
					<p style="color:blue;">축하드립니다. 적립금 지급되었습니다.
					<%
				}
				else if(w.equals("낙첨")){
					%>
					<p style="color:blue; font-size: 10px;">당첨되지 않으셨습니다. 다음에 다시 도전해주세요.
					<%
					}
			}
	}if(rs!=null)
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