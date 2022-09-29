package tw.group5.shopping.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "shopping_cart_item")
@Component
public class ShoppingCartItem {

	@Id
	@Column(name = "IDENTITYNUMBER")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer identityNumber;
	
	@Column(name = "ACCOUNT")
	private String account;
	
	@Column(name="COMMODITYNO")
	private Integer commodityNo;
    
	@Column(name = "COMMODITYPRICE")
    private int commodityPrice;
	
	@Column(name = "QUANTITY")
	private int quantity;
	
	@Column(name = "SUBTOTAL")
	private int subtotal;

	
	
	public ShoppingCartItem() {
	}

	public ShoppingCartItem(String account, Integer commodityNo, int commodityPrice, int quantity, int subtotal) {
		this.account = account;
		this.commodityNo = commodityNo;
		this.commodityPrice = commodityPrice;
		this.quantity = quantity;
		this.subtotal = subtotal;
	}




	public Integer getIdentityNumber() {
		return identityNumber;
	}

	public void setIdentityNumber(Integer identityNumber) {
		this.identityNumber = identityNumber;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public Integer getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(Integer commodityNo) {
		this.commodityNo = commodityNo;
	}

	public int getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(int commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}
	
}
