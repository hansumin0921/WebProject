<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp" %>
<%
	String filename = "";
	String realFolder="C://eclipse//WebProject//WebProject//WebContent//resources//images/";
	String encType = "utf-8"; //인코딩 타입
	int maxSize = 5 * 1024 * 1024; //최대 업로드될 파일의 크기5Mb

	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType,
			new DefaultFileRenamePolicy());
	String productId=multi.getParameter("productId");
	String name=multi.getParameter("name");
	String fixedPrice=multi.getParameter("fixedPrice");
	String discount=multi.getParameter("discount");
	String description=multi.getParameter("description");
	String brand=multi.getParameter("brand");
	String category=multi.getParameter("category");
	String unitsInStock=multi.getParameter("unitsInStock");

	Integer price;

	if (fixedPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(fixedPrice);
	Integer dis;
	if(discount.isEmpty())
	{
		dis=0;//discount가 비어있다면 0으로 취급
	}
	else
		dis=Integer.valueOf(discount);//string을 integer로
	long stock;

	if (unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);

	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);	

	
		String sql = "select * from product where p_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productId);
		rs = pstmt.executeQuery();

		if (rs.next()) {
			if (fileName != null) {
				sql = "UPDATE product SET p_name=?, p_fixedPrice=?, p_disCount=?, p_description=?, p_brand=?, p_category=?, p_unitsInStock=?, p_fileName=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setInt(3, dis);
				pstmt.setString(4,description);
				pstmt.setString(5, brand);
				pstmt.setString(6, category);
				pstmt.setLong(7,stock);
				pstmt.setString(8, fileName);
				pstmt.setString(9, productId);
				pstmt.executeUpdate();
			} else {
				sql = "UPDATE product SET p_name=?, p_fixedPrice=?, p_disCount=?, p_description=?, p_brand=?, p_category=?, p_unitsInStock=? WHERE p_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setInt(2, price);
				pstmt.setInt(3, dis);
				pstmt.setString(4,description);
				pstmt.setString(5, brand);
				pstmt.setString(6, category);
				pstmt.setLong(7, stock);
				pstmt.setString(8, productId);
				pstmt.executeUpdate();
			}
		}
	if (rs != null)
		rs.close();
 	if (pstmt != null)
 		pstmt.close();
 	if (conn != null)
		conn.close();

	response.sendRedirect("editProduct.jsp?edit=update");
%>


