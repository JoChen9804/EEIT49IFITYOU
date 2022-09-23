package tw.group5.activity.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import tw.group5.admin.model.MemberBean;

@Entity
@Table(name = "promotions")
@Component
public class ActivityPromotions implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "memberid")
	private MemberBean member;
	
	@ManyToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "voucherid")
	private ActivityVoucher voucher; 
	
	@Column(name = "a_account")
	private String a_account;
	
	@Column(name = "revisetime")
	private String reviseTime;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public MemberBean getMember() {
		return member;
	}

	public void setMember(MemberBean member) {
		this.member = member;
	}

	public ActivityVoucher getVoucher() {
		return voucher;
	}

	public void setVoucher(ActivityVoucher voucher) {
		this.voucher = voucher;
	}

	public String getA_account() {
		return a_account;
	}

	public void setA_account(String a_account) {
		this.a_account = a_account;
	}

	public String getReviseTime() {
		return reviseTime;
	}

	public void setReviseTime(String reviseTime) {
		this.reviseTime = reviseTime;
	}
	
}
