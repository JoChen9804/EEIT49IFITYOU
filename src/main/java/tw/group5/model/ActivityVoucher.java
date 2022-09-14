package tw.group5.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name = "voucher")
@Component
public class ActivityVoucher implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "voucherid")
	private int voucherId;
	
	@Column(name = "voucher")
	private String voucherNo;
	
	@Column(name = "A_account")
	private String A_account;
	
	@Column(name = "voucherTitle")
	private String voucherTitle;
	
	@Column(name = "expiryTime")
	private String expiryTime;
	
	@Column(name = "voucherContent")
	private String voucherContent;
	
	@Column(name = "reviseTime")
	private String reviseTime;
	
	@Column(name = "photoData")
	private String photoData;
	
	public ActivityVoucher() {
	}
	
	public int getVoucherId() {
		return voucherId;
	}

	public void setVoucherId(int voucherId) {
		this.voucherId = voucherId;
	}

	public String getVoucherNo() {
		return voucherNo;
	}
	public void setVoucherNo(String voucherNo) {
		this.voucherNo = voucherNo;
	}
	public String getA_account() {
		return A_account;
	}
	public void setA_account(String a_account) {
		A_account = a_account;
	}
	public String getVoucherTitle() {
		return voucherTitle;
	}
	public void setVoucherTitle(String voucherTitle) {
		this.voucherTitle = voucherTitle;
	}
	public String getExpiryTime() {
		return expiryTime;
	}
	public void setExpiryTime(String expiryTime) {
		this.expiryTime = expiryTime;
	}
	public String getVoucherContent() {
		return voucherContent;
	}
	public void setVoucherContent(String voucherContent) {
		this.voucherContent = voucherContent;
	}
	public String getReviseTime() {
		return reviseTime;
	}
	public void setReviseTime(String reviseTime) {
		this.reviseTime = reviseTime;
	}

	public String getPhotoData() {
		return photoData;
	}

	public void setPhotoData(String photoData) {
		this.photoData = photoData;
	}
	
	
	
}
