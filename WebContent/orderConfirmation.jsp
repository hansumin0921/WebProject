<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="page.css" />
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="./resources/js/menu.js"></script>
<%
	String sessionId = (String) session.getAttribute("sessionId");
%>
<sql:setDataSource var="dataSource"
	url="jdbc:mysql://localhost:3306/webproject"
	driver="com.mysql.jdbc.Driver" user="root" password="0909" />

<sql:query dataSource="${dataSource}" var="resultSet">
   SELECT * FROM MEMBER WHERE ID=?
   <sql:param value="<%=sessionId%>" />
</sql:query>
<%
	request.setCharacterEncoding("UTF-8");

	String cartId = session.getId();

	String shipping_cartId = "";
	/* String shipping_name = ""; */
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
			/* if (n.equals("Shipping_name"))
				shipping_name = URLDecoder.decode((thisCookie.getValue()), "utf-8"); */
			if (n.equals("Shipping_shippingDate"))
				shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_country"))
				shipping_country = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_zipCode"))
				shipping_zipCode = URLDecoder.decode((thisCookie.getValue()), "utf-8");
			if (n.equals("Shipping_addressName"))
				shipping_addressName = URLDecoder.decode((thisCookie.getValue()), "utf-8");
		}
	}
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>주문 정보</title>
</head>
<body>
	<div id="page-wrapper">
		<jsp:include page="menu.jsp"/>
		<br>
		<div class="main-header">
			<h4>Check Ordering Inform.</h4>
			<hr>
		</div>

	<div class="contain">
		<div class="text-left">
			<span style="font-size:18px; color:#6B6A79"><b>주문서</b></span>
			<hr>
		</div>
		<c:forEach var="row" items="${resultSet.rows}">
		<div >
			<div align="left">
				<strong>수령인</strong><br><br><c:out value="${row.name}"></c:out><br><hr> 
				<strong>배송장소</strong><br><br>
				우편번호 : <% 	out.println(shipping_zipCode);%><br> 
				주소 : <%	out.println(shipping_addressName);%>(<%	out.println(shipping_country);%>) <br><hr>
				<span style="color:red;"><em>배송예정일: <% out.println(shipping_shippingDate);%></em></span>
				<span style="font-size:10px; color:#C5CCD2">**예정일보다 지연될 수 있는 점 양해바랍니다.**</span><br><br>
				<%-- <form action="point.jsp" method="post">
				<p>적립금:  <input type="text" name="point">
				<input type="submit" value="사용"/>
				<span style="color:gray; font-size: 8px;">보유한 적립금(  <c:out value="${row.point}"/>원  )</span>
				</form> --%>
			</div>
		</div>
		<div>
		</div>
		</c:forEach>
		<div>
			<strong>주문 내역</strong>
			<table style="border-radius:5px;"class="table table-hover">			
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">수량</th>
				<th class="text-center">가격</th>
				<th class="text-center">비고</th>
			</tr>
			<%
				int sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
				if (cartList == null)
					cartList = new ArrayList<Product>();
				for (int i = 0; i < cartList.size(); i++) { // 상품리스트 하나씩 출력하기
					Product product = cartList.get(i);
					int total=product.getDisPrice()*product.getQuantity();
					sum = sum + total;
					
				int fp=product.getFixedPrice();
				int dis=product.getDiscount();
				int price=fp-dis;
			%>
			<tr>
				<td class="text-center"><em><%=product.getName()%> </em></td>
				<td class="text-center"><%=product.getQuantity()%></td>
				<td class="text-center"><%=price%>원</td>
				<td class="text-center"><%=total%>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td> </td>
				<td> </td>
				<td class="text-right">	<strong>총액: </strong></td>
				<td class="text-center text-danger"><strong><%=sum%> </strong></td>
			</tr>
			</table>
			
				<a href="./ShippingInfo.jsp?cartId=<%=shipping_cartId%>"class="btn btn-secondary" role="button"> 이전 </a>
				<a href="./thankCustomer.jsp"  class="btn btn-success" role="button"> 주문 완료 </a>
				<a href="./checkOutCancelled.jsp" class="btn btn-secondary"	role="button"> 취소 </a>			
		</div>
	</div>
	<hr>
	<jsp:include page="footer.jsp"/>
	</div>	
</body>
</html>
