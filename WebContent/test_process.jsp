<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- 현재 세션 아이디 받아오기 작성 -->
	<!-- db에 event 참여자 insert -->
	<%@ include file="dbconn.jsp"%>
	<%
		String sessionId=(String)session.getAttribute("sessionId");
	%>
	<%
		int a;
		Random rand=new Random();
		a=rand.nextInt(9)+1;//1부터 3까지 랜덤 숫자 생성
		
		int b;
		b=(a%3)+1;
		
		request.setCharacterEncoding("utf-8");
	
		String s=request.getParameter("eventnum");
		
		int num=Integer.parseInt(s);//string을 integer로 변경
		int point=0;
		String sql_l="select * from member where id=?";
		pstmt=conn.prepareStatement(sql_l);
		pstmt.setString(1,sessionId);
		rs=pstmt.executeQuery();
		if(rs.next()){
			point=Integer.parseInt(rs.getString("point"));
		}
		if(b==num)
			{
				int p=point+3000;
				String sql="update member set point=? where id=?";
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1,p);
				pstmt.setString(2,sessionId);
				pstmt.executeUpdate();
				
				String sql2="insert into event1 values(?,?)";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1,sessionId);
				pstmt.setString(2,"당첨");
				pstmt.executeUpdate();
						
					
			}
		else if(b!=num){
			int p=point+0;
			String sql="update member set point=? where id=?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1,p);
			pstmt.setString(2,sessionId);
			pstmt.executeUpdate();
			
			String sql2="insert into event1 values(?,?)";
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1,sessionId);
			pstmt.setString(2,"낙첨");
			pstmt.executeUpdate();
		}
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
		
		response.sendRedirect("test.jsp");
	%>
</body>
</html>