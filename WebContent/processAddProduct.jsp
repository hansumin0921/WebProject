<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%-- <%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%> --%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="dbconn.jsp" %>
	<%
	request.setCharacterEncoding("UTF-8");

	String filename="";
	String realFolder="C://eclipse//WebProject//WebProject//WebContent//resources//images/";
	int maxSize=5*1024*1024;
	String encType="utf-8";
	
	MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String fixedPrice=multi.getParameter("fixedPrice");
	String discount=multi.getParameter("discount");
	String description=multi.getParameter("description");
	String brand=multi.getParameter("brand");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");
	
	//error를 줄이기 위한 코드(price,stock,discount를 empty로 두었을때)
	Integer price;
	
	if(fixedPrice.isEmpty())
	{
		price=0; //price가 비어있다면 0으로 취급
	}
	else
		price=Integer.valueOf(fixedPrice); //string을 integer로
		
	Integer dis;
	if(discount.isEmpty())
	{
		dis=0;//discount가 비어있다면 0으로 취급
	}
	else
		dis=Integer.valueOf(discount);//string을 integer로
	
	long stock;
	
	if(unitsInStock.isEmpty())
	{
		stock=0; //stock이 비어있다면 0으로취급
	}
	else
		stock=Integer.valueOf(unitsInStock); //string을 integer로
	
	Enumeration files=multi.getFileNames(); //폼페이지에 전송된 요청 파라미터 중 파일을 받도록
	String fname=(String)files.nextElement(); //enumeration 객체 타입의 next element를 받도록
	String fileName=multi.getFilesystemName(fname); //업로드된 파일을 가져오도록
	
	
	//dbconnection
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5,brand);
	pstmt.setString(6, category);
	pstmt.setLong(7, stock);
	pstmt.setInt(8, dis);
	pstmt.setString(9, fileName);
	pstmt.executeUpdate();
	
	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();
	
	
	/* ProductRepository dao=ProductRepository.getInstance();
	
	Product newProduct=new Product();
	newProduct.setProductId(productId);
	newProduct.setName(name);
	newProduct.setFixedPrice(price);
	newProduct.setDiscount(dis);	
	newProduct.setDescription(description);
	newProduct.setBrand(brand);
	newProduct.setCategory(category);
	newProduct.setUnitsInStock(stock);
	newProduct.setFilename(fileName);
	
	dao.addProduct(newProduct); */
	response.sendRedirect("products.jsp");
%>
</body>
</html>