package dto;

import java.io.Serializable;;

public class Product implements Serializable{

	private static final long serialVersionUID = 5172686590827527119L;
	
	private String productId;
	private String name;
	private Integer fixedPrice;//����//�ʼ� �ۼ�!!!!
	private Integer discount;//������
//	private Integer disPrice;//���ε� ����
	private String description;
	private String brand;
	private String category;
	private long unitsInStock;
	private String filename;//�̹��� ���ϸ�
	private int quantity; //��ٱ��Ͽ� ���� ����
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String productId, String name, Integer fixedPrice) {
		this.productId = productId;
		this.name = name;
		this.fixedPrice = fixedPrice;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getFixedPrice() {
		return fixedPrice;
	}
	public void setFixedPrice(Integer fixedPrice) {
		this.fixedPrice = fixedPrice;
	}
	public Integer getDiscount() {
		return discount;
	}
	public void setDiscount(Integer discount) {
		this.discount = discount;
	}
	public Integer getDisPrice() {
		return fixedPrice-discount;
	}
	public void setDisPrice(Integer fixedPrice,Integer discount) {
		this.fixedPrice=fixedPrice;
		this.discount=discount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getUnitsInStock() {
		return unitsInStock;
	}
	public void setUnitsInStock(long unitsInStock) {
		this.unitsInStock = unitsInStock;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	
}
