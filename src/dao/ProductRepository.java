package dao;

import dto.Product;
import java.util.ArrayList;
import java.sql.*;

public class ProductRepository {
	
	String url = "jdbc:mysql://localhost:3306/webproject";
	String user = "root";
	String password = "0909";
	
	private ArrayList<Product> listOfProducts = new ArrayList<Product>();
	private static ProductRepository instance = new ProductRepository();

	public static ProductRepository getInstance(){
		return instance;
	} 

	public ProductRepository() {
		
		  Connection conn = null;	
		  PreparedStatement pstmt = null;
		  ResultSet rs = null;
		  
		  try {
				String url = "jdbc:mysql://localhost:3306/webproject";
				String user = "root";
				String password = "0909";

				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(url, user, password);
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					Product goods=new Product();
					goods.setProductId(rs.getString("p_id"));
					goods.setName(rs.getString("p_name"));
					goods.setFixedPrice(rs.getInt("p_fixedPrice"));
					goods.setDescription(rs.getString("p_description"));
					goods.setBrand(rs.getString("p_brand"));
					goods.setCategory(rs.getString("p_category"));
					goods.setUnitsInStock(rs.getLong("p_unitsInStock"));
					goods.setDiscount(rs.getInt("p_disCount"));
					goods.setFilename(rs.getString("p_fileName"));
					listOfProducts.add(goods);
				}
				rs.close();
				conn.close();
				pstmt.close();

		  } catch (Exception e) {
			}finally {
				try{if(pstmt!=null)
					pstmt.close();
			}catch(SQLException ex1) {
				}
			try {
				if(conn!=null)
					conn.close();
			}catch(SQLException ex1) {
				
			}
		}
		  System.out.println("sql close");
	}
		  public ArrayList<Product> getAllProducts() {
				return listOfProducts;
			}
			
		  public Product getProductById(String productId) {
				Product productById = null;

				for (int i = 0; i < listOfProducts.size(); i++) {
					Product product = listOfProducts.get(i);
					if (product != null && product.getProductId() != null && product.getProductId().equals(productId)) {
						productById = product;
						break;
					}
				}
				return productById;
			}
			
			public void addProduct(Product product) {
				listOfProducts.add(product);
			}

}
