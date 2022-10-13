package tw.group5.order.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "order_information")
@Component
public class Order {
	
	@Id
	@Column(name = "ORDERNO")
	private String orderNo;
	
	@Column(name = "ACCOUNT")
	private String account;
	
	@Column(name = "ORDERSTATUS")
	private String orderStatus;

	@Column(name = "ORDERTIME")
	private String orderTime;
	
	@Column(name = "PAYTYPE")
	private String payType;
	
	@Column(name = "PAYSTATUS")
	private String payStatus;
	
	@Column(name = "PAYTIME")
	private String payTime;
	
	@Column(name = "ECTRADENO")
	private String ecTradeNo;
	
	@Column(name = "COMMODITYSUBTOTAL")
	private int commoditySubtotal;
	
	@Column(name = "VOUCHERNO")
	private String voucherNo; 
	
	@Column(name = "VOUCHERDISCOUNT")
	private int voucherDiscount;
	
	@Column(name = "SHIPPINGTYPE")
	private String shippingType;
	
	@Column(name = "SHIPPINGFEE")
	private String shippingFee;
	
	@Column(name = "ORDERTOTAL")
	private int orderTotal;
	
	@Column(name = "PICKERNAME")
	private String pickerName;

	@Column(name = "PICKERCELLPHONE")
	private String pickerCellphone;

	@Column(name = "STOREID")
	private String storeID;
	
	@Column(name = "STORENAME")
	private String storeName;
	
	@Column(name = "DELIVERYADDRESS")
	private String deliveryAddress;
	
	@Column(name = "DELIVERYNO")
	private String deliveryNo;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "orderNo",cascade = CascadeType.ALL)
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();
	

	public Order() {
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(String orderTime) {
		this.orderTime = orderTime;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getPayStatus() {
		return payStatus;
	}

	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}

	public String getPayTime() {
		return payTime;
	}

	public void setPayTime(String payTime) {
		this.payTime = payTime;
	}

	public String getEcTradeNo() {
		return ecTradeNo;
	}

	public void setEcTradeNo(String ecTradeNo) {
		this.ecTradeNo = ecTradeNo;
	}

	public int getCommoditySubtotal() {
		return commoditySubtotal;
	}

	public void setCommoditySubtotal(int commoditySubtotal) {
		this.commoditySubtotal = commoditySubtotal;
	}

	public String getVoucherNo() {
		return voucherNo;
	}

	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}

	public int getVoucherDiscount() {
		return voucherDiscount;
	}

	public void setVoucherDiscount(int voucherDiscount) {
		this.voucherDiscount = voucherDiscount;
	}

	public String getShippingType() {
		return shippingType;
	}

	public void setShippingType(String shippingType) {
		this.shippingType = shippingType;
	}

	public String getShippingFee() {
		return shippingFee;
	}

	public void setShippingFee(String shippingFee) {
		this.shippingFee = shippingFee;
	}

	public int getOrderTotal() {
		return orderTotal;
	}

	public void setOrderTotal(int orderTotal) {
		this.orderTotal = orderTotal;
	}

	public String getPickerName() {
		return pickerName;
	}

	public void setPickerName(String pickerName) {
		this.pickerName = pickerName;
	}

	public String getPickerCellphone() {
		return pickerCellphone;
	}

	public void setPickerCellphone(String pickerCellphone) {
		this.pickerCellphone = pickerCellphone;
	}
	
	public String getStoreID() {
		return storeID;
	}

	public void setStoreID(String storeID) {
		this.storeID = storeID;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getDeliveryNo() {
		return deliveryNo;
	}

	public void setDeliveryNo(String deliveryNo) {
		this.deliveryNo = deliveryNo;
	}

	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
	
	
}
