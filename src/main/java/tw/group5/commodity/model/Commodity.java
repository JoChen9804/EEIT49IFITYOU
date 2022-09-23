package tw.group5.commodity.model;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="commodity")
@Component(value="commodity")
public class Commodity {
    
	@Id
	@Column(name="COMMODITYNO")
	private Integer commodityNo;
	
	@Column(name="COMMODITYTYPE")
	private String commodityType;
	
	@Column(name="COMMODITYNAME")
	private String commodityName;
	
	@Column(name="COMMODITYSTYLE")
	private String commodityStyle;
	
	@Column(name="COMMODITYPRICE")
	private int commodityPrice;
	
	@Column(name="COMMODITYINVENTORY")
	private int commodityInventory;
	
	@Column(name="IMAGE1")
	private String image1;
	
	@Column(name="IMAGE2")
	private String image2;
	
	@Column(name="IMAGE3")
	private String image3;
	
	@Column(name="IMAGE4")
	private String image4;
	
	@Column(name="IMAGE5")
	private String image5;
	
	@Column(name="COMMODITYDESCRIPTION")
	private String commodityDescription;
	
	@Column(name="ONSHELF")
	private boolean onShelf;

	
	public Commodity() {
	}
	
	public Commodity(Integer commodityNo, String commodityType, String commodityName, String commodityStyle, int commodityPrice, 
			int commodityInventory, String image1, String image2, String image3, String image4, String image5, String commodityDescription, boolean onShelf) {
        super();
		this.commodityNo = commodityNo;
		this.commodityType = commodityType;
		this.commodityName = commodityName;
		this.commodityStyle = commodityStyle;
		this.commodityPrice = commodityPrice;
		this.commodityInventory = commodityInventory;
		this.image1 = image1; 
		this.image2 = image2;
		this.image3 = image3;
		this.image4 = image4;
		this.image5 = image5;
		this.commodityDescription = commodityDescription;
		this.onShelf = onShelf;
	}

	public Integer getCommodityNo() {
		return commodityNo;
	}

	public void setCommodityNo(Integer commodityNo) {
		this.commodityNo = commodityNo;
	}

	public String getCommodityType() {
		return commodityType;
	}

	public void setCommodityType(String commodityType) {
		this.commodityType = commodityType;
	}

	public String getCommodityName() {
		return commodityName;
	}

	public void setCommodityName(String commodityName) {
		this.commodityName = commodityName;
	}

	public String getCommodityStyle() {
		return commodityStyle;
	}

	public void setCommodityStyle(String commodityStyle) {
		this.commodityStyle = commodityStyle;
	}

	public int getCommodityPrice() {
		return commodityPrice;
	}

	public void setCommodityPrice(int commodityPrice) {
		this.commodityPrice = commodityPrice;
	}

	public int getCommodityInventory() {
		return commodityInventory;
	}

	public void setCommodityInventory(int commodityInventory) {
		this.commodityInventory = commodityInventory;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}

	public String getImage4() {
		return image4;
	}

	public void setImage4(String image4) {
		this.image4 = image4;
	}

	public String getImage5() {
		return image5;
	}

	public void setImage5(String image5) {
		this.image5 = image5;
	}

	public String getCommodityDescription() {
		return commodityDescription;
	}

	public void setCommodityDescription(String commodityDescription) {
		this.commodityDescription = commodityDescription;
	}

	public boolean getOnShelf() {
		return onShelf;
	}

	public void setOnShelf(boolean onShelf) {
		this.onShelf = onShelf;
	}
	
	

}
