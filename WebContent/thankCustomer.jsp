<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLDecoder"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.util.ArrayList"%>
</head>
<body>
<%@include file="dbconn.jsp"%>
<%
	String sessionId = (String) session.getAttribute("sessionId");
	ArrayList<Product>cartList=(ArrayList<Product>)session.getAttribute("cartlist");
	int num=0;
	
	for(int i=0; i<cartList.size(); i++){
		
		Product product=cartList.get(i);
		String name=product.getName();
		String filename=product.getFilename();
		int quantity=product.getQuantity();
		int price=product.getDisPrice();
		String productId=product.getProductId();
		String nums=Integer.toString(num);
		String ordercode=productId.concat(nums);
		
		String sql = "insert into orderlist values(?,?,?,?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,ordercode);
		pstmt.setString(2,sessionId);
		pstmt.setString(3,name);
		pstmt.setString(4,filename);
		pstmt.setInt(5,quantity);
		pstmt.setInt(6,price);
		pstmt.executeUpdate();
		
		num++;
		
	}
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
%>
	<%
		String shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";		

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if (n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()), "utf-8");
				if (n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			}
		}
	%>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>THANK YOU</h4>
			<hr>
		</div>
		<div class="contain">
		<h2 class="alert alert-danger col-sm-4">주문이 완료되었습니다</h2>
		<p>	주문은	<%	out.println(shipping_shippingDate);	%>에 배송될 예정입니다! !	
		<p>	주문번호 :	<%	out.println(shipping_cartId);	%>		
	</div>
	<div class="contain">
		<p>	<a href="./products.jsp" class="btn btn-secondary"> &laquo; 상품 목록</a>		
	</div>
	<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
<%
	session.removeAttribute("cartlist");

	for (int i = 0; i < cookies.length; i++) {
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		if (n.equals("Shipping_cartId"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_name"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_shippingDate"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_country"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_zipCode"))
			thisCookie.setMaxAge(0);
		if (n.equals("Shipping_addressName"))
			thisCookie.setMaxAge(0);
		
		response.addCookie(thisCookie);
	}
%>
