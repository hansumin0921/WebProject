<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		String id=request.getParameter("cartId");
		if(id==null||id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		/* session.invalidate(); */
		session.removeAttribute("cartlist");
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>