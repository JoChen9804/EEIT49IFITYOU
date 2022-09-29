package tw.group5.activity.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int voucherId;
	
	@Column(name = "voucherno")
	private String voucherNo;
	
	@Column(name = "a_account")
	private String a_account;
	
	@Column(name = "vouchertitle")
	private int voucherTitle;
	
	@Column(name = "expirytime")
	private String expiryTime;
	
	@Column(name = "revisetime")
	private String reviseTime;

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
		return a_account;
	}

	public void setA_account(String a_account) {
		this.a_account = a_account;
	}

	public int getVoucherTitle() {
		return voucherTitle;
	}

	public void setVoucherTitle(int voucherTitle) {
		this.voucherTitle = voucherTitle;
	}

	public String getExpiryTime() {
		return expiryTime;
	}

	public void setExpiryTime(String expiryTime) {
		this.expiryTime = expiryTime;
	}

	public String getReviseTime() {
		return reviseTime;
	}

	public void setReviseTime(String reviseTime) {
		this.reviseTime = reviseTime;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
